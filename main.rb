require_relative 'helper'

class Main < Helper
    def self.sorted_lists file
        super do
            DataLists.new(sort_data(:overall), sort_data(:unique))
        end
    end
end

begin
    f = File.open(ARGV[0])
    file = f.readlines.map(&:chomp) 
    f.close
    lists = Main.sorted_lists(file)
    lists.print_overall_data
    lists.print_unique_data
rescue => exception
    puts "----\n\n Exception occurred \n\n #{exception} \n\n-----"
end
