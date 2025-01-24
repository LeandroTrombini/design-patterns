require_relative "./user"

class ClientApp
  def self.call(platform:, user:)
    if platform == :paypal
      PaypalLib.subscription(email: user.email)
      PaypalLib.customer(
        fname: user.first_name,
        lname: user.last_name
      )
    elsif platform == :braintree
      BraintreeLib.user(full_name: user.full_name)
      BraintreeLib.subscribe(external_id: user.id)
    else
      raise "Invalid platform"
    end
  end
end

ClientApp.call(platform: :paypal, user: User.new)
#ClientApp.call(platform: :braintree, user: User.new)