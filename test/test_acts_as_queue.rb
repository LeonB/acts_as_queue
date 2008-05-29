class ActsAsQueueTest < Test::Unit::TestCase
  
  def setup
    #@array = Array.new

  end
  
  def test_to_top
    Array.send :include, ActsAsQueue
    #@array.class.send(:include, ActsAsQueue)
    #@array = ['one', 'two', 'three', 'four', 'five']
    @array = Array.new
    @array << 'one'
    @array << 'two'
    
    p @array.last
    p @array.class.included_modules
    @array.last.  to_top
    assert_equal ['five', 'two', 'three', 'four'], @array
  end
end

#arr[5].to_top
#arr[1].to_bottom 
#arr[3].position = 1
#arr[2].position #2
#arr[4].swap_with(2)
