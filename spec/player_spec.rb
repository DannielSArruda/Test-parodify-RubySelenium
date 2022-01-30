require 'selenium-webdriver'

describe 'Register' do

  before :each do
    chrome = Selenium::WebDriver::Service.chrome(path: 'driver/chromedriver.exe')
    @driver = Selenium::WebDriver.for :chrome, service: chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  after :each do
    @driver.quit
  end




end









