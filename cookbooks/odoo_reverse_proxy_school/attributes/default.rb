default[:odoo][:ip] = "192.168.10.99"

default[:odoo_reverse_proxy_school][:epel]  = "epel-release"
default[:odoo_reverse_proxy_school][:nginx]       = "nginx"

default[:odoo_reverse_proxy_school][:'php-fpm']       = "php-fpm"

default[:odoo][:domain] = "crm.myshala.lan"

default[:odoo][:port] = "8069"


#default[:odoo_reverse_proxy_school][:pkg3] = "ftp"
