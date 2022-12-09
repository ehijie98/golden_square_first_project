require 'count_words'

RSpec.describe "count_words method" do
    it "returns no. of words in string" do
        result = count_words("We are learning to code.")
        expect(result).to eq 5
    end

    context "text is not a string" do
        it "fails" do
            expect { count_words(true) }.to raise_error "Please ensure text is a string!"
        end
    end
end


