class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id       = attributes[:id] # Integer
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role] # String => delivery_guy / manager
  end

  def name
    @username
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
