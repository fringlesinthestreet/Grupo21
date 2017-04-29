json.extract! series, :id, :nombre, :ano, :lenguaje, :director, :actores, :genero, :resumen, :created_at, :updated_at
json.url series_url(series, format: :json)
