def menu
    puts "\n", "Current user logged in: #{@current_user.name}", "\n", "Admin? #{@current_user.is_admin}", "\n"
    puts "-----------------------------"
    puts "Employee View: Welders Record"
    puts "------------------------------", "\n"
    puts "contacts for contacts"
    puts "records to see your record"

    if @current_user.is_admin == true
      puts "\n", "-----------------------------"
      puts "Administrative Panel"
      puts "-----------------------------", "\n"
      puts "admin for admin view"
      puts "delete to delete employees"
      puts "add to add employees"
      puts "wage to edit wages"
      puts "vacay to add vacation days"
      puts "? for query"
      puts "Please enter a command or Q to quit"
    end
end
