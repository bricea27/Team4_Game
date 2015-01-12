# Team 4 the Win
# GOTTA CATCH EM ALL

require "colorize"

#Global Variables

pika_hp = 10
bonus_hp = 0
enemy_hp = 10
still_alive = true
enemy_dead = false

#Methods

#player attack method, uses enemy health as parameter
def pika_attack(enemy_hp)
  #randomization
  random = rand(10) + 1 #includes 10
    if random == 1 || random == 2
      puts "Oh no, Pikachu missed!".colorize(:yellow)
    elsif random == 3 || random == 4 || random == 5
      enemy_hp = enemy_hp - 2
      puts "Pikachu used Tail Whip. Enemy's hp is reduced to #{enemy_hp}.".colorize(:yellow)
    elsif random == 6 || random || 7 || random == 8
      enemy_hp = enemy_hp - 3
      puts "Pikachu used ThunderShock. Enemy's hp is reduced to #{enemy_hp}.".colorize(:yellow)
    else
      enemy_hp = enemy_hp - 4
      puts "Pikachu used Slam. Enemy's hp is reduced to #{enemy_hp}.".colorize(:yellow)
    end
  return enemy_hp
end #end pika_attack

#enemy attack method, uses player health as parameter
def enemy_attack(pika_hp)
  random = rand(10) + 1 #includes 10
  if random == 1 || random == 2 || random == 3 || random == 4
    puts "The enemy's attack missed! Pikachu's hp is #{pika_hp}.".colorize(:red)
  elsif random == 5 || random == 6
    pika_hp = pika_hp - 1
    puts "The enemy used Growl. Pikachu's hp is reduced to #{pika_hp}.".colorize(:red)
  elsif random == 7 || random == 8
    pika_hp = pika_hp - 2
    puts "The enemy used Quick Attack. Pikachu's hp is reduced to #{pika_hp}.".colorize(:red)
  else
    pika_hp = pika_hp - 3
    puts "The enemy used Scratch. Pikachu's hp is reduced to #{pika_hp}.".colorize(:red)
  end
  return pika_hp
end #end enemy_attack

def battle_sequence(enemy_hp, pika_hp, bonus_hp, still_alive, enemy_dead)
  enemy_dead = false
    if enemy_hp <= 0
      puts "You Win!"
      pika_hp = 10 #restore pika's health
      enemy_hp = 10 #restore enemy's health
      puts "Pikachu's hp is now #{pika_hp}!"
      puts "A new wild Pokemon has appeared! Do you wish to fight? (y/n)"
      enemy_dead = true
    elsif pika_hp <= 0
      puts "You Lose!".colorize(:red)
      still_alive = false
    end
  return still_alive, enemy_hp, pika_hp, bonus_hp, enemy_dead
end #end battle_sequence


###########################
#Game Sequence

puts "Hello there, please enter a name:".colorize(:blue)
player_name = gets.chomp

puts "Professor Oak: 'Hello #{player_name}. Welcome to the world of Pokemon!'".colorize(:blue)

puts "A wild pokemon has appeared! Do you wish to fight? (y/n)".colorize(:blue)

while still_alive == true do

  puts "Pickahu's hp is #{pika_hp}. Do you wish to fight? (y/n)"
  answer = gets.chomp.upcase

  if answer == "Y"

    #sets enemy's health equal to pikachu's attack
    enemy_hp = pika_attack(enemy_hp)

    #here we're resetting thise variables equal to the outcome of the battle sequence method
    still_alive, enemy_hp, pika_hp, enemy_dead, bonus_hp = battle_sequence(enemy_hp, pika_hp, bonus_hp, still_alive, enemy_dead)

    if enemy_dead == false

      pika_hp = enemy_attack(pika_hp)
    end

  else
    puts "Pikachu fled the battle!".colorize(:blue)
    pika_hp = pika_hp - 2
    enemy_hp = 10
    if pika_hp <= 0
      puts "You Lose"
      exit
    end
  end

end #end while still_alive
