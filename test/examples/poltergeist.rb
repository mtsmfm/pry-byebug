require 'capybara/poltergeist'
require 'capybara/dsl'

Capybara.app = Rack::Builder.new do
  map "/" do
    run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  end
end.to_app

Capybara.default_driver = :poltergeist

Object.new.instance_eval do
  extend Capybara::DSL

  visit '/'

  binding.pry
  p page.text

  page.driver.quit
end
