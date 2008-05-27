module ActsAsQueue
  module InstanceMethods
    def <<(item)
      length = self.length
      
      item.meta_eval do
        include ListItem
      end
      
      item.list = self
      item.instance_eval do
        @position = length
      end
      
      super(item)
    end
    
    def last_position
      self.length-1
    end
  end
end