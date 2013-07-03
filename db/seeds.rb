# [Sport, Court, Location].each(&:delete_all)

# s = Sport.create(name: 'Tennis')
# c = s.courts.build(number_of: 2)
# l = Location.new(street_address: '174 Tremont St', city: 'Boston', state: 'MA')
# l.save
# c.location = l
# c.save

# s = Sport.create(name: 'Squash')
# c = s.courts.build(number_of: 1)
# l = Location.new(street_address: '653 Summer St', city: 'Boston', state: 'MA')
# l.save
# c.location = l
# c.save

# s = Sport.create(name: 'Racquetball')

require 'ffaker'

[Sport, Court, Location].each(&:delete_all)

sports = [
          'Tennis',
          'Squash',
          'Racquetball'
        ]

sports.each do |sport_name|
  sport = Sport.create(name: sport_name)

  (rand(21)+5).times do
    location = Location.new
    location.street_address  = Faker::Address.street_address
    location.city    = Faker::Address.city
    location.state   = Faker::AddressUS.state
    court = sport.courts.build(number_of: rand(5)+1)

    if location.save
      court.location = location
      court.save
    end

  end
end
