# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
          "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
         "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
       },
         "Mason Pumlee" => {
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 12,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
       },
         "Jason Terry" => {
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
      },

    }
 },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
          "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
         "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
       },
          "Ben Gordon" => {
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
      },
          "Brendan Haywood" => {
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 22,
           :blocks => 5,
           :slam_dunks => 12
     }
  }
}
}
end

#players is a key that points to a value of "player"
#I want to iterate down to the #players level and return value that matches name = player
#from there, I want to return key = name, value = :points

def num_points_scored(player_name)
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player_name
        points += stats[:points]
      end
    end
  end
   points
end


def shoe_size(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players][player_name] != nil
      return team_data[:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  arr = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      #iterate over nested hash to match v == team_name.

        #if value ==team_name, push results of nested hash value into output. Currently returning undefined method '[]'
      arr << game_hash[location][:colors]
    end
  end
  arr.flatten
end


def team_names
  arr = []
  game_hash.each do |k, v|
    arr << v[:team_name]
  end
  arr
end

def player_numbers(team_name)
  arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if team_data[:team_name] == team_name
      arr << team_data[:players][name][:number]
      end
    end
  end
  return arr
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_data|
    stats = team_data[:players][player_name]
    end
    return stats
  end
#returns the number of rebounds of the player with the biggest shoe size

def big_shoe_rebounds
  largest = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |k, v|
      if largest < shoe_size(k)
        largest = shoe_size(k)
        player = k
      end
    end
  end
    return player_stats(player)[:rebounds]
end
