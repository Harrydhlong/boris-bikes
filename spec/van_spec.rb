require 'van'

describe Van do
  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times do
        subject.dock double :bike
      end
      expect { subject.dock double(:bike) }.to raise_error 'Van is full'
    end
  end
end