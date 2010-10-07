namespace :gem do
  begin
    require 'jeweler'
    gem_name = 'voomify_utility_drawer'
    
    Jeweler::Tasks.new do |gem|
      gem.name = gem_name
      gem.summary = 'Voomify useful classes that most of our projects use'
      gem.files = Dir['{lib}/**/*']
      gem.author = 'Russell Edens'
      gem.email =  'russell@voomify.com'
      gem.description = 'This gem contains a bunch of useful utilities.'
      gem.homepage = 'http://www.github.com/voomify/utility_drawer'
      # other fields that would normally go in your gemspec also be included here
    end
    Jeweler::GemcutterTasks.new
  rescue
    puts 'Jeweler or one of its dependencies is not installed.'
  end

   task :uninstall do
    sh "gem uninstall #{gem_name}"
  end

  task :reinstall =>[:uninstall,:install] 

end

task :spec