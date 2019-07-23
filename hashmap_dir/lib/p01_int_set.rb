class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @store.length
    #require "byebug"
    #debugger
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    inclusion = include?(num)
    return false if inclusion

    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)

  end

  def include?(num)
    idx = num % num_buckets
    bucket = @store[idx]

    bucket.each do |el|
      return true if num == el
    end
    false

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    #increment count
    #compare to count
    #resize! if necessary
    inclusion = include?(num)
    return false if inclusion
    @store[num % num_buckets] << num
    @count += 1

    resize! if @count > num_buckets
    #resize
  end

  def remove(num)
    inclusion = include?(num)
    if inclusion
      @store[num % num_buckets].delete(num)
      @count -= 1
    end

    #resize
  end

  def include?(num)
    idx = num % num_buckets
    bucket = @store[idx]

    bucket.each do |el|
      return true if num == el
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    #make temp array with size * 2
    #map store elements to new spots in temp array
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
