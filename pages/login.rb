class Login

  USERNAME_INPUT = {id: 'user_email'}
  PASSWORD_INPUT = {id: 'user_password'}
  SUBMIT = {css: '[type="submit"]'}
  LOGOUT_BUTTON = {css: '[type="submit"]'}
  ERROR_MESSAGE = {css: '[class="message-body"]'}

  def initialize(driver)
    @driver = driver
    @driver.get('http://parodify.herokuapp.com/users/sign_in')
  end

  def with(username, password)
    @driver.find_element(USERNAME_INPUT).send_keys(username)
    @driver.find_element(PASSWORD_INPUT).send_keys(password)
    @driver.find_element(SUBMIT).click
  end

  def logout_button_present?
    @driver.find_element(LOGOUT_BUTTON).displayed?
  end

  def error_message_present?
    @driver.find_element(ERROR_MESSAGE).displayed?
  end

end
