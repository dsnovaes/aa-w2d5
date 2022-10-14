class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.include?(flight_number.upcase)
    end

    def add_flight(flight_number)
        if !has_flight?(flight_number)
            @flight_numbers << flight_number.upcase
        end
    end

end

# diego = Passenger.new("Diego Novaes")
# p diego
# p diego.add_flight("AA128")
# p diego.add_flight("J512")

# p diego.has_flight?("JJ9202")