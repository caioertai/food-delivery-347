require_relative 'base_repository'
require_relative '../models/meal'

class MealRepository < BaseRepository
  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
      @next_id += 1
    end
  end
end
