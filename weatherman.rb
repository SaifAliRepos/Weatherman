require 'csv'
require 'colorize'
String.colors


max_temp = []
max_tempreture = []
min_temp = []
min_tempreture = []
date = []
max_humidity = []
max_humid = []
CSV.foreach(('lahore_weather/lahore_weather_1997_Dec.txt'), headers: false, col_sep: ",") do |row|
  date << row[0]
  max_temp << row[1]
  max_humid << row[7]
  min_temp << row[3]
end



#converting nil into 0
max_tempreture = max_temp.map {|e| e ? e : 0}
max_humidity = max_humid.map {|e| e ? e : 0}
min_tempreture = min_temp.map {|e| e ? e : 0}
#puts "Max value is: #{max_temp.max{ |u| u.to_i }}"
max_tempreture

#converting strings into int
max_tempreture.map!(&:to_i)
max_humidity.map!(&:to_i)
min_tempreture.map!(&:to_i)

avg_min_temp = (min_tempreture.sum)/(min_tempreture.length)
avg_max_temp = (max_tempreture.sum)/(max_tempreture.length)
avg_humidity = (max_humidity.sum)/(max_humidity.length)

puts "\n-------- W E A T H E R M A N   P R O B L E M --------\n".colorize(:blue)

puts "\n******** M O D U L 1 E 1 **********\n".colorize(:red)

puts "Highest: #{max_tempreture.max}C on #{date[max_tempreture.index(max_tempreture.max)]}"

puts "Lowest: #{min_tempreture.min}C on #{date[min_tempreture.index(min_tempreture.min)]}"

puts "Highest: #{max_humidity.max}% on #{date[max_humidity.index(max_humidity.max)]} \n"

#puts max_tempreture.max()

puts "\n******** M O D U L 1 E 2 **********\n".colorize(:red)

puts "Highest Tempreture Average: #{avg_max_temp}C"

puts "Lowest Tempreture Average: #{avg_min_temp}C"

puts "Average Humidity: #{avg_humidity}%\n"

puts "\n******** M O D U L 1 E 3 **********\n".colorize(:red)

max_tempreture.each_with_index{|x,i|
  print "On #{date[i]}  "
x.times do
  print "\033[31m+\033[0m" #you need to run the run code in terminal for seeing colors
end
print "#{x}C"
puts " "

print "On #{date[i]}  "
min_tempreture[i].times do
  print "-".colorize(:blue) #you need to run the run code in terminal for seeing colors
end
print "#{min_tempreture[i]}C"
puts " "
}

puts "\n******** M O D U L 1 E 4 **********\n".colorize(:red)

max_tempreture.each_with_index{|x,i|
  print "On #{date[i]}  "
x.times do
  print "+".colorize(:red) #you need to run the run code in terminal for seeing colors
end
min_tempreture[i].times do
  print "-".colorize(:blue) #you need to run the run code in terminal for seeing colors
end
print " #{x}C  #{min_tempreture[i]}C"
puts " "
}






=begin
max_tempreture.each_with_index{

  |x, i| puts "Temp #{i}:"

  for x in max_tempreture do
    print "a"
  end
}
=end

#max_tempreture.delete('Max TemperatureC')

#max_tempreture = max_temp.compact()

=begin
for i in 2..33 do
  print "On #{date[i]} >> "
  max_tempreture.each{|x| puts "#{x}"}
  puts ""
end
=end
