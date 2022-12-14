class Diary
    def initialize
        @diary_entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      # Returns nothing
      @diary_entries << entry
    end
  
    def all
      # Returns a list of instances of DiaryEntry
        fail "Zero diary entries have been added" if @diary_entries.empty?
        return @diary_entries
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
        return @diary_entries.sum(&:count_words)
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
        fail "Please ensure wpm given is above 0!" unless wpm > 0
        reading_time = (count_words.to_f / wpm).ceil
        return reading_time
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
        readable_entries_list = @diary_entries.select {|entry| 
            entry.reading_time(wpm) <= minutes
        }   
        return readable_entries_list.max_by(&:count_words)
    end
end
