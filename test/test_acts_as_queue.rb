class ActsAsQueueTest < Test::Unit::TestCase
  
  def setup
    @q = List.new
    
    @q << 'two'
    @q[1] = 'three'
    @q.push 'four'
    @q << 'five'
    @q.unshift 'one'
  end
  
  def test_filled_list
    assert_equal ['one', 'two', 'three', 'four', 'five'], @q
  end
  
  def test_first
    assert_equal 'one', @q.first
    assert_equal 0, @q.first.position
  end
  
  def test_last
    assert_equal 'five', @q.last
    assert_equal 4, @q.last.position    
  end
  
  def test_to_top
    @q.last.to_top
    assert_equal ['five', 'one', 'two', 'three', 'four'], @q
  end
  
  def test_to_bottom
    @q[2].to_bottom
    assert_equal ['one', 'two', 'four', 'five', 'three'], @q    
  end
  
  def test_move_up
    @q.first.move_up(2)
    assert_equal ['one', 'two', 'three', 'four', 'five'], @q
    
    @q.last.move_up(2)
    assert_equal ['one', 'two', 'five', 'three', 'four'], @q
  end
  
  def test_move_down
    @q.last.move_down(2)
    assert_equal ['one', 'two', 'three', 'four', 'five'], @q
    
    @q.first.move_down(2)
    assert_equal ['two', 'three', 'one', 'four', 'five'], @q
  end
  
  def test_swap
    @q.first.swap_with(4)
    assert_equal ["five", "two", "three", "four", "one"], @q
    
    @q.last.swap_with(@q.first)
    assert_equal ['one', 'two', 'three', 'four', 'five'], @q
  end
  
  def test_each
    @q.each do |item|
      item.to_top
    end
    assert_equal ['five', 'four', 'three', 'two', 'one'], @q
  end
  
  def test_each_with_index
    @q.each_with_index do |item, index|
      assert_equal @q[index], item
    end
    
    @q.each_with_index do |item, index|
      item.to_bottom if (index%2)
    end
    assert_equal ["two", "four", "one", "five", "three"], @q
    
    @q.each_with_index do |item, index|
      @q[index].to_bottom if (index%2)
    end
    assert_equal ["four", "five", "two", "three", "one"], @q
  end
  
  def test_each_index
    i = -1
    @q.each_index do |index|
      i = i+1
      assert_equal i, index
    end
  end
  
  def test_delete
    @q.delete 'one'
    @q.delete_at 2
    assert_equal ['two', 'three', 'five'], @q
  end
end