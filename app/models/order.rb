class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id        = attributes[:id]        # Integer
    @delivered = attributes[:delivered] || false # true / false (boolean)

    @customer  = attributes[:customer]  # Customer
    @employee  = attributes[:employee]  # Employee
    @meal      = attributes[:meal]      # Meal
  end

  def delivered?
    @delivered
  end

  # class method headers
  def self.headers
    %w[id delivered meal_id employee_id customer_id]
  end

  # instance method to_csv_row
  def to_csv_row
    [@id, @delivered, @meal.id, @employee.id, @customer.id]
  end
end
