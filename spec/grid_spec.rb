require 'grid'

describe Grid do

  context 'after initialization' do

    let(:subject) {described_class.new([4,3,5,2,6,9,7,8,1,6,8,2,5,7,1,4,9,3,1,9,7,8,3,4,5,6,2,8,2,6,1,9,5,3,4,7,3,7,4,6,8,2,9,1,5,9,5,1,7,4,3,6,2,8,5,1,9,3,2,6,8,7,4,2,4,8,9,5,7,1,3,6,7,6,3,4,1,8,2,5,9], Cell)}
    let(:unsolved) {described_class.new([4,0,2,0,0,1,8,7,6,3,0,8,0,0,5,0,9,4,6,0,9,4,0,8,3,0,5,0,3,1,0,6,4,0,0,0,2,4,5,9,0,7,1,6,3,9,0,7,2,0,3,5,4,8,0,9,0,8,0,2,0,0,0,1,8,3,0,4,9,6,5,2,5,2,4,1,3,6,9,0,7], Cell)}

    it 'should have 81 cells' do
      expect(subject.cells.count).to eq 81
    end

    it 'should have an unsolved first cell' do
      expect(subject.cells.first).to receive(:solved?).and_return(false)
      expect(subject.solved?).to eq false
    end

    it 'should have rows' do
      expect(subject.rows.first).to eq [subject.cells[0], subject.cells[1], subject.cells[2], subject.cells[3], subject.cells[4], subject.cells[5], subject.cells[6], subject.cells[7], subject.cells[8]]
    end

    it 'should have columns' do
      expect(subject.columns.first).to eq [subject.cells[0], subject.cells[9], subject.cells[18], subject.cells[27], subject.cells[36], subject.cells[45], subject.cells[54], subject.cells[63], subject.cells[72]]
    end

    it 'should have boxes' do
      expect(subject.boxes.first).to eq [subject.cells[0], subject.cells[1], subject.cells[2], subject.cells[9], subject.cells[10], subject.cells[11], subject.cells[18], subject.cells[19], subject.cells[20]]
    end

    it 'should know its rows' do
      expect(subject.row_values(0)).to eq [4,3,5,2,6,9,7,8,1]
    end

    it 'should know its columns' do
      expect(subject.column_values(0)).to eq [4,6,1,8,3,9,5,2,7]
    end

    it 'should know its boxes' do
      expect(subject.box_values(0)).to eq [4,3,5,6,8,2,1,9,7]
    end

    it 'should know cell 22 is in row 2' do
      expect(subject.find_row(22)).to eq 2
    end

    it 'should know cell 22 is in column 4' do
      expect(subject.find_column(22)).to eq 4
    end

    it 'should know cell 22 is in box 3' do
      expect(subject.find_box(22)).to eq 3
    end

    it 'should know a cells segment' do
      expect(unsolved.get_segments(1)).to eq [[4, 2, 0, 0, 1, 8, 7, 6], [0, 0, 3, 4, 0, 9, 8, 2], [4, 2, 3, 0, 8, 6, 0, 9]]
    end

    it 'should be able to solve a harder puzzle' do
      expect(unsolved.solve).to eq [4,5,2,3,9,1,8,7,6,3,1,8,6,7,5,2,9,4,6,7,9,4,2,8,3,1,5,8,3,1,5,6,4,7,2,9,2,4,5,9,8,7,1,6,3,9,6,7,2,1,3,5,4,8,7,9,6,8,5,2,4,3,1,1,8,3,7,4,9,6,5,2,5,2,4,1,3,6,9,8,7]
      expect(unsolved.solved?).to eq true
    end

  end

end

