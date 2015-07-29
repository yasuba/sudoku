class Cell

  attr_accessor :value, :segment
  attr_reader :index

  COMPLETE_SEGMENT = [1,2,3,4,5,6,7,8,9]

  def initialize value, index
    @value = value
    @segment = []
    @index = index
  end

  def solved?
    @value != 0
  end

  def missing_values numbers
    COMPLETE_SEGMENT - numbers
  end

  def solve segment
    @segment = segment
    possible_answers = missing_values(segment.inject(:+).uniq)
    if (possible_answers.count == 1)
      @value = possible_answers.first
    else
      @value = 0
    end
  end


end
