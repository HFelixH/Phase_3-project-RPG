class Player
  attr_accessor :health_points, :attack_points, :can_escape

  def initialize
    @health_points = 50
    @attack_points = 10
    @can_escape = 0
  end

  def attack(monster)
    monster.health_points -= @attack_points
  end

  def is_dead?
    @health_points <= 0
  end

  def has_escaped?
    @can_escape.positive?
  end

  def to_s
    "Player HP: #{@health_points}"
  end
end
