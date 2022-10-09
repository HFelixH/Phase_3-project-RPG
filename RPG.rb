# RPG - TEXT BASED

# 1) Check if player is alive - health 100/100
# 2) Player moves between rooms
# 3) check to see if a monster is in the room
# 4) allow actions - search or attack
# 5) RNG - monsters
## RNG monsters attack
# 7) include treasure when players serach - Treasure will be RNG
# 8) GAME OVER when health goes to 0/100

# VARIBLES
number_of_rooms_entered = 1
treasure_count = 0
damage = 5
escaped = false
monster = false
current_room = ''

## Create Room
def create_room
  'You have entered a dark room. What will you do...?'
end

## Create Room
def treasure
  ["Gold", "Silver", "Diamond", "Pearl", "Ruby", "Sapphire"].sample
end

# DICE RNG

## Create dice to roll for RNG
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
    total = total + rand(size_of_dice) + 1
  end
  total
end

# RNG EVENTS

## Chance RNG to encounter monster
def has_monster?
  roll_dice(2, 6) >= 8
end

## Chance RNG to attack monster
def monster_attack?
  roll_dice(2, 6) >= 8
end

## Chance RNG to defeat monster
def defeat_monster?
  roll_dice(2, 6) >= 2
end

## Chance RNG to find treasure
def has_treasure?
  roll_dice(2, 6) >= 6
end

## Chance RNG to escape
def has_escaped?
  roll_dice(2, 6) >= 11
end
# INTRO
puts 'You are trapped in a dungeon. Survive and escape!'
puts 'Keep your eye out for treasure!'
puts 'Watch out for monsters!!'
# GAME LOOP
while damage > 0 and !escaped
  # GAME CODE
  actions = ['m - move', 's - search']
  ## available actions for players to choose
  puts "Room # #{number_of_rooms_entered}"
  puts current_room
  ## MONSTER
  if monster
    puts 'A monster appeared!!'
    actions << 'f - fight'
  end
  ## Adds 'f -fight' action to action for monsters
  print "What do you do (#{actions.join(',')}) : "
  ## Monster Attacks
  player_action = gets.chomp
  if monster and monster_attack?
    damage -= 10
    puts 'OUCH, you got hit!'
  end
  ## Player Actions
  ## Apply scenarios to player's actions
  if player_action == 'm'
    current_room = create_room
    number_of_rooms_entered += 1
    monster = has_monster?
    escaped = has_escaped?
  elsif player_action == 's'
    if has_treasure?
      puts "LOOK YOU HAVE FOUND #{treasure}!"
      treasure_count += 1
    else
      puts 'You searched, but the room looks empty'
    end
  elsif player_action == 'f'
    if defeat_monster?
      monster = false
      puts 'Monster has been slained!'
    else
      puts 'You missed!'
    end
  else
    puts 'Invalid action... Try again!!'
  end
end
# GAME OVER
if damage > 0
  puts 'Good job! You made it!'
  puts "You have explored #{number_of_rooms_entered} rooms"
  puts "and found #{treasure_count} treasures."
else
  puts 'Bad luck! This is the end for you!'
  puts "You explored #{number_of_rooms_entered} rooms, before you DIED!"
  puts 'FATALITY!!... but on you!'
end

## Reports game progess and achievements