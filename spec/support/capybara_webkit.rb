Capybara::Webkit.configure do |config|
  config.debug = true
  config.allow_url("*.example.com")
  config.allow_url("www.google-analytics.com")
end
