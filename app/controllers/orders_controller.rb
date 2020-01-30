require_relative '../models/order'
require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository, meal_repository, employee_repository, customer_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def add
    # Meal
    meals = @meal_repository.all
    @view.display_elements(meals)
    meal_id = @view.ask_for_id("meal")
    meal = @meal_repository.find(meal_id)

    # Customer
    customers = @customer_repository.all
    @view.display_elements(customers)
    customer_id = @view.ask_for_id("customer")
    customer = @customer_repository.find(customer_id)

    # Employee
    delivery_guys = @employee_repository.delivery_guys
    @view.display_elements(delivery_guys)
    employee_id = @view.ask_for_id("employee")
    employee = @employee_repository.find(employee_id)

    # Ask ORDER for an instance of this order
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    # Ask ORDER REPO to store it
    @order_repository.add(order)
  end

  def undelivered_orders(employee = nil)
    # Ask the REPO for the undelivered orders
    if employee.nil?
      orders = @order_repository.undelivered_orders
    else
      orders = @order_repository.undelivered_orders.select do |order|
        order.employee == employee
      end
    end
    # Ask the VIEW to show them
    @view.display(orders)
  end
end
