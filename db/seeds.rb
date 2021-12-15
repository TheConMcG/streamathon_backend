# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'title_id_map.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   tmdb_watchmode = TmdbWatchmode.new
#   tmdb_watchmode.watchmode_id = row['Watchmode ID']
#   tmdb_watchmode.tmdb_id = row[' TMDB ID']
#   tmdb_watchmode.tmdb_type = row[' TMDB Type']
#   tmdb_watchmode.save
#   puts "#{tmdb_watchmode.watchmode_id}, #{tmdb_watchmode.tmdb_id} saved"
# end

# puts "There are now #{TmdbWatchmode.count} rows in the transactions table"
