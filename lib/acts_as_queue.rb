#Idea stolen from rails/activerecord
module ActsAsQueue
  require 'ext/metaid.rb'
  require 'instancemethods.rb'
  require 'classmethods.rb'

  #Sets all things right
  def self.included(base) #:nodoc:
    base.extend ActsAsQueue::ClassMethods
    base.send(:include, ActsAsQueue::InstanceMethods)
  end
end

#TODO: add aliases like add_hook(), callbacks(), et cetera
#TODO: feature to add hooks/callbacks to instances instead of only classes