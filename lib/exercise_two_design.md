# check_grammar? method design

# 1. Design the problem

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

# 2. Design the method signature

```ruby
grammar_check = check_grammar?(text)
# text is a string
# grammar_check will be true or false
```

# 3. Create examples as tests
```ruby
# 1
check_grammar?("Hello my name is John.")
# => true

# 2
check_grammar?("Hello my name is John")
# => false

# 3
check_grammar?("hello my name is John.")
# => false

# 4
check_grammar?("hello my name is John")
# => false

# 5
check_grammar?("What is your name?")
# => true

```

# 4. Implement the behaviours
