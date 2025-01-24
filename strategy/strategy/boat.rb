require "strategy/vehicle"

module Strategy
  class Boat < Vehicle    
    def calculate_route(source, destination)
      [source.length, destination.length].inject(&cubed)
    end

    private

    def cubed = -> (a, b) { a * b ** 3 }
  end
end