def cpu_intensive_process
  puts "Pid: #{Process.pid}"
  x = 0
  1000000.times do |i|
    x = i + x
  end
end

fork
cpu_intensive_process
