class Employee
    
    attr_accessor :email
    attr_reader :name, :email, :salary, :vacation_days, :id, :is_admin
  
    @@records = {}

    def initialize(name, email, is_admin=false)
        @name = name
        @email = email
        @is_admin = is_admin
    end

    def save
        @@records[self.name] = self
        puts @@records
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
        "employee name: #{name} e-mail: #{email} admin rights: #{is_admin}"
    end

    def self.view
        view_all = @@records
        view_all.each do |employee|
            puts employee
        end
        view_all
    end

    def self.delete
        @@records.each_with_index do |employee, idx|
            puts employee
        end 
    end

    def self.find_by_email(email)
        @@records.each do |_, employee|
            if email == employee.email
                 employee
            end
        end
    end
end

def load_employees
    # welder1 = Employee.new("franky", "welderworld@gmail.com", true)
    # welder1.save
    welder2 = Employee.new("dorly", "weldsdd@gmail.com")
    welder2.save
    welder3 = Employee.new("ssssee", "aaadd@gmail.com")
    welder3.save
end

def run

    load_employees

    welder1 = Employee.new("franky", "welderworld@gmail.com", true)
    @currentuser = welder1
    welder1.save

    def menu
        if @currentuser.is_admin == false
            puts "Employee View: Welders Record"
            puts "Please enter a command"
            puts "V for view records"
            puts "F for find employee (by email)"
            puts "A for add employee"
            puts "sudo for those with higher authority"
            puts "Q to quit"
        else @currentuser.is_admin == true
            puts "Super secret admin menu"
            puts "V for view records"
            puts "F for find employee (by email)"
            puts "E to delete employee"
            puts "A to add employee"
            puts "W to edit wages"
        end
    end

    while true do
        menu
        user_input = gets.chomp
        case user_input
        when 'd'
            Employee.delete
        when 'v'
            Employee.view
        when 'f'
            Employee.find_by_email
        when 'a'
            Employee.add_employee
        when 'q'
            break
        end
    end
end

run
