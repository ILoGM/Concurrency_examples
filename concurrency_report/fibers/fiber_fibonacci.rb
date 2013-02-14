fib = Fiber.new do
  f1 = f2 = 1
  loop do
    Fiber.yield f1
    f1, f2 = f2, f1 + f2
  end
end

puts "First 10 Fibonacci nums:"
10.times { puts fib.resume }
puts "And next 5 nums:"
5.times { puts fib.resume }
