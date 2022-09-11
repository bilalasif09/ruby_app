require_relative 'interface'
class Helper < Interface
    def self.check_ip adr
        /[0-9]\d\d.[0-9]\d\d.[0-9]\d\d.[0-9]\d\d/.match(adr) ? true : false
    end
    def self.check_url url
        /\//.match(url) ? true : false
    end
    def self.get_ip_n_url ln
        obj = DataLine.new
        ln.split(/ /).each do |ch|
            if check_ip ch
                obj.ip = ch
            elsif check_url ch
                obj.url = ch
            end
        end
        obj.ip and obj.url ? obj : nil
    end
    def self.sorted_lists file, &blk
        for line in file
            data_line = get_ip_n_url(line)
            next unless data_line #invalid data, proceed to next record
            DataRows.rows[data_line.url] = DataItem.new(Hash.new, 0, 0) unless DataRows.rows[data_line.url] #initialize if page appears first time
            if DataRows.rows[data_line.url].ips[data_line.ip] # if old user request
                DataRows.rows[data_line.url].overall += 1
            else
                DataRows.rows[data_line.url].ips[data_line.ip] = true
                DataRows.rows[data_line.url].unique += 1
                DataRows.rows[data_line.url].overall += 1
            end
        end
        yield
    end
    def self.sort_data key
        # sorting alphabetically and based on visits
        DataRows.rows.sort_by { |url| [-url[1][key], url[0]] }
    end
end