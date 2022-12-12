require 'include_to_do'

RSpec.describe "include_to_do method" do 
    it "takes empty string and returns false" do
        checklist = include_to_do?(" ") 
        expect(checklist).to eq false
    end

    it "takes string with TO DO and returns false" do
        checklist = include_to_do?("TO DO: Wash the dishes.")
        expect(checklist).to eq false
    end

    it "takes string with TODO and returns true" do
        checklist = include_to_do?("TODO: Wash the dishes.")
        expect(checklist).to eq true
    end

    context "takes non-string argument and returns error" do
        it "fails" do 
            expect{include_to_do?(nil)}.to raise_error "Please ensure text is a string!"
        end
    end
end

