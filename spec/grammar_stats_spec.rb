require 'grammar_stats'

RSpec.describe GrammarStats do
    describe "#check" do
        context "takes grammatically correct text as argument" do
            it "returns true for fullstop and starting capital letter" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello.")
                    expect(result).to eq true
            end
        

            it "returns true for exclamation mark and starting capital letter" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello!")
                    expect(result).to eq true
            end
        end

        context "takes grammatically incorrect text as argument" do
            it "returns false for fullstop and starting smallcase letter" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("hello.")
                    expect(result).to eq false
            end

            it "returns false for starting capital letter and missing punctuation mark" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello")
                    expect(result).to eq false
            end

            it "returns false for starting capital letter and incorrect punctuation mark" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello*")
                    expect(result).to eq false
            end
        end
    end

    describe "#percentage_good" do
        context "all text in array are gramatically correct" do
            it "returns 100" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hello!")
                grammar_stats.check("Hello.")
                    expect(grammar_stats.percentage_good).to eq 100
            end
        end

        context "50% of text in array are gramatically correct" do
            it "returns 50" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("Hello!")
                grammar_stats.check("hello.")
                    expect(grammar_stats.percentage_good).to eq 50
    
            end
        end 

        context "0% of text in array is gramatically correct" do
            it "returns 50" do
                grammar_stats = GrammarStats.new
                grammar_stats.check("hello")
                grammar_stats.check("hello")
                    expect(grammar_stats.percentage_good).to eq 0
            end
        end
    end
end
