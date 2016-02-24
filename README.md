# Elb2Logstalgia [![Code Climate](https://codeclimate.com/github/hakamadare/elb2logstalgia/badges/gpa.svg)](https://codeclimate.com/github/hakamadare/elb2logstalgia)

[Logstalgia](http://logstalgia.io/) is a spectacular realtime visualisation tool for web application access logs.  This tool ingests Amazon Web Services Elastic Load Balancing [access logs](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/access-log-collection.html) and emits log entries formatted according to Logstalgia's custom log format.

## Installation

    $ gem install elb2logstalgia

## Usage

    $ cat some_elb_logfile.log | e2l | logstalgia -

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hakamadare/elb2logstalgia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

