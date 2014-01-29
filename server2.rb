require 'webrick'

# This is a server running on port 8889.
# If you visit it with your iPhone, you
# will be taken to a secret page. 
# Otherwise, it will redirect you to a gif.

server = WEBrick::HTTPServer.new :Port => 8889
trap('INT') { server.shutdown }

URL = "https://24.media.tumblr.com/454ea3dac83d37b552ffe8b49b451130/tumblr_mzrn32oNAJ1r3nk7bo2_500.gif"

server.mount_proc '/' do |req, res|
  puts "REQUEST:"
  puts req

  if req.meta_vars["HTTP_USER_AGENT"].include?("iPhone")
    res.body = "SECRET IPHONE PAGE!"
  else
    res.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, URL)
  end

  puts "RESPONSE:"
  puts res
end

server.start
