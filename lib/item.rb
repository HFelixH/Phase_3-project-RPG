class Item
  TYPES = %i[potion sword key]

  attr_reader :type

  def initialize
    @type = TYPES.sample
  end

  def interact(player)
    case @type
    when :key
      player.can_escape += 100
      puts 'You found a key!'
    when :potion
      player.health_points += 10
      puts "You found a potion! Your health points are now #{player.health_points}"
    when :sword
      player.attack_points += 5
      puts "You found a sword! Your attack points are now #{player.attack_points}"
    end
  end
end
