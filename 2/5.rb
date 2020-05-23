d = gets.chomp.to_i
m = gets.chomp
y = gets.chomp.to_i
h = {'Январь' => 31, 'Февраль' => 28, 'Март' => 31, 'Апрель' => 30,
     'Май' => 31, 'Июнь' => 30, 'Июль' => 31, 'Август' => 31, 'Сентябрь' => 30,
     'Октябрь' => 31, 'Ноябрь' => 30, 'Декабрь' => 31 }
if y % 4 != 0 || (y % 100 == 0) && (y % 400 != 0)
  f = 0
  s = 0
  h.each do |k, v|
    if (k != m) && (f == 0)
      s += v
    elsif k == m
      s += d
      f = 1
    end
  end
  puts s
else
  f = 0
  s = 0
  h['Февраль'] = 29
  h.each do |k, v|
    if (k != m) && (f == 0)
      s += v
    elsif k == m
      s += d
      f = 1
    end
  end
  puts s
end
