require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_done!
    @todo1.done!
    assert_equal(true, @todo1.done == true)
  end
  
  def test_done?
    @todo1.done!
    assert_equal(true, @todo1.done?)
  end

  def test_undone!
    @todo1.done!
    @todo1.undone!
    assert_equal(false, @todo1.done?)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todo2, @list.first)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todo2, @list.last)
  end

  def test_done_question
    @list.each do |todo|
      assert_equal(false, todo.done?)
    end
  end

  def test_add_todo
    assert_raises(TypeError) do
      list = TodoList.new('Title')
      list << 5
    end
    assert_raises(TypeError) do
      list = TodoList.new('Title')
      list.add(5)
    end
  end

  def test_shovel_operator
    todo4 = Todo.new("test")
    @list << todo4
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("test")
    @list.add(todo4)
    @todos << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError){ @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(IndexError){ @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_all_undone
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_done
    @list.mark_done('Clean room')
    assert_equal(true, @todo2.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todo1, @list.remove_at(0))
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title('Clean room'))
  end

  def test_all_done
    @todo1.done!
    @todo2.done!
    result = @list.all_done
    assert_equal(2, result.size)
    assert_equal(3, @list.size)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!
    result = @list.all_not_done
    assert_equal(1, result.size)
    assert_equal(3, @list.size)
  end

  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
    @todo2.done!
    output2 = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output2, @list.to_s)

    @todo1.done!
    @todo2.done!
    @todo3.done!

    output3 = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output3, @list.to_s)
  end
  def test_each
    @list.each { |todo| todo.done! }
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(@list, @list.each { |todo| nil })
  end
  def test_select
    result = @list.select { |todo| todo.done? }
    assert_equal(0, result.size)
    @list.mark_all_done
    result = @list.select { |todo| todo.done? }
    assert_equal(3, result.size)
  end
end