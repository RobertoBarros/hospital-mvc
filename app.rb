require 'csv'

require_relative 'app/repositories/patient_repository'
require_relative 'app/controllers/patients_controller'

require_relative 'app/repositories/room_repository'
require_relative 'app/controllers/rooms_controller'

require_relative 'app/repositories/doctor_repository'
require_relative 'app/controllers/doctors_controller'

require_relative 'router'

patient_repository = PatientRepository.new('data/patients.csv')
patients_controller = PatientsController.new(patient_repository)

room_repository = RoomRepository.new('data/rooms.csv')
rooms_controller = RoomsController.new(room_repository)

doctor_repository = DoctorRepository.new('data/doctors.csv')
doctors_controller = DoctorsController.new(doctor_repository)

router = Router.new(patients_controller, rooms_controller, doctors_controller)

router.run