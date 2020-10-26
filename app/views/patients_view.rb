class PatientsView
  def ask_name
    puts 'Enter patient name:'
    gets.chomp.strip
  end

  def ask_age
    puts 'Enter patient age:'
    gets.chomp.to_i
  end

  def list(patients)
    system 'clear' # This don't work in rake specs
    puts 'Patients List'
    patients.each do |patient|
      puts "Name: #{patient.name} | #{patient.age} years"
    end
    puts '-' * 30
    puts "\n\n"
    puts 'Press enter to continue...'
    gets  # This don't work in rake specs
  end
end
