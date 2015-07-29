require 'sudoku'

describe Sudoku do

  context 'after intialization' do
    let(:subject){described_class.new('317569842652148397498732615876491253923875461145326978234957186789613524561284739')}
    let(:unsolved_game){described_class.new('317069842562148397498732615876491253923875461145326978234957186789613524561284739')}

    it 'knows its rows' do
      expect(subject.row_indexes).to eq [[0, 1, 2, 3, 4, 5, 6, 7, 8], [9, 10, 11, 12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23, 24, 25, 26], [27, 28, 29, 30, 31, 32, 33, 34, 35], [36, 37, 38, 39, 40, 41, 42, 43, 44], [45, 46, 47, 48, 49, 50, 51, 52, 53], [54, 55, 56, 57, 58, 59, 60, 61, 62], [63, 64, 65, 66, 67, 68, 69, 70, 71], [72, 73, 74, 75, 76, 77, 78, 79, 80]]
    end

    it 'knows its columns' do
      expect(subject.column_indexes.first).to eq [0, 9, 18, 27, 36, 45, 54, 63, 72]
    end

    it 'knows its boxes' do
      expect(subject.box_indexes.first).to eq [0, 1, 2, 9, 10, 11, 18, 19, 20]
    end

    it 'knows the row and box of the number that is missing' do
      expect(subject.missing_number([0,2,3,4,5,6,7,8,0])).to eq [1,9]
    end

    it "missing indexes" do
      expect(unsolved_game.missing_indexes).to eq [3]
    end

    it 'can locate which segment index is in' do
      expect(subject.locate(0)).to eq [subject.row_indexes.first, subject.column_indexes.first, subject.box_indexes.first]
    end

    it 'retrieves values of indexes' do
      expect(subject.get_values([0,1,2,3,4,5,6,7,8])).to eq [3,1,7,5,6,9,8,4,2]
    end

    it 'knows missing number is 5' do
      expect(unsolved_game.missing_values).to eq [{3=>5}]
    end

    it 'knows the best option' do
      expect(subject.best_option([[1,2],[1],[2]])).to eq 1
    end

  end

end