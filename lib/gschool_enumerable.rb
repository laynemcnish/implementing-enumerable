module GschoolEnumerable

  def g_each
    for item in self
      yield(item)
    end
    self
  end

  def g_select
    ary = []
    self.g_each do |item|
      ary << item if yield(item)
    end
    ary
  end

  def g_reject
    ary = []
    self.g_each do |item|
      item if yield(item)
      ary << self.delete(item)
    end
    ary
  end

  def g_map(&block)
    ary = []
    self.g_each do |item|
      ary << block.call(item)
    end
    ary
  end

  def g_find
    ary = []
    self.g_each do |item|
      ary << item if yield(item)
    end
    ary.first
  end

  def g_select!
    self.g_each do |item|
      self.delete(item) unless yield(item)
    end
    self
  end
end





