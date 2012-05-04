namespace :tuangou do
  desc "GetTuangou"
  task :get_all do
    require 'rails'
    require ::File.expand_path('../../../lib/get_tuangou.rb',  __FILE__)
      Dir[File.join(origin,directory,'rails_admin','**/*')].each do |file|
        relative  = file.gsub(/^#{origin}\//, '')
        dest_file = File.join(destination, relative)
        dest_dir  = File.dirname(dest_file)

        if !File.exist?(dest_dir)
          FileUtils.mkdir_p(dest_dir)
        end

        copier.copy_file(file, dest_file) unless File.directory?(file)
      end

    GetTuangou.new.get_all
    #origin      = File.join('../../../', "public")
    ##origin      = File.join(RailsAdmin::Engine.root, "public")
    #destination = File.join(Rails.root, "public")
    #Rails::Generators::Base.source_root(origin)
    #copier = Rails::Generators::Base.new
    #%w( stylesheets images javascripts ).each do |directory|
    #Dir[File.join(origin,directory,'rails_admin','**/*')].each do |file|
    #relative  = file.gsub(/^#{origin}\//, '')
    #dest_file = File.join(destination, relative)
    #dest_dir  = File.dirname(dest_file)

    #if !File.exist?(dest_dir)
    #FileUtils.mkdir_p(dest_dir)
    #end

    #copier.copy_file(file, dest_file) unless File.directory?(file)
    #end
    #end
  end
end

