class Register

  USERNAME_INPUT = {id: 'user_email'}
  PASSWORD_INPUT = {id: 'user_password'}
  CONFIRM_PASSWORD_INPUT = {id:'user_password_confirmation'}
  SUBMIT = {css: '[type="submit"]'}
  LOGOUT_BUTTON = {css: '[type="submit"]'}
  REGISTER_BUTTON = {css: '[value="Cadastrar"]'}
  ERROR_MESSAGE = {css: '[class="message-body"]'}

  def initialize(driver)
    @driver = driver
    @driver.get('http://parodify.herokuapp.com/users/sign_in')
  end

  def access_register_page
    @driver.find_element(css: '[href="/users/sign_up"]').click
    @driver.find_element(REGISTER_BUTTON).displayed?
  end

  def with(username, password, password_confirm)
    @driver.find_element(USERNAME_INPUT).send_keys(username)
    @driver.find_element(PASSWORD_INPUT).send_keys(password)
    @driver.find_element(CONFIRM_PASSWORD_INPUT).send_keys(password_confirm)
    @driver.find_element(SUBMIT).click
  end

  def error_message_present?
    @driver.find_element(ERROR_MESSAGE).displayed?
  end

  def logout_button_present?
    @driver.find_element(LOGOUT_BUTTON).displayed?
  end

end
