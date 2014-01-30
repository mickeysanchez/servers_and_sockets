require 'socket'
require 'colorize'

# INTRO
  puts "\n||||||||||||||".colorize(background: :red)
  puts "   LAN CHAT   "
  puts "||||||||||||||\n".colorize(background: :red)
  print "Give yourself a name:"
  name = gets.chomp

  sleep(0.25)
  puts "\nWelcome to the chatroom #{name}!"
  sleep(0.25)
  puts "You are connected. Say whatev."

# SENDER
Thread.new(name) do |name|
  chat_socket = UDPSocket.new
  chat_socket.setsockopt(:SOCKET, :SO_BROADCAST, 1)

  while message = gets
    message = "#{name}".colorize(:blue).underline + " < #{message}"
    chat_socket.send message, 0, "255.255.255.255", 31337
  end
end

# RECEIVER 
chat_socket = UDPSocket.new
chat_socket.bind "", 31337

while received_message = chat_socket.gets.chomp
  sleep(0.2)
  puts received_message
  print ":".colorize(:red)
end
