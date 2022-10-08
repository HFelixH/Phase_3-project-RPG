#RPG - TEXT BASED

#1) Check if player is alive - health 100/100
#2) Player moves between rooms
#3) check to see if a monster is in the room
#4) allow actions - search or attack
#5) RNG - monsters
## RNG monsters attack
#7) include treasure when players serach - Treasure will be RNG
#8) GAME OVER when health goes to 0/100

# VARIBLES
number_of_rooms_entered = 1
treasure_count = 0
damage = 5
escaped = false
monster = false
current_room = ""

# INTRO

puts "You are trapped in a dungeon. Survive and escape!"
puts "Keep your eye out for treasure!"
puts "Watch out for monsters!!"

# GAME LOOP
while damage_points > 0 and not escaped do
# GAME CODE
end    


if damage_points > 0
    puts "Good job! You made it!"
    puts "You have explored #{number_of_rooms_entered} rooms"
    puts "and found #{treasure_count} treasures."
else 
    puts "Bad luck! This is the end for you!"
    puts "You explored #{number_of_rooms_entered} rooms, before you died!"
end