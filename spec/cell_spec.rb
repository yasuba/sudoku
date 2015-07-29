require 'cell'

describe Cell do

  let(:subject){described_class.new(0, 0)}
  let(:cell2){described_class.new(2, 1)}

  it 'should know if it is unsolved' do
    expect(subject.solved?).to eq false
  end

  it 'should know its value' do
    expect(cell2.value).to eq 2
  end

  it 'should know its index' do
    expect(subject.index).to eq 0
  end

  it 'can find a missing value from its neighbours' do
    expect(subject.missing_values([0,8,2,5,7,1,4,9,3])).to eq [6]
  end

  it 'should be able to solve itself' do
    expect(subject.solve([[0,3,0,4,0,5,8,7], [5,7,6,4,3,1,2,8], [2,0,0,0,3,8,7,0]])).to eq 9
  end

end