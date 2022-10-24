class RoomsView
  def ask_number
    puts 'Enter the room number:'
    gets.chomp.to_i
  end

  def ask_capacity
    puts 'Enter the room capacity:'
    gets.chomp.to_i
  end

  def list(rooms)
    puts 'Rooms List'
    puts '-' * 30
    rooms.each_with_index do |room, index|
      puts "#{index + 1} - Room Number #{room.number}: #{room.capacity} patients capacity"
    end
    puts '-' * 30
  end
end
