require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    load_csv if File.exist?(@csv_file)
  end

  def add(patient)
    @patients << patient
    save_csv
  end

  def all
    @patients
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      patient = Patient.new(name: row[:name], age: row[:age].to_i)
      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |file|
      file << %i[name age] # CSV HEADER
      @patients.each do |patient|
        file << [patient.name, patient.age]
      end
    end
  end
end
