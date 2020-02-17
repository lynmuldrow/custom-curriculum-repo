# Write your code here!
require 'pry'

def game_hash 
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1  
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7  
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15  
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5   
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1   
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2   
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10   
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5   
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0   
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12   
        }
      }
    }
  }
end

def num_points_scored(player_name) 
  player_points = []
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry
        if attribute == :players 
          #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
          data.each do |data_item|
              # binding.pry
              # puts data_item
              if data_item[0] == player_name
                player_points << data_item[1][:points]
              end
          end
        end
    end
  end
  player_points[0]
end

# num_points_scored("Alan Anderson")

def shoe_size(player_name) 
  player_shoe_size = []
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry
        if attribute == :players 
          #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
          data.each do |data_item|
              # binding.pry
              # puts data_item
              if data_item[0] == player_name
                player_shoe_size << data_item[1][:shoe]
              end
          end
        end
    end
  end
  player_shoe_size[0]
end

def team_colors(team_name)
  team_colors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        team_colors << game_hash[location][:colors]
        # binding.pry
      end
    end
  end
  team_colors.flatten
end
# team_colors('Brooklyn Nets')


def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names << data
        # binding.pry
      end
    end
  end
  team_names.flatten
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        game_hash[location][:players].each do |player, player_data|
        # binding.pry
          player_numbers << player_data[:number]
        end
      end
    end
  end
  player_numbers.flatten
end
# player_numbers('Brooklyn Nets')

def player_stats(player_name)
  player_stats = []
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry
        if attribute == :players 
          #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
          data.each do |data_item|
              # binding.pry
              # puts data_item
              if data_item[0] == player_name
                player_stats << data_item[1]
              end
          end
        end
    end
  end
  player_stats[0]
end
# player_stats('Jeff Adrien')

def big_shoe_rebounds
  player_shoe_sizes = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players 
          data.each do |data_item|
              # binding.pry
                player_shoe_sizes << data_item[1][:shoe]
          end
        end
    end
  end
  largest_shoe_size = player_shoe_sizes.max
  # binding.pry
  rebounds = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |data_item|
            # binding.pry
              # player_shoe_sizes << data_item[1][:shoe]
              # binding.pry
            if data_item[1][:shoe] == largest_shoe_size
              rebounds << data_item[1][:rebounds]
            end
        end
      end
  end
end
rebounds[0]
end