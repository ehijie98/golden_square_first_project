def check_grammar?(text)
    fail "Please ensure text is a string!" unless text.is_a? String
    text[0] == text[0].upcase && text[-1].match?(/[?!.]/)
end