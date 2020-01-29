require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @repo = employee_repository
    @view = SessionsView.new
  end

  def login
    # Session
    # 1 ASK the VIEW for username
    username = @view.ask_for(:username)
    # 2 ASK the VIEW for password
    password = @view.ask_for(:password)
    # 3 ASK repo if a user matches username
    employee = @repo.find_by_username(username)
    # 4 CHECK if the user matches its password

    # 5 Return the employee if password matches
    if employee&.password == password
      @view.greet(employee)
      employee
    else
      @view.wrong_credentials
      nil
    end
  end
end
