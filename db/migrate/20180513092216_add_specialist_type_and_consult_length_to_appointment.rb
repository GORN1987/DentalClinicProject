class AddSpecialistTypeAndConsultLengthToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :specialist_type, :string
    add_column :appointments, :consult_length, :integer
  end
end
