puts "Hey, beastmaster. What do they call you?"
name = gets.chomp
health = 10
bonus_health = 0
monster_hp = 10
puts "Hey, #{name}. Welcome, you have #{health} health"
puts "A Wild baddie appears!"
stillplaying = true
did_it_die = false

#handle probability of attack and probablity of damage (2-4)
#set number to attack names (3 - growl - does 2 damage)

def heroattack(monster_hp)
  rnd = rand(10)+1
  case rnd
  when 1,2
    puts "You attack missed..."
    puts "-Moster's health is still #{monster_hp} "
  when 2,3,4,5,6,7,8,9,10
    damage_to_monster = rand(4)+1
    puts "Your attack connects for #{damage_to_monster} damage"
    monster_hp = (monster_hp - damage_to_monster)
    puts "-Moster's health is reduced to #{monster_hp} "
  end
  return monster_hp
end

def baddieattack(health)
  rnd = rand(10)+1
  case rnd
  when 1,2,3,4
    puts "Baddie's attack missed..."
    puts "-Your health is still #{health} "           
  when 5,6,7,8,9,10
    damage_to_hero = rand(3)+1
    puts "Baddie's attack connects for #{damage_to_hero} damage"
    health = (health - damage_to_hero)
    puts "-Your health is reduced to #{health} "
  end
  return health
end

def checkforwinner(monster_hp, health, bonus_health, stillplaying)
  did_it_die = false
  if monster_hp <= 0
    "You win"
    health = 10
    bonus_health += 1
    health = health + bonus_health
    monster_hp = 10
    puts "Your new health total is: #{health}"
    puts "A NEW Wild baddie appears with #{monster_hp} hp. Fight or Run?"
    did_it_die = true
  end
  if health <= 0
    puts "You lose"
    stillplaying = false
  end
  return stillplaying, monster_hp, health, did_it_die, bonus_health
end

#while loop is the actual game
#call the methods set up before within the while loop
while stillplaying == true do
  puts "-------------------------------------------"
  puts "Fight or Run"
  answer = gets.chomp.upcase

  #Same as a conditional (if answer == "RUN"...)
  case answer
  when "RUN", "R"
    puts "You ran"
    health -= 2
    puts "-Your heath has been reduced to #{health}"

  when "FIGHT", "F"
    puts "entering battle round..."

    monster_hp = heroattack(monster_hp)

    stillplaying, monster_hp, health, did_it_die, bonus_health = checkforwinner(monster_hp, health, bonus_health, stillplaying)
    if did_it_die == false then
      health = baddieattack(health)
      stillplaying, monster_hp, health, did_it_die, bonus_health =  checkforwinner(monster_hp, health, bonus_health, stillplaying)
    end

  end
end
