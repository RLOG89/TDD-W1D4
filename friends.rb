# 1. For a given person, return their favourite tv show
  def fav_tv(person)
    return person[:favourites][:tv_show]
  end

# 2. For a given person, check if they like a particular food
def fav_food?(person, food)
  fav_foods = person[:favourites][:things_to_eat]
  for fav in fav_foods 
    return true if food == fav
  end
end

# 3. Allow a new friend to be added to a given person
def new_friend(person, friend)
  person[:friends].push(friend)    
end

# 4. Allow a friend to be removed from a given person
def remove_friend(person)
  person[:friends].pop
end

# 5. Find the total of everyone's money
def total_money(everyone)
  money = 0
  for person in everyone 
     money += (person[:monies])
  end
  return money 
end


# 6. For two given people, allow the first person to loan a given value of money to the other


# 7. Find the set of everyone's favourite food joined together
# 8. Find people with no friends

# INSANE
# Find the people who have the same favourite tv show

