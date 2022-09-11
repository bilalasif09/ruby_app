DataItem = Struct.new(:ips, :unique, :overall)
DataLine = Struct.new(:url, :ip)
DataRows = Struct.new(:rows).new(Hash.new)
DataLists = Struct.new(:overall_visits, :unique_visits) do
    def print_overall_data
        puts "Overall visits \n"
        puts overall_visits.map{|ov| "URL IS '#{ov[0]}', OVERALL VISITS ARE '#{ov[1].overall}'"}
    end
    def get_overall_data
        overall_visits.map { |ov| [ov[0], ov[1].overall]}
    end
    def print_unique_data
        puts "Unique visits \n"
        puts unique_visits.map{|ov| "URL IS '#{ov[0]}', UNIQUE VISITS ARE '#{ov[1].unique}'"}
    end
    def get_unique_data
        unique_visits.map { |ov| [ov[0], ov[1].unique]}
    end
end
class Interface
    def self.check_ip p1
        raise NotImplementedError.new("Check ip method is not implemented")
    end
    def self.check_url p1
        raise NotImplementedError.new("Check url method is not implemented")
    end
    def self.get_ip_n_url p1
        raise NotImplementedError.new("Get ip and url method is not implemented")
    end
    def self.sorted_lists p1, &block
        raise NotImplementedError.new("Sorted lists method is not implemented")
    end
    def self.sort_data p1
        raise NotImplementedError.new("Sort data method is not implemented")
    end
end