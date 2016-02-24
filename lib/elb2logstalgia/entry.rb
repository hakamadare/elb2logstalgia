require 'elb2logstalgia'
require 'elb2logstalgia/types'

require 'hashie'
require 'strscan'

module Elb2Logstalgia
  class Entry < Hashie::Dash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::KeyConversion
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::Dash::Coercion

    property :timestamp, coerce: Elb2Logstalgia::Types::Timestamp
    property :hostname, coerce: Elb2Logstalgia::Types::Hostname
    property :path, coerce: Elb2Logstalgia::Types::Path
    property :response_code, coerce: Elb2Logstalgia::Types::ResponseCode
    property :response_size, coerce: Elb2Logstalgia::Types::ResponseSize

    property :success, coerce: Elb2Logstalgia::Types::Success
    property :response_color, coerce: Elb2Logstalgia::Types::ResponseColor
    property :referrer_url, coerce: Elb2Logstalgia::Types::ReferrerUrl
    property :user_agent, coerce: Elb2Logstalgia::Types::UserAgent
    property :virtual_host, coerce: Elb2Logstalgia::Types::VirtualHost
    property :pid, coerce: Elb2Logstalgia::Types::Pid

    def initialize(*args, &block)
      begin
        keys = [
          :timestamp,
          :hostname,
          :path,
          :response_code,
          :response_size,
          :success,
          :response_color,
          :referrer_url,
          :user_agent,
          :virtual_host,
          :pid,
        ]

        params_hash = {}

        input = *args[0]

        input.each do |pair|
          k = pair[0]
          v = pair[1]
          params_hash[k] = v
        end

        # now we can derive some additional values
        derived_params = _deriveParams(params_hash)

        super(derived_params)

      rescue StandardError => e
        raise e
      end
    end

    def output
      fields = [
        :timestamp,
        :hostname,
        :path,
        :response_code,
        :response_size,
        :success,
      ]

      fields.map {|x| self.fetch(x).to_s}.join('|')
    end

    private

    def _deriveParams(params)
      input = Hashie::Mash.new(params)
      derived = Hashie::Mash.new

      # calculate success from response code
      derived.success = input.response_code.to_i < 400 ? 1 : 0

      derived.merge(input)
    end

  end
end
