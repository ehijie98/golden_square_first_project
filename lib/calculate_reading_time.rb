def calculate_reading_time(text)
    fail "Please ensure text is a string!" unless text.is_a? String
    minutes = text.split(" ").length.to_f / 200
    minutes.ceil
end