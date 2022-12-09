def make_snippet(text)
    fail "Text only please!" unless text.is_a?(String)
    word_array = text.split(" ")
    word_array.count > 5 ? word_array.first(5).join(" ") + "..." : text
end
