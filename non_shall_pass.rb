EMAIL = "ford@example.com"
PASSWORD = "password"
PASSWORD_VAULT = {aws: {username: "ford", password: "asdfasdf"}}

puts "Welcome to Non Shall Pass - A Password Manager"
puts "Please sign in to continue"
print "Enter email: "

user_email = gets.chomp

if user_email == EMAIL
  print "Enter password: "
  user_password = gets.chomp
else
  puts "Invalid email. Please try again."
  exit
end

unless user_password != PASSWORD
  puts "Hello, #{user_email}."
  puts "What would you like to do?"
  puts "1. Add a new service credentials"
  puts "2. Retreive and existing services credentials"
  puts "3. Exit"
  user_selection = gets.chomp
else
  puts "Invalid password. Please try again."
  exit
end

case user_selection
when "1"
  print "Enter the name of the service: "
  new_service = gets.chomp
  PASSWORD_VAULT[new_service] = {}
  print "Please enter the username for this new service: "
  new_service_username = gets.chomp
  PASSWORD_VAULT[new_service]["username"] = new_service_username
  print "Please enter the password for this new service: "
  new_service_password = gets.chomp
  PASSWORD_VAULT[new_service]['password'] = new_service_password
when "2"
  print "Please enter the name of the service you wish to access credentials for: "
  request_service_name = gets.chomp
  credentials = PASSWORD_VAULT[request_service_name.to_sym]

  puts "Here are the credentials for #{request_service_name}:"
  credentials.each do |key, val|
    puts "#{key}: #{val}"
  end
else
  puts "Exiting the program. Goodbye."
  exit
end