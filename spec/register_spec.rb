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

  it 'Register with different password' do
    @driver.get('http://parodify.herokuapp.com/users/sign_in')
    @driver.find_element(css: '[href="/users/sign_up"]').click
    @wait.until {expect(@driver.find_element(css: '[value="Cadastrar"]').displayed?).to be(true)}

    @driver.find_element(id:'user_email').send_keys('papito_ninja@qa.ninja')
    @driver.find_element(id:'user_password').send_keys('pwd54321')
    @driver.find_element(id:'user_password_confirmation').send_keys('12345pwd')
    @driver.find_element(css: '[type="submit"]').click
    @wait.until {expect(@driver.find_element(css: '[class=message-body]').displayed?).to be(true)}
  end

  it 'Register with right informations' do
    @driver.get('http://parodify.herokuapp.com/users/sign_in')
    @driver.find_element(css: '[href="/users/sign_up"]').click
    @wait.until {expect(@driver.find_element(css: '[value="Cadastrar"]').displayed?).to be(true)}
    @driver.find_element(id:'user_email').send_keys('ruby@qa.ninja')
    @driver.find_element(id:'user_password').send_keys('ruby54321')
    @driver.find_element(id:'user_password_confirmation').send_keys('ruby54321')
    @driver.find_element(css: '[type="submit"]').click
    @wait.until {expect(@driver.find_element(css: '[rel=nofollow]').displayed?).to be(true)}
  end

end








