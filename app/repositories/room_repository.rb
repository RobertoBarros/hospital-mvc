require_relative '../models/room'

class RoomRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv if File.exist?(@csv_file)
  end

  def add(room)
    @rooms << room
    save_csv
  end

  def all
    @rooms
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      room = Room.new(number: row[:number].to_i, capacity: row[:capacity].to_i)
      @rooms << room
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[number capacity] # CSV HEADER

      @rooms.each do |room|
        file << [room.number, room.capacity]
      end
    end
  end

end