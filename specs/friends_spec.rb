require( 'minitest/autorun' )
require( 'minitest/rg')
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,  
      friends: ["Jay","Keith","Marc", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Marc"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Marc",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_name
    assert_equal("Marc",@person5[:name])
  end

  def test_fav_tv
    assert_equal("Scrubs", fav_tv(@person5))
  end

  def test_fav_food?
    assert_equal(true, fav_food?(@person4,"spaghetti"))    
    assert_equal(false, fav_food?(@person4,"fish")) 
  end

  def test_new_friend
    new_friend(@person3, @person5)
    assert_equal(3, @person3[:friends].count)
  end

  def test_remove_friend
    remove_friend("Rick", @person3 )
    assert_equal(1, @person3[:friends].size)
  end

  def test_total_money
    assert_equal(143, total_money(@people))
  end

  def test_loan
    loan(@person5, @person1, 50)
    assert_equal(true, @person1[:monies] == 51 && @person5[:monies] == 50)
  end

  def test_get_favourite_foods
    expected = ["charcuterie", "soup", "bread", "ratatouille", "stew", "spaghetti", "spinach"]
    actual = get_favourite_foods(@people)
    assert_equal(expected, actual)
  end

  def test_no_friends
    assert_equal(['Marc'], no_friends(@people))
  end

  def test_group_by_tv_show
    expected = { "Scrubs" => [ "Jay", "Marc" ], "Pokemon" => [ "Val", "Keith" ]}
    actual = group_by_tv_show(@people)
    assert_equal(expected, actual)
  end

end


























