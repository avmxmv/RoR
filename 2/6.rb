n = gets.chomp
x = gets.chomp.to_f
y = gets.chomp.to_i
h = {}
summ = 0
while n != 'стоп' do
  h[n] = {'Ценa за единицу товара' => x, 'Кол-во купленного товара' => y}
  puts x * y
  summ += x * y
  n = gets.chomp
  x = gets.chomp.to_f
  y = gets.chomp.to_i
end
puts h
puts summ
