upstream backend {
	server 127.0.0.1:9000;
}

server {
  listen   80;
  server_name  myshala.com www.myshala.com ;
  large_client_header_buffers  4 2048K;

  access_log  /home/myshala/public_html/log/myshala.com.access.log;
  error_log   /home/myshala/public_html/log/myshala.com.error.log;
    client_max_body_size 20M;
    root   /home/myshala/public_html;
    index  index.html index.htm index.php;

#for clean urls / permalink
if (!-e $request_filename) {
            rewrite ^.+?(/.*.php)$ $1 last;
            rewrite ^ /index.php last;
        }


 location ~* \.(?:css|gif|htc|ico|js|jpe?g|png|swf)$ {
            expires max;
            log_not_found off;
            ## No need to bleed constant updates. Send the all shebang in one
            ## fell swoop.
            tcp_nodelay off;
	    client_max_body_size 20M;
            ## Set the OS file cache.
            open_file_cache max=1000 inactive=120s;
            open_file_cache_valid 45s;
            open_file_cache_min_uses 2;
            open_file_cache_errors off;
        }

location ~ \.php$ {
    try_files $uri =404;
    client_max_body_size 20M;
    root /home/myshala/public_html; 
    fastcgi_param  SCRIPT_FILENAME  /home/myshala/public_html$fastcgi_script_name;
    fastcgi_index index.php;
    fastcgi_pass 127.0.0.1:9000;
    include fastcgi_params;
  }

}

