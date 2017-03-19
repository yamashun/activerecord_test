json.extract! shodan, :id, :bb_number, :first_name, :last_name, :status, :created_at, :updated_at
json.url shodan_url(shodan, format: :json)
