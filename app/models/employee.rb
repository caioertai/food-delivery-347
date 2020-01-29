class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attributes = {})
    @id       = attributes[:id] # Integer
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role] # String => delivery_guy / manager
  end

  def manager?
    @role == "manager"
  end
end
