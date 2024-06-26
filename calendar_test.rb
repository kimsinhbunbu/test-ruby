require 'date'

def print_calendar_of_year(year)
  # list month
  month_names = Date::MONTHNAMES[1..12]
  date_names =  ["Su","Mo","Tu","We","Th","Fr","Sa"]

  month_names.each_with_index do |month_name, month_index|
    month = month_index + 1
    puts "     #{month_name} #{year}"

    date_names.each do |date_name|
        print " "+date_name
    end
    puts ""

    first_day_of_month = Date.new(year, month, 1)
    last_day_of_month = Date.new(year, month, -1)
    start_day_of_week = first_day_of_month.strftime("%u").to_i

    print "   " * (start_day_of_week - 1)

    (1..last_day_of_month.day).each do |day|
      print day.to_s.rjust(3)
      start_day_of_week +=1
    #   reset start day and /n
      start_day_of_week = 1 and puts "" if start_day_of_week > 7
    end 

    puts "\n\n"
  end
end

print_calendar_of_year(2019)