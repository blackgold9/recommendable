module Recommendable
  class RecommendationRefresher
   # include Resque::Plugins::UniqueJob
   # @queue = :recommendable
    def update_recs(user_id)
      puts "Refreshing reccomendations for user"
      user = Recommendable.user_class.find(user_id)
      user.send :update_similarities
      user.send :update_recommendations
    end
    def self.perform(user_id)
      puts "Refreshing reccomendations for user"
      user = Recommendable.user_class.find(user_id)
      user.send :update_similarities
      user.send :update_recommendations
    end
  end
end
