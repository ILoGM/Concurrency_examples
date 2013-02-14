require 'net/http'
pages = %w( www.rubycentral.com slashdot.org www.google.com )
threads = []
for page_to_fetch in pages
    threads << Thread.new(page_to_fetch) do |url|
        h = Net::HTTP.new(url, 80)
        puts "Fetching: #{url} at #{Time.new.to_f}"
        resp = h.get('/', nil )    
        puts "Got #{url}: #{resp.message} at #{Time.new.to_f}"
    end
end 
threads.each {|thr| thr.join }
