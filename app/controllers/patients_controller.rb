require_relative '../views/patients_view'

class PatientsController
  def initialize(patient_repository)
    @patient_repository = patient_repository
    @view = PatientsView.new
  end

  def create
    name = @view.ask_name
    age = @view.ask_age
    patient = Patient.new(name: name, age: age)
    @patient_repository.add(patient)
  end

  def list
    patients = @patient_repository.all
    @view.list(patients)
  end
end