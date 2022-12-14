class MusicTracker

    def initialize 
        @list = []
    end

    def add(song)
        fail "Please add a song you have listened to in correct format" unless song.is_a? String 
        fail "Please add a song you have listened to in correct format" if song == " "
        fail "Please add a new song that has not been added previously" if @list.include?(song)
        
        @list << song
    end

    def list 
        fail "Your library currently has zero songs added" if @list.empty?
        @list
    end


end