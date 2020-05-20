name = gets.chomp
r = (gets.chomp.to_i - 110) * 1.15
if r >= 0
  puts "Идиальный вес для #{name} равен #{r}"
else
  puts "Ваш вес уже оптимальный"
end