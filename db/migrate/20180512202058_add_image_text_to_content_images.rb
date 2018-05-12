class AddImageTextToContentImages < ActiveRecord::Migration[5.1]
  def change
    add_column :content_images, :image_text, :string
  end
end
