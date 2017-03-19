json.extract! token, :id, :car_id, :token, :expiration_date, :status, :created_at, :updated_at
json.url token_url(token, format: :json)
