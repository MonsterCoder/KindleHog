Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, 'VuKiu2sLFASRf0tuYTW9Q', '8HgQoRPI97LcfQljntCuPJcq91iuMk6AZSo5yDbpY'
	provider :facebook, 'APP_ID', 'APP_SECRET'
end
