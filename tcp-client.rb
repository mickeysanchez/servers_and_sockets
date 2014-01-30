# not by me - got this somewhere online

require 'socket'

loop do
  s = TCPSocket.new 'localhost', 2000
  message = nil
  while message.nil?
    message = s.gets  # Read lines from socket
    puts message      # and print them
    message = nil
  end
  s.close
end

