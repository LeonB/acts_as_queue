module ActsAsQueue
  module InstanceMethods
    
    #TODO: automize the alias
    #TODO: automize the single-return methods
    #TODO: automize the array-based return methods
    
    def self.included(base)
      base.send :alias_method, :orig_first, :first
      base.send :alias_method, :first, :first_as_proxy
      
      base.send :alias_method, :orig_last, :last
      base.send :alias_method, :last, :last_as_proxy
      
      base.send :alias_method, :orig_each, :each
      base.send :alias_method, :each, :each_with_proxies
      
      base.send :alias_method, :orig_each_with_index, :each_with_index
      base.send :alias_method, :each_with_index, :each_with_index_with_proxies
      
      base.send :alias_method, 'orig_brackets', '[]'
      base.send :alias_method, '[]', :brackets_as_proxy
    end
  
    def first_as_proxy
      item = orig_first
      ActsAsQueue::Proxy.new(item, self)
    end
  
    def last_as_proxy
      item = orig_last
      ActsAsQueue::Proxy.new(item, self)    
    end
    
    def each_with_proxies(&block)
      orig_each do |item|
        item = ActsAsQueue::Proxy.new(item, self)
        #block.call(item)
        yield(item)
      end
    end
    
    def each_with_index_with_proxies(&block)
      orig_each_with_index do |*args|
        args[0] = ActsAsQueue::Proxy.new(args[0], self)
        yield(args)
      end      
    end
    
    def brackets_as_proxy(i)
      item = orig_brackets(i)
      ActsAsQueue::Proxy.new(item, self)    
    end
  
    def last_position
      self.length-1
    end
  end
end