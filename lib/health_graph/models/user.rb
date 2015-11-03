module HealthGraph
  class User
    include Model
          
    hash_attr_accessor :userID
     
    def initialize(access_token)            
      self.access_token = access_token
      response = get "user", HealthGraph.accept_headers[:user]
      self.body = response.body
      populate_from_hash! self.body      
    end
        
    def profile      
      HealthGraph::Profile.new self.access_token, self.body["profile"]      
    end        
    
    def settings
      HealthGraph::Settings.new self.access_token, self.body["settings"]
    end

    def nutrition(params={})
      HealthGraph::NutritionFeed.new self.access_token, self.body["nutrition"], params
    end

    def background_activities(params={})
      HealthGraph::BackgroundActivitiesFeed.new self.access_token, self.body["background_activities"], params
    end
    
    def weight
      HealthGraph::WeightFeed.new self.access_token, self.body["weight"]
    end

    def general_measurements
      HealthGraph::GeneralMeasurementFeed.new self.access_token, self.body["general_measurements"]
    end
    
    def sleep
      HealthGraph::SleepFeed.new self.access_token, self.body["sleep"]
    end
    
    def fitness_activities params = {}
      HealthGraph::FitnessActivitiesFeed.new self.access_token, self.body["fitness_activities"], params
    end
    
    def new_fitness_activity params
      HealthGraph::NewFitnessActivity.new self.access_token, params
    end
    
    def fitness_activity_update params
      HealthGraph::FitnessActivityUpdate.new self.access_token, params
    end

    def fitness_activity_delete params
      HealthGraph::FitnessActivityDelete.new self.access_token, params
    end
    
    def strength_training_activities params = {}
      HealthGraph::StrengthTrainingActivitiesFeed.new self.access_token, self.body["strength_training_activities"], params
    end

    def fitness_activity_summary params = {}
      HealthGraph::FitnessActivitySummary.new self.access_token, params
    end

  end
end