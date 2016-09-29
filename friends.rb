# 1. For a given person, return their favourite tv show
  def fav_tv(person)
    return person[:favourites][:tv_show]
  end

# 2. For a given person, check if they like a particular food
# def fav_food?(person, food)
#   fav_foods = person[:favourites][:things_to_eat]
#   for fav in fav_foods 
#     return true if food == fav
#   end
# end
  def fav_food?(person, food)
    return person[:favourites][:things_to_eat].include?(food)
  end

# 3. Allow a new friend to be added to a given person
def new_friend(person, friend)
  person[:friends].push(friend)    
end

# 4. Allow a friend to be removed from a given person
def remove_friend(name, person)
    result = nil
  
  for friend in person[:friends]
    result = friend if friend == name
  end

  if result != nil
    person[:friends].delete(result)
  end

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
def loan(loaner, loanee, amount)
  if (loaner[:monies] >= amount)
    loaner[:monies] -= amount
    loanee[:monies] += amount
  else
    puts "Sorry yer skint!"
  end
end

# 7. Find the set of everyone's favourite food joined together
def get_favourite_foods(people)
  all_the_foods = []
  for person in people
    all_the_foods += person[:favourites][:things_to_eat]
  end
  return all_the_foods
end

# 8. Find people with no friends
def no_friends(people)
  no_friends = []
  for person in people
    if person[:friends].empty?
      no_friends.push(person[:name])
    end
  end

  return no_friends 
end

# INSANE
# Find the people who have the same favourite tv show
  def group_by_tv_show(people)
    tv_groupings = {}

    for person in people
      tv_show = person[:favourites][:tv_show]
      person_name = person[:name]

      if tv_groupings.has_key?(tv_show)
        tv_groupings[tv_show].push(person_name)
      else 
        tv_groupings[tv_show] = [person_name]
    end

  end

  unpopular = []

  for show, people in tv_groupings
    unpopular.push(show) if people.length <= 1
  end

  for show in unpopular
    tv_groupings.delete(show)
  end
  return tv_groupings

end
