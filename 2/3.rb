a = [1, 1]
i = 2
while a[i - 1] + a[i - 2] <= 100 do
  a << a[i - 1] + a[i - 2]
  i += 1
end
puts a
