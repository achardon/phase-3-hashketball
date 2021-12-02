require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def find_index(player)
  game_hash.each do |team, data|
    data.each do |x, player_info|
        if x == :players
          player_info.each.with_index do |y, index|
            if y[:player_name] == player
              return index 
            end
          end
        end
    end
  end
end

def num_points_scored(player)
  if game_hash[:home][:players].detect {|n| n[:player_name] == player}
    index = game_hash[:home][:players].index {|x| x[:player_name] == player}
    game_hash[:home][:players][index][:points]
  else
    index = game_hash[:away][:players].index {|x| x[:player_name] == player}
    game_hash[:away][:players][index][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].detect {|n| n[:player_name] == player}
    index = game_hash[:home][:players].index {|x| x[:player_name] == player}
    game_hash[:home][:players][index][:shoe]
  else
    index = game_hash[:away][:players].index {|x| x[:player_name] == player}
    game_hash[:away][:players][index][:shoe]
  end
end

def team_colors(selected_team)
  game_hash.each do |team, data|
    data.each do |key, value|
      if value == selected_team
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  team_names_array = []
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :team_name
        team_names_array << value
      end
    end
  end
  return team_names_array
end

def player_numbers(selected_team)
  player_numbers_array = []
  game_hash.each do |team, data|
    data.each do |key, value|
      if value == selected_team
        game_hash[team][:players].each do |player|
          player_numbers_array << player[:number]
        end
      end
    end
  end
  return player_numbers_array
end

def player_stats(selected_player)
  index = find_index(selected_player)
  game_hash.each do |team, data|
    if game_hash[team][:players][index][:player_name] == selected_player
      return game_hash[team][:players][index]
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  player_big_shoe = ''
  number_of_rebounds = 0
  game_hash.each do |team, data|
    game_hash[team][:players].each do |player|
      if player[:shoe] > biggest_shoe_size
        biggest_shoe_size = player[:shoe]
        player_big_shoe = player[:player_name]
        number_of_rebounds = player[:rebounds]
        number_of_rebounds
      end
    end
  end
  return number_of_rebounds
end


num_points_scored('Alan Anderson')
find_index('Ben Gordon')
team_colors('Brooklyn Nets')
player_numbers('Brooklyn Nets')
player_stats('Brook Lopez')
big_shoe_rebounds