json.extract! house, :id, :owner, :address, :rooms, :sqmt, :floor, :air_cond, :price, :created_at, :updated_at
json.url house_url(house, format: :json)
