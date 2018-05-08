class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.decimal :fee
      t.belongs_to :patients
      t.belongs_to :dentists
      t.timestamps
    end
  end
end
