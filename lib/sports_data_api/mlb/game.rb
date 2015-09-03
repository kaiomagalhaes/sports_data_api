module SportsDataApi
  module Mlb
    class Game
      attr_reader :id, :scheduled, :home, :home_team, :away,
                  :away_team, :status, :venue, :broadcast, :year, :season,
                  :date, :quarter, :clock, :rescheduled_reason, :rescheduled_from

      def initialize(args={})
        game = args.fetch(:xml)
        @year = args[:year] ? args[:year].to_i : nil
        @id = game.attr('id')
        @scheduled = Time.parse(game.attr('scheduled'))
        @home = game.attr('home_team')
        @away = game.attr('away_team')
        @home_team = Team.new game.xpath('home')
        @away_team = Team.new game.xpath('away')
        @status = game.attr('status')
        @venue = game.xpath('venue')
        @broadcast = game.xpath('broadcast')
      end
    end
  end
end
