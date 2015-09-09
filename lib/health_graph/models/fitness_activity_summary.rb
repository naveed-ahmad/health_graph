module HealthGraph
  class FitnessActivitySummary
    include Model

    hash_attr_accessor :location, :status, :activity

    class Activity
      include Model

      hash_attr_accessor :notes, :duration, :type, :utc_offset, :total_distance, :images, :total_calories, :start_time, :heart_rate, :activity, :average_heart_rate, :equipment

      def initialize(hash)
        populate_from_hash! hash
      end
    end

    def initialize(access_token, params)
      self.access_token = access_token
      response = get params["uri"], HealthGraph.accept_headers[:fitness_activity], params

      self.location = response.headers[:location]
      self.status = response.status
      self.body = response.body

      self.activity = Activity.new(self.body)
    end
  end
end