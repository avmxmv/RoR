a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
d = b * b - 4 * a * c
if d > 0
  puts (-b + d ** 0.5) / (2 * a), (-b - d ** 0.5) / (2 * a)
elsif d == 0
  puts -b / (2 * a)
else
  puts "Корней нет"
end