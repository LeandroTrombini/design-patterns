require 'date'

class Report
  class << self
    def call(data)
      @data = data
      format
    end

    private

    def format = raise(NotMethodError, 'Implement in subclass!')

    def year = Date.today.year.to_s
      
  end
end