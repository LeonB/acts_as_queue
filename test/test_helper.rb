require 'test/unit'
require 'rubygems'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'acts_as_queue.rb'

class List < Array
  include ActsAsQueue
end