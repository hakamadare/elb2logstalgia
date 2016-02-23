module Elb2Logstalgia
  module Types
    class Path
      attr_reader :parsed

      def initialize(*args, &block)
        begin
          @parsed = String.new(*args)

        rescue StandardError => e
          raise e
        end
      end

      def to_s
        self.parsed.to_s
      end
    end
  end
end
