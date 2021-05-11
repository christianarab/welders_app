class Employee
    attr_accessor :email
    attr_reader :name, :salary, :vacation_days, :id
  
    def initialize(email)
        @email = email
    end
    
    def name(name)
        @name = name
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
  end

def run

welder = Employee.new("welderworld@gmail.com")
puts welder.inspect

end

run
