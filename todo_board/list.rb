require_relative "item"

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

    def size
        @items.count
    end

    def valid_index?(index)
        return false if index < 0
        index > @items.count - 1 ? false : true
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        valid_index?(index) ? @items[index] : nil
    end

    def priority
        @items[0]
    end

    def print
        puts "--------------------------------"
        puts @label.upcase
        puts "--------------------------------"
        puts "Index | Item | Deadline"
        puts "--------------------------------"
        @items.each_with_index do |name,i|
            puts "#{i} | #{name.title} | #{name.deadline}"
        end
        puts "--------------------------------"

    end

    def print_full_item(index)
        return if !valid_index?(index)
        puts "--------------------------------"
        puts @items[index].title + "            " + @items[index].deadline
        puts @items[index].description
        puts "--------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index,amount)
        return false if !valid_index?(index)
        new_index = index-amount
        return false if !valid_index?(new_index)
        @items.insert(new_index, @items[index])
        @items.delete_at(index)
    end

    def down(index,amount)
        return false if !valid_index?(index)
        new_index = index+amount+1
        return false if !valid_index?(new_index)
        @items.insert(new_index, @items[index])
        @items.delete_at(index)
    end

end

# asd = List.new("groceries")
# p asd
# asd.add_item('toothpaste', '2019-10-25')
# asd.add_item('toothpaste for kids', '2019-10-25')
# p asd
# p asd[1]