class MealsView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def ask_for_price
    puts 'price?'
    print '> '
    gets.chomp.to_i
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name}, #{meal.price}€"
    end
  end
end
