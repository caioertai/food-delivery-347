class OrdersView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def display(orders)
    orders.each do |order|
      puts "#{order.meal.name} for #{order.customer.name} at #{order.customer.address}
      To be delivered by: #{order.employee.username}\n-"
    end
  end

  def display_elements(elements)
    elements.each do |element|
      puts "#{element.id} - #{element.name}"
    end
  end

  def ask_for_id(thing)
    puts "Pick #{thing} by id:"
    gets.chomp.to_i
  end
end
