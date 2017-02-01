require "saphira/version"

module Saphira
  class Application
    def call(env)
      [200, {'Content-Type' =>  'text/html'},
       ["Hello From Saphira Web Framework"]]
    end
  end
end
