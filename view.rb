def display_menu
  puts "===== MENU ====="
  puts "(L) List items"
  puts "(A) Add item"
  puts "(D) Delete item"
  puts "(M) Mark item"
  puts "(Q) Quit item"
end

def display_items
  LIST.each_with_index do |item, index|
    # get the item name
    name = item[:name]
    checked = item[:status] ? "X" : " "
    puts "#{index + 1} - [#{checked}] #{name.capitalize}"
  end
end

def ask_for(action)
  puts "What is the #{action}?"
  print "> "
end
