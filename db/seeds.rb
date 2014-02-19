# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

headers = [:zip, :latitude, :longitude, :city, :state, :county, :zip_class]

sample_data_path = File.join(Rails.root, "db", "sample_data", "zip_codes.csv")

csv = CSV.open(sample_data_path, headers: headers, encoding: "ASCII")

puts "Seeding zip code data set (#{1234}) zip codes."

csv.each_with_index do |row, index|
  row = row.to_hash

  ZipCode.create!(row)
  puts "Finished #{index + 1}" if index % 1000 == 0
end

puts "Finished seeding zip codes"