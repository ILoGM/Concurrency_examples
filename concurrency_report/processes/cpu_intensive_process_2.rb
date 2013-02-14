def cpu_intensive_process
  puts "Pid: #{Process.pid}"
  x = 0
  1000000.times do |i|
    x = i + x
  end
end

3.times do |i|
  fork
end
cpu_intensive_process
