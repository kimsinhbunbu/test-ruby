class FindSubValue
  def initialize(arr)
    @list = arr
  end

  def get_sub(target)
    result = []
    @list.each_with_index do |num1, i|
      @list[i+1..@list.size-1].each do |num2|
        if num1 + num2 == target
          result << [num1, num2]
        end
      end
    end
    result.empty? ? 'not found' : result.inspect
  end
end

arr = FindSubValue.new([4, 6, 7, 9, 10])
puts arr.get_sub(13) 
puts arr.get_sub(20) 
