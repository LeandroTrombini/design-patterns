require "strategy/vehicle"

module Strategy
  class Bike < Vehicle
    ERROR_CORRECTION = 5

    def calculate_route(source, destination)
      [source.length, destination.length].inject(&squared) + ERROR_CORRECTION
    end

    private

    def squared = -> (a, b) { a * b ** 2 }
  end
end