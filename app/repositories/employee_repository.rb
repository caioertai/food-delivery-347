require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    # => an instance of an employee
    @elements.find { |element| element.username == username }
  end

  def delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
      @next_id += 1
    end
  end
end
