def include_to_do?(text)
    fail "Please ensure text is a string!" unless text.is_a? String
    text.include?("TODO")
end