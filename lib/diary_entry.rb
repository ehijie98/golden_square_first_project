class DiaryEntry
    def initialize(title, contents)
      fail "Please ensure both title and contents are string values" unless title.is_a?(String) && contents.is_a?(String)
      @title = title
      @contents = contents
      @last_word_read = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      return 0 if @contents.empty?
      @contents.count(" ") + 1
    end
  
    def reading_time(wpm) 
      fail "Please ensure wpm given is above 0!" unless wpm > 0
      reading_time = (count_words.to_f / wpm).ceil
      return reading_time
    end
  
    def reading_chunk(wpm, minutes) 
      fail "Please ensure wpm given is above 0!" unless wpm > 0
      fail "Please ensure minutes given is above 0!" unless minutes > 0
      no_of_words = wpm * minutes
      end_at = @last_word_read + no_of_words
      word_list = @contents.split(" ")[@last_word_read, end_at]
      if end_at >= count_words
        @last_word_read = 0
      else
        @last_word_read += no_of_words
      end
      return word_list.join(" ")
    end
  end