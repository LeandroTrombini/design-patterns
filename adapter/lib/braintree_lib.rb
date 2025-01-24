class BraintreeLib
  class << self
    def user(full_name:)
      puts "Creating user: #{full_name}"
    end

    def subscribe(external_id:)
      puts "Subscribing user with external_id: #{external_id}"
    end
  end
end