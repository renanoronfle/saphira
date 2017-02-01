require "saphira/version"
require "saphira/array"

module Saphira
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' =>  'text/html'},
       ["Hello From Saphira Web Framework"]]
    end
  end
end
