class Listings
  Listing.seed do |t|
    t.listingID
    #t.index :listingID
    t.title = '5 bedroom house in Maroubra'
    t.duration = 8
    t.suburbID = 8
    t.street = "albany highway"
    t.unit = "3a"
    t.price = 12345.55
    t.bedroom = 5
    t.bathroom = 2
    t.carports = 2
    t.land_size = 840.00
    t.description = "5 bedroom house"
    t.typeID = "12345"
    t.views = 13245
    t.sold = false
  end

  Listing.seed do |t|
    t.listingID
    #t.index :listingID
    t.title = '3 bedroom flat in Scarborough'
    t.duration = 8
    t.suburbID = 8
    t.street = "pacific highway"
    t.unit = "3a"
    t.price = 12345.55
    t.bedroom = 5
    t.bathroom = 2
    t.carports = 2
    t.land_size = 840.00
    t.description = "3 bedroom flat"
    t.typeID = "12345"
    t.views = 13245
    t.sold = false
  end
end