admin = User.create!(:username => "sandro", :email => "s.raess@me.com", :password => "123456")
admin.roles << Role.find_by_role("admin")
