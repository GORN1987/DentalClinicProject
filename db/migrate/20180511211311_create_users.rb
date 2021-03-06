class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.string :login_type
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
