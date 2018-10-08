require_relative '../models/doctor'

class DoctorRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @doctors = []
    load_csv
  end

  def add(doctor)
    @doctors << doctor
    save_csv
  end

  def all
    return @doctors
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      doctor = Doctor.new(name: row[0])
      @doctors << doctor
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @doctors.each do |doctor|
        file << [doctor.name]
      end
    end
  end


end