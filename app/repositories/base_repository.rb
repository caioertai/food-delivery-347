require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  def all
    @elements
  end

  private

  def write_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end
end
