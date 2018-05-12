class CreateCustomizedContents < ActiveRecord::Migration[5.1]
  def change
    create_table :customized_contents do |t|
      t.string :title
      t.string :textContent
      t.string :titleMenu
      t.timestamps
    end
  end
end
