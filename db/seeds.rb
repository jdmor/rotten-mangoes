movies_seed_data_path = File.expand_path('../movies.yml', __FILE__)
movies = YAML.load_file(movies_seed_data_path)

movies.each do |movie|
  Movie.create(
    title: movie[0],
    director: movie[1]['director'],
    runtime_in_minutes: movie[1]['runtime_in_minutes'],
    description: movie[1]['description'],
    poster_image: movie[1]['poster_image'],
    release_date: movie[1]['release_date'],
    classic: movie[1]['classic']
  )
end