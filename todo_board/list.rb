require "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

end

list = List.new("groceries")
p list
list.add_item("Water","2022-10-14","thirsty")
p list