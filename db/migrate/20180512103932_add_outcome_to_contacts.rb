class AddOutcomeToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :outcome, :string
  end
end
