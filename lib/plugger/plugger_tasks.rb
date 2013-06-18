class PluggerTasks < Rails::Railtie
  rake_tasks do
    Dir["vendor/plugins/**/*.rake"].each do |f|
      import f
    end
  end
end