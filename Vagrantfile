# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "11.8.2"
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :forwarded_port, guest: 80, host: 8888

   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "/Users/joseluistorres/sandbox/cookbooks"
     chef.roles_path = "/Users/joseluistorres/sandbox/roles"
     chef.add_role "vagrant-test-box"

  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  ##   chef.add_recipe "openssl"
     #chef.add_recipe "mysql::server"
     #chef.add_recipe "nginx"
     chef.json = {
       "nginx" => {
         # Chef-solo current doesn't support environments so take hostname and
         # worker_processes from environments/staging.rb and put them here
         # "hostname" => "staging.motorlot.com",
         # If vm.share_folder is enabled and are testing your local code against
         # the vm "localhost" should be used.
         "hostname" => "localhost",
         "worker_processes" => 4,
         "passenger" => {
           # nginx source install will fail unless these two attributes are overwritten.
           # If source install does fail, ssh in vagrant vm and do a 'gem list passenger'
           # to get the installed version of passenger gem and put it here, then re-provision
           "version" => "4.0.29",
           "root" => "/opt/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/passenger-4.0.29",
           "ruby" => "/opt/rbenv/versions/2.0.0-p353/bin/ruby"

         }
       }
     }
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
   end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
