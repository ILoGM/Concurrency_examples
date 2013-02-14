require 'fiber'

# Fiber.new получает блок в качестве аргумента, 
# но он не выполняется сразу же, а только после resume.
my_fiber = Fiber.new do
  puts 'fiber> started'
  Fiber.yield # Отдаем управление контексту, который запустил волокно.
  puts 'fiber> resumed'
end

puts 'main> let\'s start our fiber:'
my_fiber.resume

puts 'main> we\'re back in the main flow. Let\'s resume the fiber again:'
my_fiber.resume

puts 'main> end.'
