require_relative 'contact.rb'
class CRM

  def initialize(name)
    puts "Okay, this CRM has the name " + name
  end

  def print_main_menu
  puts '[1] Add a new contact'
  puts '[2] Modify an existing contact'
  puts '[3] Delete a contact'
  puts '[4] Display all the contacts'
  puts '[5] Search by attribute'
  puts '[6] Exit'
  puts 'Enter a number: '
  end


  def add_new_contact
    print 'Enter First Name: '
  first_name = gets.chomp.to_s

  print 'Enter Last Name: '
  last_name = gets.chomp.to_s

  print 'Enter Email Address: '
  email = gets.chomp.to_s

  print 'Enter a Note: '
  note = gets.chomp.to_s

  a=Contact.create(first_name, last_name, email, note)
  puts a

  end


  def modify_existing_contact
   puts "Please enter the first_name of the contact you want to update."
   contact_name = gets.chomp
   found_contact = Contact.find_by("first_name", contact_name)
   puts "What would you like to modify: first_name, last_name, email or note?"
   variable = gets.chomp
   puts "Enter the value for #{variable}"
   value = gets.chomp
   found_contact.update(variable, value)
  end

  def delete_contact
    puts "Please enter the first_name of the contact you want to delete."
    contact_name=gets.chomp
    found_contact = Contact.find_by("first_name", contact_name)
    puts "#{found_contact}"
    found_contact.delete
  end

  def display_all_contacts
    a = Contact.all
    puts a
  end

  def search_by_attribute
    puts "What would you like to search by: first_name, last_name, email or note?"
    attribute=gets.chomp
    puts "Enter the value for #{attribute}"
    value=gets.chomp
    found_contact=Contact.find_by(attribute, value)
    puts found_contact
  end

  def call_option(number)
    case number
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
  # Finish off the rest for 3 through 6
  # To be clear, the methods add_new_contact and modify_existing_contact
  # haven't been implemented yet
    end
  end

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end
end

end
a_crm_app = CRM.new("Hello")
a_crm_app.main_menu




at_exit do
  ActiveRecord::Base.connection.close
end
