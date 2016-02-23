require 'elb2logstalgia'
require 'elb2logstalgia/types'

require 'hashie'

module Elb2Logstalgia
  class Entry < Hashie::Dash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::KeyConversion
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::Dash::Coercion

    property :timestamp, required: true, coerce: Elb2Logstalgia::Types::Timestamp
    property :hostname, required: true, coerce: Elb2Logstalgia::Types::Hostname
    property :path, required: true, coerce: Elb2Logstalgia::Types::Address
    property :response_code, required: true, coerce: Elb2Logstalgia::Types::ResponseCode
    property :response_size, required: true, coerce: Elb2Logstalgia::Types::ResponseSize

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

        keys.map {|k| params_hash[k] = *args.shift}

        super(params_hash)

      rescue StandardError => e
        raise e
      end

    end

  end
end
