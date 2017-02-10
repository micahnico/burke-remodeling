json.extract! city, :id, :wiki_link, :wiki_text, :city_name, :state, :population, :city_url, :created_at, :updated_at
json.url city_url(city, format: :json)