Location.destroy_all
User.destroy_all
Item.destroy_all
Reservation.destroy_all
Review.destroy_all

l1 = Location.create(name: "New York")
l2 = Location.create(name: "Chicago")
l3 = Location.create(name: "Los Angeles")

u1 = User.create(name: "Kenny", username: "kendawg", age: 26, location: l1, email: "kenneth.c.lehr@gmail.com", password_digest: "1234")
u2 = User.create(name: "Matt", username: "mdg", age: 27, location: l2, email: "mattsemail@gmail.com", password_digest: "1234")

i1 = Item.create(name: "snowboard", description: "a very nice snowboard", price: "1000", seller: u1, category: "Winter Sports")
i2 = Item.create(name: "skis", description: "a dope pair of skis", price: "2", seller: u1, category: "Winter Sports")
i3 = Item.create(name: "tent", description: "A very large tent", price: "30", seller: u1, category: "Camping & Hiking")


r1 = Reservation.create(rent_start: "2018-03-22", rent_end: "2018-03-26", item: i1, buyer: u2)
r2 = Reservation.create(rent_start: "2018-05-28", rent_end: "2018-06-01", item: i2, buyer: u2)

rev1 = Review.create(content: "Great snowboard", reservation: r1, buyer: u2, rating: 4)
rev1 = Review.create(content: "Great skis", reservation: r2, buyer: u2, rating: 5)
