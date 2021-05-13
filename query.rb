require_relative ('employee.rb')
require_relative ('menu.rb')
require_relative ('query.rb')

def check_query(query_string) 
  if query_string.include?('where') # query_string input will return true if string includes 'where'
    true
  else
    false
  end
end

def query_search
  puts "Enter query phrase in following format (no brackets)" # format guide
  puts "- where [email] [equals] [welderworld@gmail.com]"
  puts "- where [vacation days] [greater/less than] [0-14]"
  puts "- where [wage] [greater/less than] [25 - 32]"
  puts "- where [email] [contains *@domainname.com]\n\n"
  query_string = gets.chomp # input for query string 
  if check_query(query_string) == false # raise an error if check_query returns false
    raise StandardError.new "Incorrect query format." 
  end

  if query_string.include?("vacation days")  # checks if query includes "vacation days"
    if query_string.include?("greater than") # checks if query includes "greater than"
      condition, value = query_string.split("than ") #splits query at "than " into condition(useless), value(interger)
      condition = "greater" # condition set as string
      results = Employee.find_vacation(condition, value.to_i) # var result equal return Array of find_vacation
        if results != nil # if results are not nil
          results.each { |e| puts "#{e.name} has #{e.vacation} vacation days remaining"} # Iterate over results, each iteration prints employee name and vacation properties
        else
          puts "#{query_string} has no results" # else print string
        end
    elsif query_string.include?("less than") # similar to ln 25 to 33
      condition, value = query_string.split("than ")
      condition = "less"
      results = Employee.find_vacation(condition, value.to_i)
        if results != nil
          puts "#{query_string} results\n"
          results.each { |e| puts "#{e.name} has #{e.vacation} vacation days remaining"}
        else
          puts "#{query_string} has no results"
      end
    end
  elsif query_string.include?("wage") # else if query string is wage
    if query_string.include?("greater than")
      condition, value = query_string.split("than ")
      condition = "greater"
      employees = Employee.find_wage(condition, value.to_i)
      if employees != nil
        puts "#{query_string} results\n"
        employees.each { |e| puts "#{e.name} has a wage of #{e.wage}"}
      else
        puts "#{query_string} has no results"
      end
    elsif query_string.include?("less than")
      condition, value = query_string.split("than ")
      condition = "less"
      employees = Employee.find_wage(condition, value.to_i)
        if employees != nil
          puts "#{query_string} results\n"
          employees.each { |e| puts "#{e.name} has a wage of #{e.wage}"}
        else
          puts "#{query_string} has no results"
      end
    end
  elsif query_string.include?("email equals ") # email equals query
    _, email = query_string.split("email equals ")
    result = Employee.find_email(email)
    if result != nil
      puts "This is the result: #{result}"
    else
      puts "#{query_search} contains no results."
    end
  elsif query_string.include?("*@") # email domain/company domain query
    _, domain = query_string.split("contains *@")
    results = Employee.by_company(domain)
    if results != nil
      results.each do |r| 
        puts "Match: #{r}\n"
      end
    else
      puts "#{query_string} has no results"
    end
  else
    puts "\n\nThis doesn't make sense"
  end
end
