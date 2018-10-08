require_relative '../models/room'

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def add(room)
    @rooms << room
    save_csv
  end

  def all
    @rooms
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      room = Room.new(number: row[0].to_i, capacity: row[1].to_i)
      @rooms << room
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @rooms.each do |room|
        file << [room.number, room.capacity]
      end
    end
  end

end