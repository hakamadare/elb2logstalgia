require "strscan"

require "elb2logstalgia/entry"
require "elb2logstalgia/types"
require "elb2logstalgia/version"

module Elb2Logstalgia
  def parseLine(line)
    begin
      s = StringScanner.new(line)

      parsed = {}

      # http
      s.scan(/\S+\s+/)

      # timestamp
      parsed[:timestamp] = s.scan(/\S+/)
      s.scan(/\s+/)

      # hostname
      s.scan(/\S+\s+/)

      # source IP
      parsed[:hostname] = s.scan(/\S+:/).chop
      s.scan(/\S+\s+/)

      # dest IP
      s.scan(/\S+\s+/)

      # timing data
      s.scan(/(\S+\s+){3}/)

      # ELB response code
      s.scan(/\S+\s+/)

      # backend response code
      parsed[:response_code] = s.scan(/\S+/)
      s.scan(/\s+/)

      # ELB response size
      s.scan(/\S+\s+/)

      # backend response size
      parsed[:response_size] = s.scan(/\S+/)
      s.scan(/\s+/)

      # method
      s.scan(/\S+\s+/)

      # path
      parsed[:path] = s.scan(/\S+/)

      parsed

    rescue StandardError => e
      raise e
    end
  end
end
