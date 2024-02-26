# Class before refactoring from factory method pattern

# class Endpoint
#   def home(params)
#     if params[:user_type] == 'admin'
#       Admin.new
#     elsif
#       Menber.new
#     else
#       Guest.new
#     end
#   end

#   def contact(params)
#     if params[:user_type] == 'admin'
#       Admin.new
#     elsif
#       Menber.new
#     else
#       Guest.new
#     end
#   end
# end

require 'json'

class UserFactory
  def self.call(user_type)
    if user_type == 'admin'
      Admin.new
    elsif user_type == 'member'
      Menber.new
    else
      Guest.new
    end
  end
end

class Endpoint
  def home(params)
    user = UserFactory.call(params[:user_type])
    full_name = [user.first_name, user.last_name].join(" ")
    { name: full_name }.to_json
  end

  def contact(params)
    user = UserFactory.call(params[:user_type])
    { first_name: user.first_name }.to_json
  end
end

class Admin
  def first_name
    'Admin'
  end

  def last_name
    'User'
  end
end

class Menber
  def first_name
    'Menber'
  end

  def last_name
    'User'
  end
end

class Guest
  def first_name
    'Guest'
  end

  def last_name
    'User'
  end
end

# How to call this class

user_type = Endpoint.new.home(user_type: 'admin')
# user_type = Endpoint.new.contact(user_type: 'member')
# user_type = Endpoint.new.home(user_type: 'guest')

puts user_type