a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
if [a, b, c].max ** 2 == [a, b, c].min ** 2 + (a + b + c - [a, b, c].max - [a, b, c].min) ** 2
  puts "Это прямоугольный треугольник"
end
if a == b && b == c
  puts "Это равносторонный треугольник"
elsif  a == b || b == c || c == a
  puts "Это равнобедренный треугольник"
end