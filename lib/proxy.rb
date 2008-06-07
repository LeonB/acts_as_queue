module ActsAsQueue
  class Proxy
    
    #Remove all instance methods, tear it down
    instance_methods.each do |m| 
      next if m =~ /^__/
      next if m == 'class'
      undef_method m
    end
    
    #Build it up
    attr_accessor :orig_value
    include ActsAsQueue::ListItem
  
    def initialize(orig_value, list)
      self.orig_value = orig_value
      self.list = list
    end
  
    def method_missing(method, *args)
      self.orig_value.send(method, *args)
    end
    
  end
end