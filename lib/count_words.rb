def count_words(text)
    fail "Please ensure text is a string!" unless text.is_a? String
    return text.split(' ').length
end