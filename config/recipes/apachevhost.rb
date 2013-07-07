namespace :apachevhost do 
	desc "Setup an apache vhost"
	task :setup, roles: :web do 
		template "apache_vhost.erb", "/tmp/apache_vhost"
		run "#{sudo} mv /tmp/apache_vhost /etc/apache2/sites-available/#{application}"
		run "#{sudo} a2ensite #{application}"
		run "#{sudo} service apache2 reload"
	end
end