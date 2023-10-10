require 'global'
require 'apps'

local resizer = require 'app_resizer'
resizer.blacklist { 'Finder', 'System Settings' }
resizer.start()

hs.alert.show 'Loaded config'
