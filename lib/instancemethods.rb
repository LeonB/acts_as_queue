module ActsAsQueue
  module InstanceMethods
    
    #    def self.included(base)
    #      base.instance_eval do
    #        self.each do |item|
    #          p item
    #        end
    #      end
    #    end
    
    def <<(item)
      p item
      make_it_a_listitem(item)
      super(item)
    end
    
    def make_it_a_listitem(item)
      length = self.length
      
      item.meta_eval do
        include ListItem
      end
      
      item.list = self
      item.instance_eval do
        @position = length
      end
    end
    
    def last_position
      self.length-1
    end
    
    def lastf
      p item
      print "\n\n\n\n"
      
      item = super
      make_it_a_listitem(item)
      return item
    end
  end
end