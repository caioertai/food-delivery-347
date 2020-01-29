require_relative 'base_repository'
require_relative '../models/customer'

class CustomerRepository < BaseRepository
  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
      @next_id += 1
    end
  end
end
