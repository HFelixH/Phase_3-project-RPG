require_relative 'lib/item'
require_relative 'lib/monster'
require_relative 'lib/player'
require_relative 'lib/dungeon'

class Game
  ACTIONS = %i['m -move' 's -search']

  def initialize
    @player = Player.new
    @current_dungeon = Dungeon.new
    intro_game
    start_game
    end_game
    restart_game
  end

  private

  def intro_game
    puts 'Welcome to the dungeon!'
    puts 'You have 100 HP and 10 attack points.'
    puts 'You can move around the dungeon and search for items.'
    puts 'You can also attack monsters that you encounter.'
    puts 'If you find a sword, your attack points will increase.'
    puts 'If you find a potion, your health points will increase.'
    puts 'Find a key and escape the dungeon.'
    puts 'Good luck!'
  end

  def start_game
    while @player.health_points.positive? && !@player.has_escaped?
      puts "What do you do? (#{ACTIONS.join(',')}) :"
      action = gets.chomp
      case action
      when 'm'
        @current_dungeon.enter_dungeon
        puts "You are now in dungeon # #{@current_dungeon.number_of_dungeons_entered}"
      when 's'
        @current_dungeon.interact(@player)
      else
        puts 'Invalid action'
      end
    end
  end

  def end_game
    if @player.health_points <= 0
      puts "You died!! But managed to explore #{@current_dungeon.number_of_dungeons_entered} dungeons."
      puts 'GAME OVER!'
    else
      puts 'You found the key and escaped!'
      puts "You managed to explore #{@current_dungeon.number_of_dungeons_entered} dungeons."
      puts 'CONGRATULATIONS!'
    end
  end

  def restart_game
    puts 'Do you want to play again? (y/n)'
    answer = gets.chomp
    if answer == 'y'
      Game.new
    elsif answer == 'n'
      puts 'Thanks for playing!'
    else
      puts 'Invalid answer'
      puts 'You don\'t deserve to play again!'
    end
  end
end

Game.new