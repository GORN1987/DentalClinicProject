class CreateContentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :content_images do |t|
      t.string :file_name
      t.string :alternative_text
      t.string :optional_caption
      t.references :customized_contents, foreign_key: true

      t.timestamps
    end
  end
end
