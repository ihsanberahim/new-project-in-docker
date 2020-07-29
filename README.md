# New Project In Docker

1. Clone this repo in a new folder
2. Edit 'docker-compose.yml'
    - replace `<number>` with your project number. Put `1` if this is your first time
    - replace `<web port>` with the port you want. Put `80` if you never run webserver
3. Run the docker, `docker-compose -f "docker-compose.yml" up -d --build`


## Optional
* Uncomment lines under `For Wordpress` section for Wordpress project in `Dockerfile`
* Uncomment lines under `For Composer` section for project that need composer `Dockerfile`
* Uncomment lines and replace `<your db network>` with your db network. Example, `mysql_app-network`
* Manage local domain with Laragon using NGINX
  * place this snippets properly
  ```
    location / {
	    proxy_set_header      	X-Real-IP $remote_addr;
        proxy_set_header      	X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header 		X-Forwarded-Proto https;
        proxy_set_header      	Host $host;
		proxy_redirect        	off;
        proxy_pass 				http://127.0.0.1:<web port>;
    }
  ```
* Include this snippet in `wp-config.php` for Wordpress HTTPS
  ```
if ((isset($_ENV["HTTPS"]) && ("on" == $_ENV["HTTPS"]))
|| (isset($_SERVER["HTTP_X_FORWARDED_SSL"]) && (strpos($_SERVER["HTTP_X_FORWARDED_SSL"], "1") !== false))
|| (isset($_SERVER["HTTP_X_FORWARDED_SSL"]) && (strpos($_SERVER["HTTP_X_FORWARDED_SSL"], "on") !== false))
|| (isset($_SERVER["HTTP_CF_VISITOR"]) && (strpos($_SERVER["HTTP_CF_VISITOR"], "https") !== false))
|| (isset($_SERVER["HTTP_CLOUDFRONT_FORWARDED_PROTO"]) && (strpos($_SERVER["HTTP_CLOUDFRONT_FORWARDED_PROTO"], "https") !== false))
|| (isset($_SERVER["HTTP_X_FORWARDED_PROTO"]) && (strpos($_SERVER["HTTP_X_FORWARDED_PROTO"], "https") !== false))
|| (isset($_SERVER["HTTP_X_PROTO"]) && (strpos($_SERVER["HTTP_X_PROTO"], "SSL") !== false))
) {
$_SERVER["HTTPS"] = "on";
}
  ```
