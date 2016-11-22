Capybara::Webkit.configure do |config|
  config.allow_url("*.lvh.me")
  config.block_url("www.google-analytics.com")
end
