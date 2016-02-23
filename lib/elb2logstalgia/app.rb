require 'methadone'

module Elb2Logstalgia
  class App
    include Methadone::Main
    include Methadone::CLILogging

    main do |line|
      puts line if options[:verbose]
    end

  end
end
