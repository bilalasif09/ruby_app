require 'rspec'
require_relative 'helper'

file = ['/a 111.222.333.444', '/b 111.222.333.444', '/a 111.222.333.444', '/d 222.333.444.555']
response_overall = [["/a", 2], ["/b", 1], ["/d", 1]]
response_unique = [["/a", 1], ["/b", 1], ["/d", 1]]
blk = Proc.new{ DataLists.new(Helper.sort_data(:overall), Helper.sort_data(:unique)) }
lists = Helper.sorted_lists(file, &blk)

RSpec.describe Helper do
    describe '#sorted_lists' do
        it 'get sorted data overall data' do
            expect(lists.get_overall_data).to eq(response_overall)
        end
    end
    describe '#sorted_lists' do
        it 'get sorted data unique data' do
            expect(lists.get_unique_data).to eq(response_unique)
        end
    end
    describe '#check_ip' do
        it 'check if ip is in correct format' do
            expect(Helper.check_ip('444.701.448.104')).to eq(true)
        end
    end
    describe '#check_url' do
        it 'check if url is in correct format' do
            expect(Helper.check_url('/url')).to eq(true)
        end
    end
    describe '#get_ip_n_url' do
        it 'extracts ip and url from string and return a hash' do
            expect(Helper.get_ip_n_url('/url 444.701.448.104').url).to eq('/url')
            expect(Helper.get_ip_n_url('/url 444.701.448.104').ip).to eq('444.701.448.104')
        end
    end
end