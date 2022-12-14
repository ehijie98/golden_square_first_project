require 'diary_entry'

RSpec.describe DiaryEntry do 
    it "initializes new entry" do
        diary_entry = DiaryEntry.new("diary_title", "diary_contents")
            expect(diary_entry.title).to eq ("diary_title")
            expect(diary_entry.contents).to eq ("diary_contents")
    end
    context "title and contents only allows strings" do
        it "fails" do
            expect {DiaryEntry.new(123, 2)}.to raise_error "Please ensure both title and contents are string values"
        end
    end

    describe "#count_words" do
        it "returns number of words of contents as an integer" do
        diary_entry = DiaryEntry.new("diary_title", "took a nap")
            expect(diary_entry.count_words).to eq 3
        end
        it "returns zero when contents is empty" do
        diary_entry = DiaryEntry.new("diary_title", "")
            expect(diary_entry.count_words).to eq 0
        end
    end

    describe "#reading_time" do
        context "given a feasible wpm" do
            it "returns ceiling integer representing minutes taken to read contents" do
                DIARY_CONTENTS_ONE = (["contents"] * 200).join(" ")
                diary_entry = DiaryEntry.new("diary_title", DIARY_CONTENTS_ONE)
                    expect(diary_entry.reading_time(100)).to eq 2
                DIARY_CONTENTS_TWO = (["contents"] * 300).join(" ")
                diary_entry = DiaryEntry.new("diary_title", DIARY_CONTENTS_TWO)
                    expect(diary_entry.reading_time(140)).to eq 3
                DIARY_CONTENTS_THREE = (["contents"] * 50).join(" ")
                diary_entry = DiaryEntry.new("diary_title", DIARY_CONTENTS_THREE)
                    expect(diary_entry.reading_time(100)).to eq 1
            end
        end

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("diary_title", "diary_contents")
                    expect{diary_entry.reading_time(0)}.to raise_error "Please ensure wpm given is above 0!"
            end
        end

        it "returns zero if contents is empty" do
            diary_entry = DiaryEntry.new("diary_title", "")
                expect{diary_entry.reading_time(100).to eq 0}
        end
    end

    describe "#reading_chunk" do
        context "with a contents readable within the given minutes" do
            it "returns the full contents" do
                diary_entry = DiaryEntry.new("diary_title", "diary contents here")
                    expect(diary_entry.reading_chunk(100, 2)).to eq "diary contents here"
            end
        end  
        
        context "with a contents only partially readable within the given minutes" do
            it "returns only some of the contents" do
                diary_entry = DiaryEntry.new("diary_title", "diary contents here")
                    expect(diary_entry.reading_chunk(1, 2)). to eq "diary contents"
            end

            it "returns next reading chunk, next time it is called" do
                diary_entry = DiaryEntry.new("diary_title", "diary contents here")
                diary_entry.reading_chunk(1, 2)
                next_chunk = diary_entry.reading_chunk(1, 2)
                    expect(next_chunk).to eq "here"
            end

            it "restarts to the beginning of contents after all contents has a read" do
                diary_entry = DiaryEntry.new("diary_title", "diary contents here")
                diary_entry.reading_chunk(1, 2)
                diary_entry.reading_chunk(1, 2)
                next_chunk = diary_entry.reading_chunk(1, 2)
                    expect(next_chunk).to eq "diary contents"
            end

        end

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("diary_title", "diary_contents")
                    expect{diary_entry.reading_chunk(0, 1)}.to raise_error "Please ensure wpm given is above 0!"
            end
        end

        context "given a no of minutes of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("diary_title", "diary_contents")
                    expect{diary_entry.reading_chunk(1, 0)}.to raise_error "Please ensure minutes given is above 0!"
            end
        end
    end
end

