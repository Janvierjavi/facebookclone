json.extract! facepost, :id, :content, :image, :created_at, :updated_at
json.url facepost_url(facepost, format: :json)
