<table>
<tr>
    <td>
        <a href="https://www.jenkins.io/" target="_blank"><img src="https://www.jenkins.io/images/logos/jenkins/jenkins.png" height="90"></a>
    </td>
    <td>
        <a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="200"></a>
    </td>
    <td>
        <a href="https://www.docker.com/" target="_blank"><img src="https://www.docker.com/wp-content/uploads/2022/01/Docker-Logo-White-RGB_Horizontal-730x189-1.png.webp" height="40"></a>
    </td>
</tr>
</table>
<p align="center">
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## Requirement
Firstly install docker and docker-compose:
```sh
bash ./docker/scripts/install_docker.sh
git clone your-project-github-url .
```
Copy all files in your project


## Warning
Remove all docker resources and reset permission:
```sh
sudo rm -rf ./docker_data/*

bash docker/scripts/remove_docker_resources.sh

sudo systemctl stop apache2
sudo systemctl stop mysql

sudo chown 1000:1000 ./docker_data/ -R
sudo chown 1000:1000 /var/run/docker.sock

cp .env.main .env
```
- Set .env.example variables like APP_NAME=docker_man


## Install All Containers

Install **Laravel** with composer

```sh
composer create-project laravel/laravel
```

**Remove all** docker resources and reset permission:
```sh
docker-compose --env-file .env up --build -d
```

Show init Password in **Jenkins** Container
```sh
bash docker/scripts/init_jenkins.sh
```

**Initialize** Laravel Container
```sh
bash docker/scripts/init_laravel.sh
```


## Enjoyment

-  *[http://docker_man.loc](http://docker_man.loc)* Laravel in localhost
-  *[http://docker_man.loc:8080](http://docker_man.loc:8080)* Jenkins in localhost of port 8080

## Connect to GitHub from Jenkins
```sh
ssh-keygen -t rsa -f AmirJenkinsKeyLocal
cp AmirJenkinsKeyLocal.pub ~/.ssh
```
- Copy AmirJenkinsKeyLocal.pub content in GitHub>Settings>Deploy Keys

## License
The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
