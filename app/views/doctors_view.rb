class DoctorsView
  def ask_name
    puts 'Enter doctor name:'
    gets.chomp.strip
  end

  def list(doctors)
    puts "\n" * 4 # 4 blank lines
    puts '-' * 30
    puts 'Doctors List'
    puts '-' * 30

    doctors.each_with_index do |doctor, index|
      puts "#{index + 1} - #{doctor.name}"
    end

    puts '-' * 30
    puts "\n" * 4 # 4 blank lines
  end
end
