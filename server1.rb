require 'webrick'

# This is a server running on port 8888.
# It will take in query strings:
#       /?key=value
# and display them in the browser.

server = WEBrick::HTTPServer.new :Port => 8888
trap('INT') { server.shutdown }

server.mount_proc '/' do |req, res|
  @query_strings ||= []

  @query_strings << req.query unless req.query.values.empty?

  res.body = "FEED ME QUERY STRINGS!
              \n \n #{@query_strings.join("\n")}"
end

server.start
