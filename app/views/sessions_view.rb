class SessionsView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def greet(user)
    puts "Welcome #{user.role} #{user.username}!"
  end

  def wrong_credentials
    puts "Wrong username or password."
    puts "Try again:"
  end
end
