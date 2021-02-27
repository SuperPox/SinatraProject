require './config/environment'

use Rack::MethodOverride
use UsersController
use PollsController
use ResponsesController
run ApplicationController