class PowerButton
  attr_reader :power
  def initialize
    @power = true 
  end

  def off
    @power = false
  end

end