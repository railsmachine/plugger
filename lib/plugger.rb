class Plugger
  
  def self.hi
    puts "Hi, I'm plugger. This is just a stub."
  end
  
end

require 'rails/generators'
require 'active_support/dependencies'

puts "I'm loading plugins from #{Rails.root}"

Dir["#{Dir.pwd}/vendor/plugins/*/init.rb"].each do |f|
  require_or_load f
end

Dir["#{Dir.pwd}/vendor/plugins/**/lib/generators/**/*.rb"].each do |f|
  require_or_load f
end
  


require 'plugger/plugger_tasks'