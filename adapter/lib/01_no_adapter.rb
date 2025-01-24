require_relative "./paypal_lib"
require_relative "./user"

# Client code is coupled with the 3rd party library.
class ClientApp
  def self.call(user:)
    PaypalLib.subscription(email: user.email)
    PaypalLib.customer(
      fname: user.first_name,
      lname: user.last_name
    )
  end
end

ClientApp.call(user: User.new)