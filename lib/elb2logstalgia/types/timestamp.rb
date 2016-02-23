require 'timeliness'

module Elb2Logstalgia
  module Types
    class Timestamp
      attr_reader :parsed

      ELB_TIMESTAMP_FORMAT = 'yyyy-mm-ddThh:nn:ss.uZ'

      def initialize(*args, &block)
        begin
          @parsed = Timeliness.parse(*args, :format => ELB_TIMESTAMP_FORMAT)
        rescue StandardError => e
          raise e
        end
      end

      def to_epoch
        begin
          self.parsed.to_time.to_i

        rescue StandardError => e
          raise e
        end
      end

      alias_method :to_s, :to_epoch

    end
  end
end
