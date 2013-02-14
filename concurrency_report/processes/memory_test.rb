hash = Hash.new #load up the memory a little
 
1000000.times do |i|
  hash[i] = "foo"
end
 
puts "Hash contains #{hash.keys.count} keys"
 
def show_memory_usage(whoami)
  pid = Process.pid
 
  mem = `pmap #{pid}`
 
  puts "Memory usage for #{whoami} pid: #{pid} is: #{mem.lines.to_a.last}"
 
  sleep #keep the process alive
end
 
puts "Now lets fork this process and see what memory is allocated to the child"
 
puts "Before..."
 
if fork
  show_memory_usage("parent")
else
   
  puts "After..."
 
  1000000.times do |i| #change the values in the child memory allocation
    hash[i] = "bar"
  end
     
  show_memory_usage("child")
end
