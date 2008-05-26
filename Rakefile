# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'acts_as_queue'

task :default => 'spec:run'

PROJ.name = 'acts_as_queue'
PROJ.authors = 'LeonB'
PROJ.email = 'leon@tim-online.nl'
PROJ.url = 'acts_as_queue.rubyforge.org'
PROJ.rubyforge.name = 'acts_as_queue'

PROJ.spec.opts << '--color'

# EOF
