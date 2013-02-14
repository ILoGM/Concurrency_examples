count = 0
threads = []
10.times do |i|
    threads[i] = Thread.new do
        # sleep(rand(0.1))
        Thread.current["mycount"] = count
        Thread.current["thread_num"] = i
        count += 1
    end
end
threads.each {|t| t.join; puts "#{t['mycount']}:t_n=#{t['thread_num']}, " } 
puts "count = #{count}"
