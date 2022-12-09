require 'calculate_reading_time'

RSpec.describe "calculate_reading_time method" do
    it "takes one word and rounds up to 1" do
        result = calculate_reading_time("hello")
        expect(result).to eq 1
    end

    it "takes 200 words and returns 1" do
        TWO_HUNDRED_WORDS = (["hello"] * 200).join(" ")
        result = calculate_reading_time(TWO_HUNDRED_WORDS)
        expect(result).to eq 1
    end

    it "takes 300 words and returns 2" do
        THREE_HUNDRED_WORDS = (["hello"] * 300).join(" ")
        result = calculate_reading_time(THREE_HUNDRED_WORDS)
        expect(result).to eq 2
    end

    it "takes 4000 words and returns 20" do
        FOUR_THOUSAND_WORDS = (["hello"] * 4000).join(" ")
        result = calculate_reading_time(FOUR_THOUSAND_WORDS)
        expect(result).to eq 20
    end
end


