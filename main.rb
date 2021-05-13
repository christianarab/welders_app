require_relative ('employee.rb')
require_relative ('menu.rb')
require_relative ('query.rb')

def load_employees
    welder2 = Employee.new("Jake", "welding_hero@gmail.com", 186)
    welder2.save
    welder3 = Employee.new("John", "mig_4_ever@gmail.com", 214)
    welder3.save
    welder4 = Employee.new("Jerrod", "i_melt_for_you@gmail.com", 210)
    welder4.save
    welder5 = Employee.new("Tod", "i_know_you@yahoo.com", 211)
    welder5.save
    welder6 = Employee.new("Keon", "keon@aol.com", 216)
    welder6.save
    welder7 = Employee.new("Debby", "debbie@womenweld.com", 116)
    welder7.save
end

def run
# three test employees
  load_employees

# admin load
  @current_user = Employee.new("Franky", "welderworld@gmail.com", 001, true, "mexicantacos123")
  @current_user.save

  while true do
    menu
    user_input = gets.chomp.downcase
    
    case user_input
    when 'wage'
      if @current_user.is_admin == false
        puts "Access denied."
        else
          while true do   
            Employee.admin_view
            puts "Enter id # "
            id = gets.chomp.to_i
            puts "Enter hourly wage: "
            wage = gets.chomp
            Employee.wage id, wage
            puts "Would you like to edit a wage again? y/n"
            user_input = gets.chomp
            break if user_input == 'n'
          end
        end
    when 'delete'
      if @current_user.is_admin == false
        puts "Access denied."
      else
        Employee.view
        puts "Enter index number: "
        idx = gets.chomp.to_i
        Employee.delete idx+1 
      end
    when 'contacts'
        Employee.view
    when 'admin'
        Employee.admin_view
    when 'vacay'
      while true do  
        Employee.admin_view
        puts "Enter id # "
        id = gets.chomp.to_i
        puts "Enter vacation days to add: "
        days = gets.chomp.to_i
        Employee.vacation id, days
        puts "Would you like to edit more employees vacation days? y/n"
        user_input = gets.chomp
        break if user_input == 'n'
      end
    when 'records'
      while true do
        puts "Enter your ID # (for example: 214)"
        id = gets.chomp.to_i
        puts Employee.select id
        puts "Would you like to change your email? y/n"
        user_input = gets.chomp.to_s
        break if user_input == 'n'
        puts "Enter new email: "
        email = gets.chomp.to_s
        Employee.email id, email
        break
      end
    when 'add'
      while true do
        Employee.add_employee
        puts "Would you like to add more employees vacation days? y/n"
        user_input = gets.chomp
        break if user_input == 'n'
      end
    when '?'
      while true do
        query_search
        user_input = gets.chomp
        break if user_input == 'q'
      end
    when 'q'
        break
    end
  end
end

run
