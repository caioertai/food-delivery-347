require_relative "app/models/employee"
require_relative "app/repositories/employee_repository"

p Employee.new(username: "john", password: "secret", role: "manager")

employee_repository = EmployeeRepository.new("data/employee.csv")

p employee_repository
