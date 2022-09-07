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
end