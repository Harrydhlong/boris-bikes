require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  # Let's upgrade our syntax, to:
  # use a '#' before a method name
  # to imply that it is an instance
  # method. Also look: nested describes!
  describe '#release_bike' do
    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock bike
      expect(subject.release_bike).to be bike
    end
    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'raises an error when there is a broken bike' do
      bike = double(:bike, broken?: true)
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times do
        subject.dock double :bike
      end
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:dock).with(1).argument }


end