name "dev"
descriptions "dev environment"
#cookbook_versions({
#  'nginx' => '= 0.1.0'
#})
cookbook_versions({
  'couchdb'=>'= 11.0.0',
  'my_rails_app'=>'~> 1.2.0'
})
#default_attributes 'ngnix' => { 'listen_port' => [ '80' '443' ] } 
