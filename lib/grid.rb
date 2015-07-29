require_relative 'cell'

class Grid

  attr_reader :cells

  def initialize cells = [], cell
    @cells = cells.map.with_index{|n, i| n = cell.new(n, i)}
  end

  def solved?
    @cells.map {|cell| cell.solved?}.all?
  end

  def rows
    @cells.each_slice(9).to_a
  end

  def columns
    rows.transpose
  end

  def boxes
    rows.transpose.each_slice(3).map{|segments| segments.transpose}.flatten.each_slice(9).to_a
  end

  def row_values index
    rows[index].map(&:value)
  end

  def column_values index
    columns[index].map(&:value)
  end

  def box_values index
    boxes[index].map(&:value)
  end

  def find_row index
    (index / 9)
  end

  def find_column index
    columns.each_with_index {|column, i| return i if column.include?(@cells[index])}
  end

  def find_box index
    boxes.each_with_index {|box, i| return i if box.include?(@cells[index])}
  end

  def get_segments i
    row = row_values(find_row(i))
    row.slice!(row.index(@cells[i].value))
    col = column_values(find_column(i))
    col.slice!(col.index(@cells[i].value))
    box = box_values(find_box(i))
    box.slice!(box.index(@cells[i].value))
    [row,col,box]
  end

  def try_to_solve
    @cells.map.with_index {|cell, i| cell.value == 0 ? cell.solve(get_segments(i)) : cell.value}
  end

  def solve
    unsolved_cells = @cells.count{|cell| !cell.solved?}
    looping = false
    while !solved? && !looping
      try_to_solve
      outstanding_cells = @cells.count{|cell| !cell.solved?}
      looping = unsolved_cells == outstanding_cells
      unsolved_cells = outstanding_cells
    end
    return @cells.map(&:value)
  end

end

