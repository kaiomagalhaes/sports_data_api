module SportsDataApi
  module Mlb
    class Team
      attr_reader :id, :name, :market, :alias, :league, :division

      def initialize(xml)
        @id = xml.attr('id').value
        @name = xml.attr('name').value
        @market = xml.attr('market').value
        @alias = xml.attr('abbr').value
      end

      ##
      # Compare the Team with another team
      def ==(other)
        # Must have an id to compare
        return false if self.id.nil?

        if other.is_a? SportsDataApi::Mlb::Team
          return false if other.id.nil?
          self.id === other.id
        elsif other.is_a? Symbol
          self.id.to_sym === other
        else
          super(other)
        end
      end
    end
  end
end
