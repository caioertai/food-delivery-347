class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running  = true
    @employee = nil
  end

  def run
    while @running do
      @employee = @sessions_controller.login while @employee.nil?

      if @employee.manager?
        puts '1. Add a meal'
        puts '2. List available meals'
        puts '3. Add a customer'
        puts '4. List customers'
        puts '9. To sign out'
        puts '0. To leave'

        puts 'What do you want to do next?'
        print '> '
        action = gets.chomp.to_i

        case action
        when 1 then @meals_controller.add
        when 2 then @meals_controller.list
        when 3 then @customers_controller.add
        when 4 then @customers_controller.list
        when 9 then @employee = nil
        when 0 then @running = false
        else puts 'Wrong action'
        end
      else
        puts '1. Show my undelivered orders'
        puts '2. Mark an order of mine as delivered'
        puts '9. To sign out'
        puts '0. To leave'

        puts 'What do you want to do next?'
        print '> '
        action = gets.chomp.to_i
        case action
        when 1 then puts "TODO"
        when 2 then puts "TODO"
        when 9 then @employee = nil
        when 0 then @running = false
        else puts 'Wrong action'
        end
      end
    end
  end
end
