json.extract! tv_show, :id, :name, :genre, :country, :language, :actors, :director, :seasons, :created_at, :updated_at
json.url tv_show_url(tv_show, format: :json)
