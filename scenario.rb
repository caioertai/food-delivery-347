require_relative "app/repositories/meal_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/order_repository"

employees_csv_path = "data/employees.csv"
employee_repository = EmployeeRepository.new(employees_csv_path)

customers_csv_path = "data/customers.csv"
customer_repository = CustomerRepository.new(customers_csv_path)

meals_csv_path = "data/meals.csv"
meal_repository = MealRepository.new(meals_csv_path)

orders_csv_path = "data/orders.csv"
order_repository = OrderRepository.new(orders_csv_path, meal_repository, employee_repository, customer_repository)
