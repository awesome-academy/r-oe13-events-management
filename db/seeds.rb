Event.create!(name: "Charity in HaNoi")

Event.create!(name: "Charity in Ho Chi Minh")

array = ["admin", "organizer", "member", "guest"]

array.each do |role|
  Role.create! name: "#{role}"
end

User.create!(name: "admin",
	         phone_number: "0123456789",
             address: "hanoi",
             role_id: 1,
             email: "admin1@gmail.com",
             password: "111111")
User.create!(name: "organizer",
	         phone_number: "0123456789",
             address: "hanoi",
             role_id: 2,
             email: "organizer@gmail.com",
             password: "111111")
