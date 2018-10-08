require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    load_csv
  end

  def add(patient)
    @patients << patient
    save_csv
  end

  def all
    @patients
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      patient = Patient.new(name: row[0], age: row[1].to_i)
      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @patients.each do |patient|
        file << [patient.name, patient.age]
      end
    end
  end

end