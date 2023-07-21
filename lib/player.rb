class Player
  atter_reader:
  def initialize(type)
    @type = find_type(type)
  end

  def find_type(type)
    case type
    when 1 || "x" || "X"
      "X"
    when 2 || "o" || "O" || 0
      "O"
    end
  end