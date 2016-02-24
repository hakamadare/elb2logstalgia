require 'methadone'

module Elb2Logstalgia
  class App
    include Methadone::Main
    include Methadone::CLILogging

    main do
      begin
        while line = gets
          $stderr.puts line.chomp if options[:verbose]

          entry = Elb2Logstalgia::Entry.new(_parseLine(line))

          puts entry.output
        end

      rescue StandardError => e
        raise e
      end
    end

    version Elb2Logstalgia::VERSION
    description 'Translate ELB log format to Logstalgia'

    go!

    private

    def _parseLine(line)
      begin
        parsed = {}

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
end
