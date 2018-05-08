class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :alergies
      t.string :medical_notes

      t.timestamps
    end
  end
end
