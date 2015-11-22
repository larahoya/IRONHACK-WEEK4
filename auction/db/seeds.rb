(1..5).each do |index|
  User.create(name: "User #{index}", email: "user#{index}@gmail.com", password: "a1b2")
end

(1..20).each do |index|
  Product.create(title: "Product #{index}", description: "description", deadline: Date.current + 30, user_id: rand(5) + 1, minimum_bid:100)
end