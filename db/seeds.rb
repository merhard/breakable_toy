require 'csv'

s = Sport.find_or_create_by_name('Tennis')
CSV.foreach("db/court_seed_file.csv") do |street_address, city, state, number_of|
  c = s.courts.build(number_of: number_of)
  l = Location.new(street_address: street_address, city: city, state: state)

  if l.save
    c.location = l
    c.save
  end
end
