# Name of the role should match the name of the file
name "vagrant-test-box"

override_attributes(
  "mysql" => {
        "server_root_password" => 'iloverandompasswordsbutthiswilldo',
        "server_repl_password" => 'iloverandompasswordsbutthiswilldo',
        "server_debian_password" => 'iloverandompasswordsbutthiswilldo'
  },
  :rvm => {
    :rubies => ["ruby-2.0.0-p451"],
    :default_ruby => "ruby-2.0.0-p451"
  }

)

# Run list function we mentioned earlier
run_list(
    "recipe[build-essential]",
    "recipe[openssl]",
    "recipe[nginx]",
    "recipe[mysql]",
    "recipe[mysql::server]",
    "recipe[rvm::system]"
)
