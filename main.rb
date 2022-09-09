require_relative 'helper'

class Main
    extend Helper
    def self.by_overall_visits_desc file
        data = map_data file
        data.sort_by { |url| -url[1][:overall] }
    end
    def self.by_unique_visits_desc file
        data = map_data file
        data.sort_by { |url| -url[1][:unique] }
    end
    def self.sorted_lists file
        data = map_data file
        {
            overall_visits: data.sort_by { |url| -url[1][:overall] },
            unique_visits: data.sort_by { |url| -url[1][:unique] }
        }
    end
end

f = File.open(ARGV[0])
file = f.readlines.map(&:chomp) 
f.close

puts "ALL SORTED LISTS #{Main.sorted_lists(file)}"