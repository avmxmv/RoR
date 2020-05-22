a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
ma = [a, b, c].max
mi = [a, b, c].min
if ma**2 == mi**2 + (a + b + c - ma - mi)**2
  puts "Это прямоугольный треугольник"
end
if a == b && b == c
  puts "Это равносторонный треугольник"
elsif  a == b || b == c || c == a
  puts "Это равнобедренный треугольник"
end
