class AddPatientAndDentistToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :patients, foreign_key: true
    add_reference :appointments, :dentists, foreign_key: true
  end
end
