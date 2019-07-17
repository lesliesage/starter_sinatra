@shopper1 = Shopper.create(name: "Jesse")
@shopper2 = Shopper.create(name: "Leslie")

@item1 = Item.create(name: "coffee", price: 8.75)
@item2 = Item.create(name: "oatmeal", price: 4.25)
@item3 = Item.create(name: "peach", price: 1.50)

Order.create(shopper_id: 1, item_id: 1, quantity: 1)
Order.create(shopper_id: 1, item_id: 3, quantity: 2)
Order.create(shopper_id: 2, item_id: 2, quantity: 1)
Order.create(shopper_id: 2, item_id: 3, quantity: 3)
