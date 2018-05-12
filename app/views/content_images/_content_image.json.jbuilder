json.extract! content_image, :id, :file_name, :alternative_text, :optional_caption, :customized_contents_id, :created_at, :updated_at
json.url content_image_url(content_image, format: :json)
