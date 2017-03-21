require "saphira/version"
require "saphira/array"
require "saphira/routing"
require "saphira/util"
require "saphira/dependencies"

module Saphira
  class Application
    def call(env)

      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
      text = controller.send(act)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
        [text]]
      rescue
      [500, {'Content-Type' => 'text/html'},
        ["Ops!!!"]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
