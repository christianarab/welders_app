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

    def self.add_employee
        @employee = []
        while true do
            puts "Creating new employee"
            puts "Please enter employee name: "
            employee_name = gets.chomp
            puts "Please enter employee e-mail: "
            employee_email = gets.chomp
            @employee << Employee.new(employee_name, employee_email).to_s
            puts @employee
        end
        @@records << @employee
    end

    def to_s
        "#{name} #{email}"
    end

    def self.view
        view_all = @@records
        view_all.each do |employee|
            name, email = employee.partition
            puts "#{name} #{email}"
        end
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
            Employee.view
        when 'f'
            puts "finding employees..."
        when 'a'
            Employee.add_employee
        when 'q'
            break
        end
    end
end

run
