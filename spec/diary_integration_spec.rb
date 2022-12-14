require 'diary'
require 'diary_entry'

RSpec.describe "Diary Integration Spec" do  
    context "adds all diary entries into diary" do
        it "returns full list" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
            diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            list = diary.all
                expect(list).to eq [diary_entry_1, diary_entry_2]
        end
    end

    context "adds zero diary entries into diary" do
        it "fails" do
            diary = Diary.new
            expect{diary.all}.to raise_error "Zero diary entries have been added"
        end
    end


    describe "word counting behaviour" do
        it "returns correct number of words in contents of all diary entries'" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
            diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            count = diary.count_words
                expect(count).to eq 7
        end
    end

        it "returns zero when contents is zero" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday 6pm", "")
            diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            count = diary.count_words
                expect(count).to eq 0
        end

    describe "reading time behaviour" do
        context "given a feasible wpm" do
            it "returns ceiling integer representing minutes taken to read all contents" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
                diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                time = diary.reading_time(3) 
                    expect(time).to eq 3
            end
        end

        context "given a wpm of zero" do
            it "fails" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
                diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                    expect{diary.reading_time(0)}.to raise_error "Please ensure wpm given is above 0!"
            end
        end
    end

    describe "#best_entry_for_reading_time" do
        context "two diary entries are added to diary with only one being readable" do
            it "returns the only entry readable in given time period" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
                diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                best_entry = diary.find_best_entry_for_reading_time(3, 1)
                    expect(best_entry).to eq diary_entry_1
            end
        end

        context "two unreadable diary entries are added to diary" do
            it "returns nil" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
                diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                best_entry = diary.find_best_entry_for_reading_time(2, 1)
                    expect(best_entry).to eq nil
            end       
        end

        context "multiple readable diary entries are added to diary" do
            it "returns the closest but not over readable diary entry in given time period" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a movie")
                diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
                diary_entry_3 = DiaryEntry.new("Thursday 7pm", "Went to the gym for a legs workout")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                diary.add(diary_entry_3)
                best_entry = diary.find_best_entry_for_reading_time(5, 1)
                    expect(best_entry).to eq diary_entry_2
            end
        end
        
        # not able to return both diary entires of equal length
        # context "two readable diary entries are added to diary" do
        #     it "returns both diary entries of equal length in list" do
        #         diary = Diary.new
        #         diary_entry_1 = DiaryEntry.new("Monday 6pm", "Watched a horror movie")
        #         diary_entry_2 = DiaryEntry.new("Tuesday 3pm", "Studied for mathematics exam")
        #         diary.add(diary_entry_1)
        #         diary.add(diary_entry_2)
        #         best_entry = diary.find_best_entry_for_reading_time(5, 1)
        #             expect(best_entry).to eq [diary_entry_1, diary_entry_2]
        #     end
        # end
    end
end