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
PROJ.version = File.read('Version.txt').strip
PROJ.exclude = %w(.git pkg/ nbproject/ doc/ ^test[0-9]*.rb$ website/ )

PROJ.rdoc.exclude = %w(Version.txt)
PROJ.rdoc.remote_dir = 'docs/'

PROJ.test.files.delete 'test/test_helper.rb'
PROJ.test.files.unshift 'test/test_helper.rb'
PROJ.rcov.opts << '--exclude rcov.rb'

PROJ.spec.opts << '--color'

# EOF
