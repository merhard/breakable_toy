[Sport, Court, Location].each(&:delete_all)

s = Sport.create(name: 'Tennis')
c = s.courts.build(number_of: 2)
l = Location.new(street_address: '174 Tremont St', city: 'Boston', state: 'MA', zip: '02108')
l.save
c.location = l
c.save

s = Sport.create(name: 'Squash')
c = s.courts.build(number_of: 1)
l = Location.new(street_address: '653 Summer St', city: 'Boston', state: 'MA', zip: '02210')
l.save
c.location = l
c.save

s = Sport.create(name: 'Racquetball')
