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
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  row_hash = row.to_hash.transform_keys { |key| key.sub(/^ft_/, '')}
  ft = FoodTruck.create! row_hash
  # Unescape HTML entities (ex: Chris&#39;s => Chris's)
  ft.name = CGI::unescapeHTML(ft.name)
  ft.blurb = CGI::unescapeHTML(ft.blurb)
  puts "#{ft.name} saved"
end

puts "There are now #{FoodTruck.count} rows in the table"
