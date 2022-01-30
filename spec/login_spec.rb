require 'selenium-webdriver'
require_relative '../pages/login'

describe 'Login' do

  before :each do
    chrome = Selenium::WebDriver::Service.chrome(path: 'driver/chromedriver.exe')
    @driver = Selenium::WebDriver.for :chrome, service: chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @login = Login.new(@driver)
  end

  after :each do
    @driver.quit
  end

  it 'Login with right credentials ' do
    @login.with('papito@qa.ninja', 'pwd123')
    @wait.until {expect(@login.logout_button_present?).to be(true)}
  end

  it 'Login with wrong credentials ' do
    @login.with('papito@qa.ninja', 'wrongpwd')
    @wait.until {expect(@login.error_message_present?).to be(true)}
  end

end







