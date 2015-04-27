unless User.exists?(email: "JS@gmail.com")
  admin = User.create({first_name: "John", last_name: "Smith", email: "JS@gmail.com", password: "123", password_confirmation: "123", role: 1})
end

user = User.create({first_name: "Sam", last_name: "Hill", email: "SH@hotmail.com", password: "123", password_confirmation: "123", role: 0})

