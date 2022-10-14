class Item

    attr_accessor :title, :deadline, :description

    def valid_date?(date_string)
        arr = date_string.split("-")
        year = arr[0].to_i
        month = arr[1].to_i
        day = arr[-1].to_i
        if month > 12 || month < 1 || year < 1000 || year > 9999 || day > 31 || day < 1
            return false
        end
        true
    end

    def initialize(title, deadline, description)
        
        @title = title
        if self.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid date"
        end
        @description = description

    end

end