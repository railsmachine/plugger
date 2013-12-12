class Plugger
  
  def self.hi
    puts "Hi, I'm plugger. This is just a stub."
  end
    
end

module Rails
  module Generators
    
    module Actions
      
      def plugin(name, options)
        log :plugin, name

        if options[:git] && options[:submodule]
          options[:git] = "-b #{options[:branch]} #{options[:git]}" if options[:branch]
          in_root do
            run "git submodule add #{options[:git]} vendor/plugins/#{name}", :verbose => false
          end
        elsif options[:git] || options[:svn]
          options[:git] = "-b #{options[:branch]} #{options[:git]}"   if options[:branch]
          options[:svn] = "-r #{options[:revision]} #{options[:svn]}" if options[:revision]
          in_root do
            `bundle exec plugger install #{options[:svn] || options[:git]} --force`
          end
        else
          log "! no git or svn provided for #{name}. Skipping..."
        end
      end
      
    end
    
  end
end

require 'rails/generators'
require 'active_support/dependencies'

Dir["#{Dir.pwd}/vendor/plugins/*/init.rb"].each do |f|
  require_or_load f
end

Dir["#{Dir.pwd}/vendor/plugins/**/lib/generators/**/*.rb"].each do |f|
  require_or_load f
end
  


require 'plugger/plugger_tasks'