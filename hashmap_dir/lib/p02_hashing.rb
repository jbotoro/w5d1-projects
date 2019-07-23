class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    if self.length > 4
      mid = self.length / 2
      mid_value = self[mid]

      first_value = self[0..2].sum
      last_value = self.last 

      first_value_odd = first_value.odd? ? 32 ^ last_value : 50 ^ self.length

      first_term = ((mid_value * self.length) + (self.length ^ last_value))
      second_term = ((first_value ^ last_value) + first_value_odd)

      (first_term * second_term)
    else
      return 0 if self.empty? 
      sum = 0
      self.each_with_index do |el,idx|
        if el.odd?
         sum += (1 + idx ^ self[0])
        else
          sum += (2 + idx * self[0])
        end
      end
      sum
    end
  end
end

class String
  def hash
    return 0 if self.length == 0
    array = self.split("")
    array.map! {|el| el.ord}
    #puts "==========\n"
    #puts self
    #p array
    #puts "==========\n"
    val = array.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # new_array = []
    # self.values.each do |el| 
    #   new_array << el if el.is_a?(Integer)
    #   new_array << el.ord if el.is_a?(String)
    # end
    # new_array.hash
    
    return 0 if empty?

    keys_array = self.keys.sort


    mid_value = self[keys_array[keys_array.length / 2]] #self[self.keys[self.keys.length / 2]]
    first_value = self[keys_array[0]]#self[self.keys[0]]
    last_value = self[keys_array[-1]]#self[self.keys[-1]]

    #p self.keys


    mid_value = mid_value.ord if mid_value.is_a?(String)
    first_value = first_value.ord if first_value.is_a?(String)
    last_value = last_value.ord if last_value.is_a?(String)
     
    first_value_odd = first_value.odd? ? 32 ^ last_value : 50 ^ self.length

    first_term = ((mid_value * self.length) + (self.length ^ last_value))
    second_term = ((first_value ^ last_value) + first_value_odd)
    (first_term * second_term)
  end
end
