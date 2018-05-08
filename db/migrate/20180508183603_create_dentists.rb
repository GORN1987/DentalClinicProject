class CreateDentists < ActiveRecord::Migration[5.1]
  def change
    create_table :dentists do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :dental_number
      t.boolean :is_active

      t.timestamps
    end
  end
end
