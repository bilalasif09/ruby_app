module Helper
    def check_ip adr
        /[0-9]\d\d.[0-9]\d\d.[0-9]\d\d.[0-9]\d\d/.match(adr) ? true : false
    end
    def check_url url
        /\//.match(url) ? true : false
    end
    def get_ip_n_url ln
        obj = {}
        ln.split(/ /).each do |ch|
            if check_ip ch
                obj[:ip] = ch
            elsif check_url ch
                obj[:url] = ch
            end
        end
        obj[:ip] and obj[:url] ? obj : nil
    end
    def map_data file
        data = {}
        for line in file
            obj = get_ip_n_url line
            next unless obj #invalid data, proceed to next record
            
            unless data[obj[:url]]
                #initialize if page appears first time
                data[obj[:url]] = {}
            end

            if data[obj[:url]][obj[:ip]]
                # if old user request
                data[obj[:url]][:overall] += 1
            else
                data[obj[:url]][obj[:ip]] = true
                if data[obj[:url]][:unique]
                    # if new user request after few visits to pages from other user(s)
                    data[obj[:url]][:unique] += 1 
                    data[obj[:url]][:overall] += 1
                else
                    # if first request on page
                    data[obj[:url]][:unique] = 1
                    data[obj[:url]][:overall] = 1
                end
            end
        end
        data
    end
end