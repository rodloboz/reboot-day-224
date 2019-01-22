# USER STORIES
# ===========
# 1) As a User I can see a list of items
# 2) As a User I can add an item to the list
# 3) As a User I can delete an item from the list
# 4) As a User I can mark an item as done/completed

# DATA Modeling
# Item: { name: "socks", status: false }
# List: [ {}, {}]

# welcome user
# === START LOOP ===
# (L)ist (M)ark
# display the options/menu [list|add|delete|quit]?
# ask user for action
# store user choice
# execute the user choice => case
# === LOOP ENDS ===


# 1 - [ ] sockets
# 2 - [X] ruby book
# LIST
# - iterate through the list #each_with_index
# - display index incremented by 1
# - determine if item is marked or not
# - puts to the screen


# ADD
# ask for item name
# build hash with name and default status
# put it into the list array

# DELETE
# (by index)
# display list of items
# ask for item index
# remove the item from list (using the index) #delete_at

# by name
# display list of items
# ask for item name
# find item index


# MARK
# ask for item index
# update item in list
# to the opposite of whats there

LIST = [
  {
    name: "ipad",
    status: false
  },
  {
    name: "socks",
    status: true
  }
]

require 'byebug'
require_relative 'welcome'
require_relative 'view'
require_relative 'item'

# Application:
puts_welcome

loop do
  display_menu

  puts "Choose an option:"
  print "> "

  action = gets.chomp.strip

  case action
  when /^l(ist)?$/i
    display_items
  when /^a(dd)?$/i
    ask_for(:item)
    name = gets.chomp
    add_item(name)
  when /^d(elete)?$/i
    display_items
    ask_for(:index)
    answer = gets.chomp
    until answer =~ /^[1-#{LIST.size}]$/
      puts "Please choose a number between 1 and #{LIST.size}"
      ask_for(:index)
      answer = gets.chomp
    end
    index = answer.to_i - 1
    LIST.delete_at(index)
  when /^m(ark)?$/i
    display_items
    ask_for(:index)
    answer = gets.chomp
    until answer =~ /^[1-#{LIST.size}]$/
      puts "Please choose a number between 1 and #{LIST.size}"
      ask_for(:index)
      answer = gets.chomp
    end
    index = answer.to_i - 1
    item = LIST[index]
    item[:status] = !item[:status]
  when /^q(uit)?$/i
    puts "quiting..."
    break
  else
  puts "invalid option..."
  end
end

puts "Goodbye!"



















