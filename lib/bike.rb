class Bike

  def initialize
    @broken = false
  end

  def working?
    true
  end

  def self.repair
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end