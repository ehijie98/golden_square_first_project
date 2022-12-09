require 'check_grammar'

RSpec.describe "check_grammar? method" do
    it "Correctly punctuated sentence returns true" do
        grammar_check = check_grammar?("Hello my name is John.")
        expect(grammar_check).to eq true
    end

    it "capitalised sentence no punctuation returns false" do
        grammar_check = check_grammar?("Hello my name is John")
        expect(grammar_check).to eq false
    end

    it "punctuated sentence no capital returns false" do
        grammar_check = check_grammar?("hello my name is John.")
        expect(grammar_check).to eq false
    end

    it "capitalised question returns true" do
        grammar_check = check_grammar?("What is your name?")
        expect(grammar_check).to eq true
    end

    context "text is not a string" do
        it "fails" do
            expect { check_grammar?(true) }.to raise_error "Please ensure text is a string!"
        end
    end
end