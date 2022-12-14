class TodoList
    def initialize
        @list = []
    end
  
    def add(todo) # todo is an instance of Todo
      # Returns nothing
      @list << todo
    end
  
    def incomplete
      # Returns all non-done todos
        @list.select {|todo| todo.done? == false}
    end
  
    def complete
      # Returns all complete todos
        @list.select {|todo| todo.done?}

    end
  
    def give_up!
      # Marks all todos as complete
        @list.each {|todo| todo.mark_done!}
    end

  end