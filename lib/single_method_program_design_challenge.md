# `include_to_do?` method design

# 1. Design the problem
> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO

# 2. Design the method signature

```ruby
# include_to_do? checks if a text contains the string "TODO"
checklist = include_to_do?(text)

checklist = boolean value either true or false
text = any string e.g. "TODO: Wash the dishes."

```
# 3. Create examples as tests

```ruby
# 1
include_to_do?(" ") 
# => false

# 2
include_to_do?("TO DO: Wash the dishes.") 
# => false

# 3
include_to_do?("TODO: Wash the dishes.")
# => true

# 4
include_to_do?(nil) 
# => error

```

# 4. Implement the behaviours
