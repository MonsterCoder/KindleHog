require 'fileutils'
require 'digest/sha1'

module YARD
  # The +Registry+ is the centralized data store for all {CodeObjects} created
  # during parsing. The storage is a key value store with the object's path
  # (see {CodeObjects::Base#path}) as the key and the object itself as the value.
  # Object paths must be unique to be stored in the Registry. All lookups for 
  # objects are done on the singleton Registry instance using the {Registry.at} 
  # or {Registry.resolve} methods.
  # 
  # The registry is saved to a "yardoc" file, which can be loaded back to 
  # perform any lookups.
  # 
  # This class is a singleton class. Any method called on the class will be
  # delegated to the instance.
  module Registry
    DEFAULT_YARDOC_FILE = ".yardoc"
    LOCAL_YARDOC_INDEX = File.expand_path('~/.yard/gem_index')
    @yardoc_file = DEFAULT_YARDOC_FILE

    extend Enumerable

    class << self
      # @group Getting .yardoc File Locations

      # Returns the .yardoc file associated with a gem.
      # 
      # @param [String] gem the name of the gem to search for
      # @param [String] ver_require an optional Gem version requirement
      # @param [Boolean] for_writing whether or not the method should search
      #   for writable locations
      # @return [String] if +for_writing+ is set to +true+, returns the best 
      #   location suitable to write the .yardoc file. Otherwise, the first 
      #   existing location associated with the gem's .yardoc file.
      # @return [nil] if +for_writing+ is set to false and no yardoc file
      #   is found, returns nil.
      def yardoc_file_for_gem(gem, ver_require = ">= 0", for_writing = false)
        spec = Gem.source_index.find_name(gem, ver_require)
        return if spec.empty?
        spec = spec.first
      
        if gem =~ /^yard-doc-/
          path = File.join(spec.full_gem_path, DEFAULT_YARDOC_FILE)
          return File.exist?(path) && !for_writing ? path : nil
        end
      
        if for_writing
          global_yardoc_file(spec, for_writing) ||
            local_yardoc_file(spec, for_writing)
        else
          local_yardoc_file(spec, for_writing) ||
            global_yardoc_file(spec, for_writing)
        end
      end
    
      # Gets/sets the yardoc filename
      # @return [String] the yardoc filename
      # @see DEFAULT_YARDOC_FILE
      attr_accessor :yardoc_file
    
      # @group Loading Data from Disk
    
      # Loads the registry and/or parses a list of files
      # 
      # @example Loads the yardoc file or parses files 'a', 'b' and 'c' (but not both)
      #   Registry.load(['a', 'b', 'c'])
      # @example Reparses files 'a' and 'b' regardless of whether yardoc file exists
      #   Registry.load(['a', 'b'], true)
      # @param [String, Array] files if +files+ is an Array, it should represent
      #   a list of files that YARD should parse into the registry. If reload is
      #   set to false and the yardoc file already exists, these files are skipped.
      #   If files is a String, it should represent the yardoc file to load
      #   into the registry.
      # @param [Boolean] reparse if reparse is false and a yardoc file already
      #   exists, any files passed in will be ignored.
      # @return [Registry] the registry object (for chaining)
      # @raise [ArgumentError] if files is not a String or Array
      def load(files = [], reparse = false)
        if files.is_a?(Array)
          if File.exists?(yardoc_file) && !reparse
            load_yardoc
          else
            size = @store.keys.size
            YARD.parse(files)
            save if @store.keys.size > size
          end
        elsif files.is_a?(String)
          load_yardoc(files)
        else
          raise ArgumentError, "Must take a list of files to parse or the .yardoc file to load."
        end
        self
      end
    
      # Loads a yardoc file directly
      # 
      # @param [String] file the yardoc file to load.
      # @return [Registry] the registry object (for chaining)
      def load_yardoc(file = yardoc_file)
        clear
        @store.load(file)
        self
      end
    
      # Loads a yardoc file and forces all objects cached on disk into
      # memory. Equivalent to calling {load_yardoc} followed by {load_all}
      # 
      # @param [String] file the yardoc file to load
      # @return [Registry] the registry object (for chaining)
      # @see #load_yardoc
      # @see #load_all
      # @since 0.5.1
      def load!(file = yardoc_file)
        clear
        @store.load!(file)
        self
      end
    
      # Forces all objects cached on disk into memory
      # 
      # @example Loads all objects from disk
      #   Registry.load
      #   Registry.all.count #=> 0
      #   Registry.load_all
      #   Registry.all.count #=> 17
      # @return [Registry] the registry object (for chaining)
      # @since 0.5.1
      def load_all
        @store.load_all
        self
      end
    
      # @group Saving and Deleting Data from Disk

      # Saves the registry to +file+
      # 
      # @param [String] file the yardoc file to save to
      # @return [Boolean] true if the file was saved
      def save(merge = false, file = yardoc_file)
        @store.save(merge, file)
      end
    
      # Deletes the yardoc file from disk
      # @return [void]
      def delete_from_disk
        @store.destroy
      end
    
      # @group Adding and Deleting Objects from the Registry

      # Registers a new object with the registry
      # 
      # @param [CodeObjects::Base] object the object to register
      # @return [CodeObjects::Base] the registered object
      def register(object)
        return if object.is_a?(CodeObjects::Proxy)
        @store[object.path] = object
      end
    
      # Deletes an object from the registry
      # @param [CodeObjects::Base] object the object to remove
      # @return [void] 
      def delete(object) 
        @store.delete(object.path)
      end

      # Clears the registry
      # @return [void] 
      def clear
        @store = RegistryStore.new
      end

      # @group Accessing Objects in the Registry
     
      # Iterates over {all} with no arguments
      def each(&block)
        all.each(&block)
      end
    
      # Returns all objects in the registry that match one of the types provided
      # in the +types+ list (if +types+ is provided).
      # 
      # @example Returns all objects
      #   Registry.all
      # @example Returns all classes and modules
      #   Registry.all(:class, :module)
      # @param [Array<Symbol>] types an optional list of types to narrow the
      #   objects down by. Equivalent to performing a select: 
      #     +Registry.all.select {|o| types.include(o.type) }+
      # @return [Array<CodeObjects::Base>] the list of objects found
      # @see CodeObjects::Base#type
      def all(*types)
        @store.values.select do |obj| 
          if types.empty?
            obj != root
          else
            obj != root &&
              types.any? do |type| 
                type.is_a?(Symbol) ? obj.type == type : obj.is_a?(type)
              end
          end
        end + (types.include?(:root) ? [root] : [])
      end
    
      # Returns the paths of all of the objects in the registry.
      # @param [Boolean] reload whether to load entire database
      # @return [Array<String>] all of the paths in the registry.
      def paths(reload = false)
        @store.keys(reload).map {|k| k.to_s }
      end
    
      # Returns the object at a specific path.
      # @param [String, :root] path the pathname to look for. If +path+ is +root+,
      #   returns the {root} object.
      # @return [CodeObjects::Base] the object at path
      # @return [nil] if no object is found
      def at(path) path ? @store[path] : nil end
      alias_method :[], :at
    
      # The root namespace object.
      # @return [CodeObjects::RootObject] the root object in the namespace
      def root; @store[:root] end
    
      # Attempts to find an object by name starting at +namespace+, performing
      # a lookup similar to Ruby's method of resolving a constant in a namespace.
      # 
      # @example Looks for instance method #reverse starting from A::B::C
      #   Registry.resolve(P("A::B::C"), "#reverse")
      # @example Looks for a constant in the root namespace
      #   Registry.resolve(nil, 'CONSTANT')
      # @example Looks for a class method respecting the inheritance tree
      #   Registry.resolve(myclass, 'mymethod', true)
      # @example Looks for a constant but returns a proxy if not found
      #   Registry.resolve(P('A::B::C'), 'D', false, true) # => #<yardoc proxy A::B::C::D>
      # @example Looks for a complex path from a namespace
      #   Registry.resolve(P('A::B'), 'B::D') # => #<yardoc class A::B::D>
      # @param [CodeObjects::NamespaceObject, nil] namespace the starting namespace
      #   (module or class). If +nil+ or +:root+, starts from the {root} object.
      # @param [String, Symbol] name the name (or complex path) to look for from
      #   +namespace+.
      # @param [Boolean] inheritance Follows inheritance chain (mixins, superclass)
      #   when performing name resolution if set to +true+.
      # @param [Boolean] proxy_fallback If +true+, returns a proxy representing
      #   the unresolved path (namespace + name) if no object is found.
      # @return [CodeObjects::Base] the object if it is found
      # @return [CodeObjects::Proxy] a Proxy representing the object if 
      #   +proxy_fallback+ is +true+.
      # @return [nil] if +proxy_fallback+ is +false+ and no object was found.
      # @see P
      def resolve(namespace, name, inheritance = false, proxy_fallback = false)
        if namespace.is_a?(CodeObjects::Proxy)
          return proxy_fallback ? CodeObjects::Proxy.new(namespace, name) : nil
        end
      
        if namespace == :root || !namespace
          namespace = root
        else
          namespace = namespace.parent until namespace.is_a?(CodeObjects::NamespaceObject)
        end
        orignamespace = namespace

        name = name.to_s
        if name =~ /^#{CodeObjects::NSEPQ}/
          [name, name[2..-1]].each do |n|
            return at(n) if at(n)
          end
        else
          while namespace
            if namespace.is_a?(CodeObjects::NamespaceObject)
              nss = inheritance ? namespace.inheritance_tree(true) : [namespace]
              nss.each do |ns|
                next if ns.is_a?(CodeObjects::Proxy)
                found = partial_resolve(ns, name)
                return found if found
              end
            end
            namespace = namespace.parent
          end
        end
        proxy_fallback ? CodeObjects::Proxy.new(orignamespace, name) : nil
      end

      # @group Managing Source File Checksums
    
      # @return [Hash{String => String}] a set of checksums for files
      def checksums
        @store.checksums
      end
    
      # @param [String] data data to checksum
      # @return [String] the SHA1 checksum for data
      def checksum_for(data)
        Digest::SHA1.hexdigest(data)
      end
    
      # @group Managing Internal State (Testing Only)

      # The assumed types of a list of paths. This method is used by CodeObjects::Base
      # @return [{String => Symbol}] a set of unresolved paths and their assumed type
      # @private
      def proxy_types
        @store.proxy_types
      end
      
      # @group Legacy Methods
      
      # The registry singleton instance.
      # 
      # @deprecated use Registry.methodname directly.
      # @return [Registry] returns the registry instance
      def instance; self end
    
      private
    
      # @group Accessing Objects in the Registry

      # Attempts to resolve a name in a namespace
      # 
      # @param [CodeObjects::NamespaceObject] namespace the starting namespace
      # @param [String] name the name to look for
      def partial_resolve(namespace, name)
        return at(name) || at('#' + name) if namespace.root?
        [CodeObjects::NSEP, CodeObjects::CSEP, ''].each do |s|
          next if s.empty? && name =~ /^\w/
          path = name
          if namespace != root
            path = [namespace.path, name].join(s)
          end
          found = at(path)
          return found if found
        end
        nil
      end
    
      # @group Retrieving yardoc File Locations
    
      def global_yardoc_file(spec, for_writing = false)
        path = spec.full_gem_path
        yfile = File.join(path, DEFAULT_YARDOC_FILE)
        if for_writing && File.writable?(path)
          return yfile
        elsif !for_writing && File.exist?(yfile)
          return yfile
        end
      end
    
      def local_yardoc_file(spec, for_writing = false)
        path = Registry::LOCAL_YARDOC_INDEX
        FileUtils.mkdir_p(path) if for_writing
        path = File.join(path, "#{spec.full_name}.yardoc")
        if for_writing
          path
        else
          File.exist?(path) ? path : nil
        end
      end
    end
    
    clear
  end
end
