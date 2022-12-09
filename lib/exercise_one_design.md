# reading_time method design

# 1. Design the problem
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

# 2. Design the method signature
```ruby
reading_time = calculate_reading_time(text)
# Text is a string with a words
# Reading time will be an integer representing minutes
```
# 3. Create examples as tests
```ruby
# 1
calculate_reading_time("")
# => 0

# 2
calculate_reading_time("hello")
# => 1

# 3
calculate_reading_time(200_WORDS)
# => 1

# 4
calculate_reading_time(300_WORDS)
# => 2

# 5
calculate_reading_time(4000_WORDS)
# => 20
```

# 4. Implement the behaviours
