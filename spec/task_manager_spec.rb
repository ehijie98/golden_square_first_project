require 'task_manager'

RSpec.describe TaskManager do
    context "non-string argument is entered as name argument" do
        it "fails" do
            expect{TaskManager.new(true)}.to raise_error "Please enter name"
        end
    end
end

describe "#add" do
    context "string argument is entered as task" do
        it "returns no error" do
            task_manager = TaskManager.new("Colin")
            result = task_manager.add("wash the dishes")
                expect(result).to eq ["wash the dishes"]
        end
    end

    context "non-string argument is entered as task" do
        it "fails" do
            task_manager = TaskManager.new("Colin")
                expect{task_manager.add(2)}.to raise_error "Please add something feasible to your task manager!"
        end
    end
end
describe "#list" do
    context "list contains elements" do
        it "return string plus list of tasks to be completed" do
            task_manager = TaskManager.new("Colin")
                task_manager.add("wash the dishes")
                task_manager.add("tidy the boxes")
                result = task_manager.list
                    expect(result).to eq "Colin needs to: [\"wash the dishes\", \"tidy the boxes\"]"
        end
    end

    context "list is empty" do
        it "fails" do
            task_manager = TaskManager.new("Colin")
                expect{task_manager.list}.to raise_error "Colin has no tasks in their list"
        end
    end
end

describe "#completed" do
    context "list contains completed task" do
        it "returns modified list" do
            task_manager = TaskManager.new("Colin")
                task_manager.add("wash the dishes")
                task_manager.add("tidy the boxes")
                task_manager.completed("wash the dishes")
                result = task_manager.list
                    expect(result).to eq "Colin needs to: [\"tidy the boxes\"]"
        end
    end

    context "list does not contain completed task" do
        it "fails" do
            task_manager = TaskManager.new("Colin")
                task_manager.add("wash the dishes")
                task_manager.add("tidy the boxes")
                    expect{task_manager.completed("roll away the mat")}.to raise_error "This task is not present in your task manager"
        end
    end
end
