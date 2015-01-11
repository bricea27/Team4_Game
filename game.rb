# Team 4 the Win
# GOTTA CATCH EM ALL

require "colorize"

#Global Variables
pika_hp = 10
bonus_hp = 0
enemy_hp = 10
still_alive = true
enemy_dead = false

#player attack method, uses enemy health as parameter
def pika_attack(enemy_hp)
  #randomization
  random = rand(10) + 1 #includes 10
    if random == 1 || random == 2
      puts "Oh no, Pikachu missed!"
    elsif random == 3 || random == 4 || random == 5
      puts "Pikachu used Tail Whip."
      enemy_hp = enemy_hp - 2
      puts "Enemy's hp is reduced to #{enemy_hp}."
    elsif random == 6 || random || 7 || random == 8
      puts "Pikachu used ThunderShock."
      enemy_hp = enemy_hp - 3
      puts "Enemy's hp is reduced to #{enemy_hp}."
    else
      puts "Pikachu used Slam."
      enemy_hp = enemy_hp - 4
      puts "Enemy's hp is reduced to #{enemy_hp}."
    end
  return enemy_hp
end #end pika_attack

#enemy attack method, uses player health as parameter
def enemy_attack(pika_hp)
  random = rand(10) + 1 #includes 10
  if random == 1 || random == 2 || random == 3 || random == 4
    puts "The enemy's attack missed! Pikachu's hp is #{pika_hp}."
  elsif random == 5 || random == 6
    pika_hp = pika_hp - 1
    puts "The enemy used Growl. Pikachu's hp is reduced to #{pika_hp}."
  elsif random == 7 || random == 8
    pika_hp = pika_hp - 2
    puts "The enemy used Slam. Pikachu's hp is reduced to #{pika_hp}."
  else
    pika_hp = pika_hp - 3
    puts "The enemy used Punch. Pikachu's hp is reduced to #{pika_hp}."
  end
  return pika_hp
end #end enemy_attack

def battle_sequence(enemy_hp, pika_hp, bonus_hp, still_alive)
  enemy_dead = false
  if enemy_hp <= 0
    puts "You Win!"
    pika_hp = 10 #rest pika's health
    bonus_hp = bonus_hp + 1 #increment bonus health
    pika_hp = pika_hp + bonus_hp #add bonus health
    enemy_hp = 10 #restore enemy's health
    puts "Pikachu's hp is now #{pika_hp}!"
    puts "A new wild Pokemon has appeared! Do you wish to fight? (y/n)"
    enemy_dead = true
  end
  if pika_hp <= 0
    puts "You Lose!"
    still_alive = false
  end
  return still_alive, enemy_hp, pika_hp, bonus_hp, enemy_dead
end #end battle_sequence


def run_game()
  pika_attack()
end #run_game



puts "Hello there, please enter a name:".colorize(:yellow)
player_name = gets.chomp

puts "Professor Oak: 'Hello #{player_name}. Welcome to the world of Pokemon!'".colorize(:yellow)

while still_alive == true do

  puts "A wild Pokemon has appeared! Do you wish to fight? (y/n)".colorize(:red)
  answer = gets.chomp.upcase

  if answer == "Y"

    #sets enemy's health equal to pikachu's attack
    enemy_hp = pika_attack(enemy_hp)

    still_alive, enemy_hp, pika_hp, enemy_dead, bonus_hp = battle_sequence(enemy_hp, pika_hp, bonus_hp, still_alive)

    if enemy_dead == false
      pika_hp = enemy_attack(pika_hp)
      still_alive, enemy_hp, pika_hp, enemy_dead, bonus_hp =  battle_sequence(enemt_hp, pika_hp, bonus_hp, still_alive)
    end

  else
    puts "You lack the heart to be a true Pokemon Master".colorize(:yellow)
    pika_hp = pika_hp - 2
    puts "Pikachu's hp is now #{pika_hp}."
    if pika_hp <= 0
      puts "You Lose"
      exit
    end
  end

end #end while still_alive














# #restore player health when enemy dies
# if enemy_health == 0
#   player_health = 10
# end
#
# #end game when player dies
# if player_health == 0
#   is_alive = false
#   exit
# end



# #play game as long as player is alive
# while still_alive == true
#   puts "Uh oh, a wild Pokemon has appeared! Do you wish to fight? (y/n)"
#   answer = gets.chomp.upcase
#
#   if answer = "Y"
#     pika_attack(enemy_hp)
#   else
#     pika_hp = pika_hp - 2
#   end
#
#
# end
