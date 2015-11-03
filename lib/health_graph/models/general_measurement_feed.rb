module HealthGraph
  class GeneralMeasurementFeed
    include Model              
    
    hash_attr_accessor :items, :next
    
    class Item 
      include Model      
      
      hash_attr_accessor :timestamp, :systolic, :diastolic
      
      def initialize(hash) 
        populate_from_hash! hash
      end      
    end
                      
    def initialize(access_token, path)            
      self.access_token = access_token
      response = get path, HealthGraph.accept_headers[:general_measurement_feed]
      self.body = response.body
      populate_from_hash! self.body                  
    end                           
  end
end
