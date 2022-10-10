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
