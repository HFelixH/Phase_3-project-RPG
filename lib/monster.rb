class Monster
  attr_accessor :health_points, :attack_points

  def initialize
    @health_points = 20
    @attack_points = 5
  end

  def attack(player)
    player.health_points -= @attack_points
  end

  def is_dead?
    @health_points <= 0
  end

  def to_s
    "A monster with #{@health_points} HP has appeared!!"
  end

  def interact(player)
    puts self
    while !player.is_dead? && !is_dead?
      puts 'What do you do? a - attack'
      action = gets.chomp
      next unless action == 'a'

      player.attack(self)
      attack(player)
      puts "Player HP: #{player.health_points}"
      puts "Monster HP: #{health_points}"
      puts "Monster is still alive!!" if !is_dead?
    end
    if player.is_dead?
      puts 'You ran out of HP...'
    elsif is_dead?
      puts 'You killed the monster!'
    end
  end
end
