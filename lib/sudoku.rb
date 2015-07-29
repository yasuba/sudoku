class Sudoku

  COMPLETE_SEGMENT = [1,2,3,4,5,6,7,8,9]

  def initialize numbers
    # turns the string to a giant hash with the index as the key and the value as the value
    @grid = Hash[numbers.split('').map.with_index{|item, index| [index, item.to_i]}]
  end

  def row_indexes
    ( 0..80).each_slice(9).to_a
  end

  def column_indexes
    row_indexes.transpose
  end

  def box_indexes
    row_indexes.transpose.each_slice(3).map{|segments| segments.transpose}.flatten.each_slice(9).to_a
  end

  def missing_number numbers
    COMPLETE_SEGMENT - numbers
  end

  def missing_indexes
    @grid.select{|k,v| v == 0 }.keys
  end

  def locate index
    (row_indexes + column_indexes + box_indexes).select{|segment| segment.include?(index)}
  end

  def get_values indexes
    indexes.map{|index| @grid[index]}
  end

  def missing_values
    missing_indexes.map do |missing_index|
      { missing_index => best_option( locate(missing_index).map{|segment| get_values(segment)}.map{|values| missing_number(values)})}
    end
  end

  def best_option numbers
    numbers.each{|number| return number.first if number.count == 1}
  end

end
