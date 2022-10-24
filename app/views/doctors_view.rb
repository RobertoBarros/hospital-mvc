class DoctorsView
  def ask_name
    puts 'Enter doctor name:'
    gets.chomp.strip
  end

  def list(doctors)
    puts 'Doctors List'
    puts '-' * 30

    doctors.each_with_index do |doctor, index|
      puts "#{index + 1} - #{doctor.name}"
    end

    puts '-' * 30
  end
end
