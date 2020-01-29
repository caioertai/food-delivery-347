class CustomersView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}, #{customer.address}"
    end
  end
end
