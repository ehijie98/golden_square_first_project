require 'make_snippet'

RSpec.describe "make_snippet method" do
    it "takes sentence longer than 5 words returning first 5" do
        result = make_snippet("once upon a time in far far away")
        expect(result).to eq "once upon a time in..."
    end
    it "takes sentence shorter than 5 words returning sentence" do
        result = make_snippet("this is four words")
        expect(result).to eq "this is four words"
    end
    context "when something other than text is entered" do 
        it "fails" do
            make_snippet(true)
            expect {(make_snippet(true))}.to raise_error "Text only please!"
        end
    end
end
