require_relative '../models/doctor'

class DoctorRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @doctors = []
    load_csv if File.exist?(@csv_file)
  end

  def add(doctor)
    @doctors << doctor
    save_csv
  end

  def all
    @doctors
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      doctor = Doctor.new(name: row[:name])
      @doctors << doctor
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |file|

      file << %i[name] # CSV HEADER

      @doctors.each do |doctor|
        file << [doctor.name]
      end
    end
  end
end
