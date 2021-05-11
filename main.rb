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
            Employee.new(employee_name, employee_email).save
            break
        end
    end

    def to_s
        "employee name: #{name} e-mail: #{email}"
    end

    def self.view
        view_all = @@records
        view_all.each do |employee|
            puts employee
        end
        return view_all
    end

    def self.find_by_email(email)
        @@records.each do |_, employee|
            if email == employee.email
                return employee
            end
        end
    end

end

def run

# welder = Employee.new("franky", "welderworld@gmail.com")
# welder.save
# puts welder.inspect

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
            employee = Employee.find_by_email("welderworld@gmail.com")
            puts employee.to_s
        when 'a'
            Employee.add_employee
        when 'q'
            break
        end
    end
end

run
