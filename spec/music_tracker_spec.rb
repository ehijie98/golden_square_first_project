require 'music_tracker.rb'

RSpec.describe MusicTracker do
    describe "#add" do
        context "string argument passed as song name" do
            it "list method returns correct list" do
                music_tracker = MusicTracker.new
                music_tracker.add("Novacane")
                music_tracker.add("Clouded")
                list = music_tracker.list
                    expect(list).to eq ["Novacane", "Clouded"]
            end
        end

        context "non-string argument or empty string passed as song name" do
            it "fails" do
                music_tracker = MusicTracker.new
                    expect{music_tracker.add(true)}.to raise_error "Please add a song you have listened to in correct format"
            end

            it "fails" do
                music_tracker = MusicTracker.new
                    expect{music_tracker.add(" ")}.to raise_error "Please add a song you have listened to in correct format"
            end
        end

        context "adds song that has already been added" do
            it "fails" do
                music_tracker = MusicTracker.new
                music_tracker.add("Novacane")
                expect { music_tracker.add("Novacane") }.to raise_error "Please add a new song that has not been added previously"
            end
        end
    end

    describe "#list" do
        context "list is empty" do
            it "fails" do
                music_tracker = MusicTracker.new
                    expect{ music_tracker.list }.to raise_error "Your library currently has zero songs added"
            end
        end
    end
end