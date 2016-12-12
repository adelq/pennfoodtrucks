# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Useful Gist: https://gist.github.com/arjunvenkat/1115bc41bf395a162084
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Import FoodTrucks
csv_text = File.read(Rails.root.join('lib', 'seeds', 'foodTrucks.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row_hash = row.to_hash.transform_keys { |key| key.sub(/^ft_/, '') }
  ft = FoodTruck.create! row_hash
  # Unescape HTML entities (ex: Chris&#39;s => Chris's)
  ft.name = CGI.unescapeHTML(ft.name)
  ft.blurb = CGI.unescapeHTML(ft.blurb)
  ft.save
  puts "#{ft.name} saved"
end

puts "There are now #{FoodTruck.count} food trucks"

# Import foods
csv_text = File.read(Rails.root.join('lib', 'seeds', 'foods.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row_hash = row.to_hash.transform_keys { |key| key.sub(/^fd_/, '') }
  fd = Food.new
  fd.food_truck_id = row_hash['ft_id']
  fd.type = row_hash['type']
  fd.name = row_hash['name']
  fd.price = row_hash['largePrice']
  fd.comments = row_hash['comments'].strip
  fd.save
  puts "#{fd.name} saved"
end

puts "There are now #{Food.count} foods in the database."

# Import truck visits
csv_text = File.read(Rails.root.join('lib', 'seeds', 'truckVisits.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  vi = Visit.new
  vi.food_truck_id = row['ft_id']
  vi.timestamp = row['timestamp']
  vi.ip = row['ip']
  vi.public = row['displayVisit']
  vi.save
  puts "Visit to #{vi.food_truck.name} saved"
end

puts "There are now #{Visit.count} visits in the database."

# Import reviews
csv_text = File.read(Rails.root.join('lib', 'seeds', 'reviews.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row_hash = row.to_hash.transform_keys { |key| key.sub(/^rw_/, '').underscore }
  food_truck_id = row_hash.delete 'ft_id'
  rv = Review.create! row_hash
  rv.food_truck_id = food_truck_id
  # Unescape HTML entities (ex: Chris&#39;s => Chris's)
  rv.comment = CGI.unescapeHTML(rv.comment)
  rv.owner = CGI.unescapeHTML(rv.owner)
  rv.save
  puts "Review ##{rv.id} for #{rv.food_truck.name} saved"
end

puts "There are now #{Review.count} reviews in the database."
