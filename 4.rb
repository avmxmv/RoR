a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
d = b * b - 4 * a * c
sqrt_from_d = d**0.5
if d > 0
  puts (-b + sqrt_from_d) / (2 * a), (-b - sqrt_from_d) / (2 * a)
elsif d == 0
  puts -b / (2 * a)
else
  puts "Корней нет"
end
