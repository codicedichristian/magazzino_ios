#LIBRARY
require 'socket'
require 'rubygems'
require 'json'
require 'mysql2'

# MY FILES

load 'Classes.rb'


#CONNECTION WITH MYSQL AND CLIENT
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "yesyesyes")

#con = Mysql2::Client.new(:host => "172.16.0.211", :username => "scorza", :password => "root")

port = 2000
server = TCPServer.new port






# START THE LOOP
loop do
  Thread.start(server.accept) do |client|
    my_thread_id = Thread.current.object_id
    sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
   # puts "from  #{remote_ip} port: #{remote_port}"
    puts "Thread ID: #{my_thread_id} - Time is #{Time.now}\n"


   #take the json
    #readString = client.read ## wait cr/lf
    readString = client.gets ## wait cr/lf
    puts readString
    puts "this is the string that i recived\n "+ readString + "\n"
    processStr(readString,con,client)
    puts "returned from process "
    puts "close client"
    client.close
  end
  end




  client.close
