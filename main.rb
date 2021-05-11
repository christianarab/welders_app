class Employee
    
    attr_accessor :email
    attr_reader :name, :salary, :vacation_days, :id
  
    @@records = {}

    def initialize(name, email)
        @name = name
        @email = email
    end

    def employee_id(id)
        @id = id
    end
  
    def salary(salary)
        @salary = salary
    end
  
    def vacation_days(days)
        @vacation_days = days
    end

    def save
      @@records[self.name] = self
    end
end

def run

welder = Employee.new("franky", "welderworld@gmail.com")
welder.save
puts welder.inspect

    while true do
        puts "Welder Records"
        puts "Please enter a command"
        puts "V for view records"
        puts "F for find employee (by email)"
        puts "A for add employee"
        puts "Q to quit"

        user_input = gets.chomp
        case user_input
        when 'v'
            puts "viewing records..."
        when 'f'
            puts "finding employees..."
        when 'a'
            puts "add employees..."
        when 'q'
            break
        end
    end
end

run
