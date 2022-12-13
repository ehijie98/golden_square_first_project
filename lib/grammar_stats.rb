class GrammarStats
    # attr_accessor :words_array
    def initialize
      # ...
      @array = []
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.

        @array.push(text)
        # Not sure why this messes up rspec
        # The above messed up rspec as `percentage_good` would continuously push text into the loop - killing terminal 

        text[-1].match?(/[!.?]/) && text[0].match?(/[A-Z]/) ? true : false


    end
  
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
      correct_text = @array.select { |text| text[-1].match?(/[!.?]/) && text[0].match?(/[A-Z]/) ? true : false }
      (correct_text.length.to_f * 100 / @array.length)
    end
end