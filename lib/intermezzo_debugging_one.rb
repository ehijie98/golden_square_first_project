def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end    
    return ciphertext_chars.join
  end


def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
  p cipher
  p "ciphertext.chars is #{ciphertext.chars}"
  p char
    out_char = cipher[char.ord - 65]
    p "Should be t"
    p "Actually is #{out_char}"
    exit
  end
  return plaintext_chars.join
end

# p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    unless char == " "
      counter[char] += 1
    end
  end
"final counter is #{counter.to_a.sort_by { |k, v| v }}"
  counter.to_a.sort_by { |k, v| v }[-1][0]
end

get_most_common_letter("the roof, the roof, the roof is on fire!")


# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"