# MusicTracker class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.


## 2. Design the Class Interface


``` ruby
class MusicTracker

    def initialize # takes zero arguments
        # initalize method creates an empty list
    end

    def add(song) # takes one argument
        # should returns nothing unless non-string argument is passed - then returns error
        
    end

    def list # takes zero arguments
        # returns list with added songs
        # returns error is list is empty
    end

end

```

## 3. Create examples as tests

``` ruby
music_tracker = MusicTracker.new

# 1
music_tracker.add("Novacane")
music_tracker.list 
# => ["Novacane"]

# 2
music_tracker.add("Novacane")
music_tracker.add("Clouded")
music_tracker.list
=> ["Novacane", "Clouded"]

# 3
music_tracker.add(true)
# => "Please add a song you have listened to in correct format"

# 4
music_tracker.add("Novacane")
music_tracker.add("Novacane")
# => "Please add a new song that has not been added previously"
# 5
music_tracker.list
# => "Your library currently has zero songs added"



```


## 4. Implement the behaviour