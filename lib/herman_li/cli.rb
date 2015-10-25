require "thor"
require "clockwork"
require "yaml"

module HermanLi
  class CLI < Thor

    desc "execute task", "execute task"
    options :file => :required, :aliases => :f
    def express
      f = options[:file]
      fail unless File.exist?(f)
      $config = YAML::load_file(f)
      require_relative "./clock"
      Clockwork::run
    end
    default_task :express

  end
end
