require 'ipaddr'

module Elb2Logstalgia
  module Types
    class Hostname
      attr_reader :parsed

      def initialize(*args, &block)
        begin
          @parsed = IPAddr.new(*args)

        rescue InvalidAddressError => e
          @parsed = *args

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
