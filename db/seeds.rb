# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..30).each do |i|
  planet = Tatooine::Planet.get(i)
  sleep(0.5)
  name = planet.name
  population = planet.population
  climate = planet.climate
  terrain = planet.terrain

  Planet.find_or_create_by(name: name, population: population, climate: climate, terrain: terrain)
end

PEOPLE = []
RATINGS = [1,2,3,4,5]
(1..40).each do |i|
  next if i == 17
  person = Tatooine::Person.get(i)
  sleep(0.5)
  PEOPLE << person.name
end

(1..30).each do |i|
  #planet = Planet.find(i)
  10.times do 
    author_name = PEOPLE.sample
    body = "Here is a sample review. The text would go here. You might write something about lodging, food or attractions in the area."
    rating = RATINGS.sample
    planet_id = i
    title = "Sample Review Title"
    Review.find_or_create_by(author_name: author_name, body: body, rating: rating, planet_id: planet_id, title: title)
  end
end
