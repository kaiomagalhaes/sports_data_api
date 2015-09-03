module SportsDataApi
  module Mlb
    class Season
      attr_reader :year, :games

      def initialize(xml)
        season_schedule = xml.xpath("season-schedule")
        @year = season_schedule.attr('year').value
        games = season_schedule.xpath('games')
        @games = []
        games.children.each do |game|
          if game.class == Nokogiri::XML::Element
            @games << Game.new(year: @year, xml: game)
          end
        end
        @games
      end
    end
  end
end
