# New Project In Docker

1. Clone this repo in a new folder
2. Edit 'docker-compose.yml'
    - replace `<number>` with your project number. Put `1` if this is your first time
    - replace `<web port>` with the port you want. Put `80` if you never run webserver
3. Run the docker, `docker-compose up -d`


## Optional
* Uncomment lines under `For Wordpress` section for Wordpress project in `Dockerfile`
* Uncomment lines under `For Composer` section for project that need composer `Dockerfile`
* Uncomment lines and replace `<your db network>` with your db network. Example, `mysql_app-network`