class Employee
  attr_accessor :email, :wage, :id, :vacation, :email
  attr_reader :name, :salary, :is_admin, :password

  @@records = []

  def initialize(name, email, id, is_admin=false, password='')
    @name = name
    @email = email
    @is_admin = is_admin
    @password = password
    @id = id
    @wage = rand(25..32)
    @vacation = rand(0..14)
  end

  def save
    @@records << self
  end

  # Finds vacation values
  def self.find_vacation(condition, value)
    result = []
    employees = all

    case condition
    when 'greater'
      employees.each do |e|
        if e.vacation >= value
          result << e
        end
      end
    when 'less'
      employees.each do |e|
        if e.vacation <= value
          result << e
        end
      end
    else
      result = nil
    end
    result
  end

  # Finds wages
  def self.find_wage(condition, value)
    result = []
    employees = all

    case condition
    when 'greater'
      employees.each do |e|
        if e.wage >= value
          result << e
        end
      end
    when 'less'
      employees.each do |e|
        if e.wage <= value
          result << e
        end
      end
    end
    result
  end

  # Finds e-mails
  def self.find_email(email)
    result = []
    employees = all
    employees.each do |e|
      if e.email == email
       result << e
      else
        nil
      end
    end
    result
  end

  # Checks company email domain
  def self.by_company(domain)
    result = []
    employees = all

    employees.each do |e|
      if e.email =~ /#{domain}/
        result << "Employee name: #{e.name} Employee e-mail: #{e.email} Matched with: #{e.email.match(/#{domain}/).to_s}"
        else
        nil
      end
    end
    result
  end

  def self.email_check(email)
    results = []
    all.each do |employee|
        if employee.email == email
          results << employee
        else
          results << nil
        end
    end
    results
  end

  def self.wage(id, wage)
    @@records.each do |employee|
      if employee.id == id
        employee.wage = wage
        break
      end
    end
  end

  def self.vacation(id, vacation_days)
      @@records.each do |employee|
          if id == employee.id
              employee.vacation += vacation_days
              puts "#{employee.name} now has #{vacation_days} vacation days added"
          end
      end
  end
  
  def self.add_employee
    while true do
      puts "Creating new employee..."
      puts "Enter employee name: "
      name = gets.chomp
      puts "Enter employee e-mail: "
      email = gets.chomp
      puts "Enter employee id: "
      id = gets.chomp.to_i
      puts "Is employee admin? Type true or false: "
      is_admin = gets.chomp.to_s.downcase
      Employee.new(name, email, id, is_admin).save
      break
    end
  end

  def self.view
    @@records.each_with_index do |employee, employee_idx|
      puts "#{employee_idx+1}) #{employee.name}", "\t", "#{employee.email}", "\n"
    end
  end

  def self.admin_view
    @@records.each_with_index do |employee, employee_idx|
      puts "Index no.#{employee_idx}) #{employee.to_s}"
    end
  end

  def self.delete(idx)
    @@records.delete_at(idx)
  end

  def self.select(id)
    result = ''
      @@records.each do |employee|
        if id == employee.id
          return result << "#{employee}"
        end
      end
    if result == ''
      return "No match found."
    end
  end

  def self.all
    @@records 
  end

  def self.check_password
    @@records.each_with_index do |employee, employee_idx|
      puts "Index no.#{employee_idx}) #{employee.to_s}"
    end
  end

  def to_s
    return "ID# #{self.id} Employee Name: #{self.name} E-mail: #{self.email} Vacation Days Remaining: #{self.vacation} Admin Rights: #{self.is_admin} Wage: #{self.wage}"
  end
end
