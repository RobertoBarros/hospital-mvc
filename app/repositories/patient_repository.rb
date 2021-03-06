require_relative '../models/patient'

class PatientRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

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
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      patient = Patient.new(name: row[:name], age: row[:age].to_i)
      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[name age] # CSV HEADER

      @patients.each do |patient|
        file << [patient.name, patient.age]
      end
    end
  end

end