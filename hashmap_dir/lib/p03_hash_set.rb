class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if count > num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    hash_num = num.hash
    idx = hash_num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    new_buckets = num_buckets * 2
    @store.each do |bucket|
      bucket.each do |num|
        new_idx = num % new_buckets
        new_store[new_idx] << num
      end
    end
    @store = new_store
  end
end
