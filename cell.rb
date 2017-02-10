class Cell
  attr_reader :status

  def initialize
    @status = [true, false].sample
  end

  def alive?
    @status
  end

  def kill!
    @status = false
  end

  def revive!
    @status = true
  end

  def inspect
    if alive?
      "*"
    else
      " "
    end
  end
end
