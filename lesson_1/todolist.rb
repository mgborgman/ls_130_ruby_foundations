class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)
    @todos << todo
  end

  def <<(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    counter = 0
    result = []
    while counter < size
      result << "#{item_at(counter)}"
      counter += 1
    end
    result.join("\n")
  end

  def each
    counter = 0

    while counter < size
      yield(item_at(counter))
      counter += 1
    end
    self
  end

  def select
    counter = 0
    result = []
    while counter < size
      result << item_at(counter) if yield(item_at(counter))
      counter += 1
    end
    list = TodoList.new(title)
    result.each do |todo|
      list.add(todo)
    end
    list
  end

  def find_by_title(title)
    result = nil
    select do |todo|
      result = todo if todo.title == title
      break unless result.nil?
    end
    result
  end

  def all_done
    result = TodoList.new(title)
    select do |todo|
      result << todo if todo.done?
    end
    result
  end

  def all_not_done
    result = TodoList.new(title)
    select do |todo|
      result << todo unless todo.done?
    end
    result
  end

  def mark_done(title)
    result = nil
    select do |todo|
      result = todo if todo.title == title
      break unless result.nil?
    end
    result.done! unless result.nil?
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

end