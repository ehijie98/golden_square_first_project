require 'todo'

RSpec.describe Todo do
    context "one task correctly added" do
        it "returns task" do
            task_1 = Todo.new("one")
            result = task_1.task
            expect(result).to eq "one"
        end
    end

    describe "#done?" do
        context "one task has been marked done" do
            it "returns true" do
                task_1 = Todo.new("one")
                task_1.mark_done!
                result = task_1.done?
                expect(result).to eq true
            end
        end
    end
    
    context "initializes where task is a non-string value" do
        it "fails" do
            expect {Todo.new(true)}.to raise_error "Please ensure task is a string value with contents"
            
        end    
    end

    context "initializes where task is an empty string" do
        it "fails" do
            expect {Todo.new("")}.to raise_error "Please ensure task is a string value with contents"
        end
    end

end