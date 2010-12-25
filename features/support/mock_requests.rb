Devise::OmniAuth.test_mode!

Devise::OmniAuth.short_circuit_authorizers!

Devise::OmniAuth.stub!(:facebook) do |b|
    b.post('/oauth/access_token') { [200, {}, ACCESS_TOKEN.to_json] }
    b.get('/me?access_token=plataformatec') { [200, {}, FACEBOOK_INFO.to_json] }
end

at_exit do
  Devise::OmniAuth.unshort_circuit_authorizers!
  Devise::OmniAuth.reset_stubs!
end

#Devise::OmniAuth.stub!(:twitter) do |b|
#    b.post("https://api.twitter.com/oauth/request_token") { [200, {}, #'oauth_token=t9zvi1zgCsCkJHmAmPAsYqm47A0RxQX1Mix17xXXXX&oauth_token_secret=GbLzmL41coV6oBQgGJPURqNGAxpEjR2tEM9AXXXX&oauth_callback_confirmed=true'] }
#    b.post("https://api.twitter.com/oauth/access_token") {[200, {},
#    'oauth_token=12345-Jxq8aYUDRmykzVKrgoLhXSq67TEa5ruc4GJC2rXXXX&oauth_token_secret=J6zix3FfA9LofH0awS24M3HcBYXO5nI1iYe8XXXX&user_id=12345&screen_name=johns']}
#    b.get("https://api.twitter.com/1/account/verify_credentials.json") { [200, {}, '{"screen_name": "johns", "name": "John Smith", "location": "Tokyo", "profile_image_url": "", "description": "", #"url": ""}'] }
#end








