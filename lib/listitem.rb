module ListItem
  attr_accessor :list
  
  def initialize(list)
    self.list = list
  end
  
  def to_top
    self.position = 0
  end
  
  def move_up(steps = 1)
    self.position = self.position - steps
  end
  
  def move_down(steps = 1)
    self.position = self.position + steps
  end
  
  def to_bottom
    self.position = self.list.length - 1
  end
  
  def position
    self.list.index(self)
  end
  
  def position=(new_position)
    new_position = 0 if new_position < 0
    new_position = self.list.last_position if new_position > self.list.last_position
    
    current_position = self.position

    self.list.delete_at(current_position)
    self.list.insert(new_position, self)
  end
  
  def swap_with(new_position)
    swap = self.list[new_position]
    old_position = self.position
    
    swap.position = old_position
    self.position = new_position
    
  end
end