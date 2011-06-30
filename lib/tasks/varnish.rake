namespace :varnish do
  namespace :config do
    task :generate do
      File.open(File.join(Rails.root, 'config', 'varnish.development.vcl'), 'w') do |f|
        template_content = IO.read(File.join(Rails.root, 'config', 'varnish.development.vcl.erb'))
        yml_path = File.join(Rails.root, 'config', 'varnish.yml')
        if File.exists?(yml_path)
          config = YAML::load_file(yml_path)
        else
          config = {:wordpress => {}, :rails => {}}
        end
        f.write ERB.new(template_content).result(binding)
      end
    end
  end
  
  desc "Start varnish, recompiling config if necessary"
  task :start => 'varnish:config:generate' do
    `varnishd -f config/varnish.development.vcl -a 0.0.0.0:8080 -s malloc,10M -T 127.0.0.1:6082`
    puts "please visit http://fr2.local:8080/"
  end
  
  desc "Stop varnish"
  task :stop do
    `killall varnishd`
    puts "varnish shutting down..."
  end
  
  task :dump_vcl do
    puts `varnishd -f config/varnish.development.vcl -d -C`
  end

  desc "Restart varnish"
  task :restart => [:stop, :start]
  
  namespace :expire do
    desc "Expire everything from varnish"
    task :everything => :environment do
      include CacheUtils
      purge_cache(".*")
    end
    
    desc "Expire from varnish pages so that late notice can go up"
    task :pages_warning_of_late_content => :environment do
      if Issue.current_issue_is_late?
        include CacheUtils
        purge_cache("/")
        purge_cache("/articles/#{Time.current.to_date.strftime('%Y')}/#{Time.current.to_date.strftime('%m')}")
      end
    end
  end
end
