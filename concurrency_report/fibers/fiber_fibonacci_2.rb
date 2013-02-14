require 'fiber'
fib = Fiber.new do |f1,f2|
  loop do
    Fiber.yield f1
    f1, f2 = f2, f1 + f2
  end
end

puts "First 10 Fibo nums:"
10.times { puts fib.resume(1, 1) }
puts "And next 5 nums:"
5.times { puts fib.resume(100, 500) }
