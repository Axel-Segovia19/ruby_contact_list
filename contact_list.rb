@contacts = [
  {first_name: 'Axel', last_name: 'Segovia', age: 26, phone: '801-913-3020'},
  {first_name: 'Angel', last_name: 'Segovia', age: 28, phone: '801-558-8396'},
  {first_name: 'Eric', last_name: 'Segovia', age: 24, phone: '801-919-6188'},
  {first_name: 'Leslie', last_name: 'Segovia', age: 21, phone: '801-913-3020'},
  {first_name: 'Mike', last_name: 'Segovia', age: 18, phone: '801-913-3020'},
]


def welcome
  puts "Welcome to the Contact list!"
  menu
end

def menu
  puts "1) Create New Contact"
  puts "2) View Contact List"
  puts "3) Remove contact"
  puts "4) Edit a contact"
  puts "5) Exit"
  puts "What would you like to do?"
    menu_option = gets.strip.to_i
    if menu_option == 1 
      create_contact
    elsif menu_option == 2
      view_contacts
      menu
    elsif menu_option == 3
      remove_contact
    elsif menu_option == 4
      view_contacts
      puts "What contact would you like to update?"
      index = gets.strip.to_i
      edit_contact(index - 1)
      menu
      elsif menu_option == 5
        puts "Thank you Goodbye!"
        exit
      else 
        puts "Sorry you will need to choose either 1, 2 or 3"
        menu
  end 
end

def create_contact
  puts "Creating contact..."
  puts "What is the contact's first name?"
  first_name_input = gets.strip
  puts "What is the contact's last name?"
  last_name_input = gets.strip
  puts "What is the contacts age?"
  age_input = gets.strip
  puts "what is the contacts phone number?"
  phone_input = gets.strip


new_contact = {
  first_name: first_name_input, last_name: last_name_input, age: age_input, phone: phone_input}

  @contacts << new_contact
  menu
end

def view_contacts
  @contacts.each.with_index(1) do |contact, index|
    puts "#{index}"
    contact.each do |key, index|
      puts "#{key}: #{index}"
    end
    puts
end

def remove_contact
  view_contacts
  puts "which contact would you like to remove?"
  choice = gets.strip.to_i
    if choice == ''.to_i || (choice-1) > @contacts.length
      puts 'Try Again, Choose a contact from menu'
      remove_contact
    else
      puts "Successfully Deleted: #{@contacts[choice-1][:first_name]}"
      @contacts.delete_at(choice -1)
      menu
    end
end

def edit_contact(index)
    puts "what is the first name?"
    @contacts[index][:first_name] = gets.strip
    puts "what is the last name?"
    @contacts[index][:last_name] = gets.strip
    puts "what is the actual age?"
    @contacts[index][:age] = gets.strip.to_i
    puts "What is the updated phone number?"
    @contacts[index][:phone] = gets.strip
  
  end
end

welcome
