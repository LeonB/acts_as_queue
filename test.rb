$: << './lib'

require 'lib/acts_as_queue.rb'
require 'lib/listitem.rb'

class TestList < Array
  include ActsAsQueue
end

l = TestList.new
l << 'one'
l << 'two'
l << 'three'
l << 'four'
l << 'five'

#l.each do |item|
#  p item
#end

l.first.swap_with(l.last.position)
l.last.to_top
l[1].to_bottom

p l.length
l.first.move_down(l.length)

p l
