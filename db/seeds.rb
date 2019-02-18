array = ["admin", "organizer", "member", "guest"]

array.each do |role|
  Role.create! name: "#{role}"
end

name = "Hoang Anh Quan"
email = "anhquanhh4@gmail.com"
password = "123123"
role_id = 1
User.create(name: name, email: email, password: password, role_id: role_id)

50.times do |n|
  name = "Tai khoan #{n+1}"
  email = "tk#{n+1}@gmail.com"
  password = "123123"
  role_id = 3
  User.create!(name: name, email: email, password: password, role_id: role_id)
end

User.create!(name: "organizer",
            phone_number: "0123456789",
            address: "hanoi",
            role_id: 2,
            email: "organizer122@gmail.com",
            password: "111111")

name = "Hoang Anh Quan"
email = "anhquanhh4@gmail.com"
password = "123123"
role = 1
User.create!(name: name, email: email, password: password, role_id: role)
