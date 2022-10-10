require_relative 'lib/dice'
require_relative 'lib/rng_events'
require_relative 'lib/treasure'

# RPG - TEXT BASED

# 1) Check if player is alive - damage =< 0
# 2) Player moves between dungeons
# 3) check to see if a monster is in the dungeon
# 4) allow actions - search or attack
# 5) RNG - monsters
## RNG monsters attack
# 7) include treasure when players serach - Treasure will be RNG
# 8) GAME OVER when taken damage

# VARIBLES
number_of_dungeons_entered = 1
treasure_count = 0
damage = 5
escaped = false
monster = false
current_dungeon = ''

## Create Dungeon
def create_dungeon
  'You have entered a dark dungeon. What will you do...?'
end

# INTRO
puts 'You are trapped in a dungeon. Survive and escape!'
puts 'Keep your eye out for treasure!'
puts 'Watch out for monsters!!'

# GAME LOOP
while damage.positive? && !escaped

  # GAME CODE
  actions = ['m - move', 's - search']
  ## available actions for players to choose
  puts "dungeon # #{number_of_dungeons_entered}"
  puts current_dungeon
  ## MONSTER
  if monster
    puts 'A monster appeared!!'
    actions << 'f - fight'
  end
  ## Adds 'f -fight' action to action for monsters
  print "What do you do (#{actions.join(',')}) : "
  ## Monster Attacks
  ### use gets.chomp 'removes a single trailing new-line character'
  player_action = gets.chomp
  if monster && monster_attack?
    damage -= 10
    puts 'OUCH, you got hit!'
  end

  ## Player Actions
  ## Apply scenarios to player's actions
  if player_action == 'm'
    current_dungeon = create_dungeon
    number_of_dungeons_entered += 1
    monster = has_monster?
    escaped = has_escaped?
  elsif player_action == 's'
    if has_treasure?
      puts "LOOK YOU HAVE FOUND #{treasure}!"
      treasure_count += 1
    else
      puts 'You searched, but the dungeon looks empty'
    end
  elsif player_action == 'f'
    if defeat_monster?
      monster = true
      puts 'ATTACK WAS SUCCESSFUL!'
      puts 'Monster has been slained!'
    else
      puts 'You missed!'
    end
  else
    puts 'Invalid action... Try again!!'
  end
end

# GAME OVER
if damage.positive?
  puts 'Good job! You made it!'
  puts "You have explored #{number_of_dungeons_entered} dungeons"
  puts "and found #{treasure_count} treasures."
else
  puts 'Bad luck! This is the end for you!'
  puts "You explored #{number_of_dungeons_entered} dungeons, before you DIED!"
  puts 'FATALITY!!... but on you!'
end

## Reports game progess and achievements