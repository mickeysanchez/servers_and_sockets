# Ruby Webrick Servers!

Fire up these servers on the command line:

* 'ruby server1.rb'

[webrick docs](http://ruby-doc.org/stdlib-1.9.3/libdoc/webrick/rdoc/WEBrick.html)

## Local Area Network

You can allow others on your LAN to visit your server
by having them visit http://your-ip-address-here:port

An example address:

* http://10.0.1.104:8888/

You can find your computer's
IP address by running:

* ifconfig | grep "inet " | grep -v 127.0.0.1

It wil be the first set of numbers after "inet"
probably something like: 10.0.1.104

If you are using OSX, you will need to enable
"Internet Sharing" under "Sharing" in your
System Preferences to let someone visit your server.
You shouldn't have to do anything to visit someone else's.