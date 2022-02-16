<table>
<tr>
    <td>
        <a href="https://www.jenkins.io/" target="_blank"><img src="https://www.jenkins.io/images/logos/jenkins/jenkins.png" height="90"></a>
    </td>
    <td>
        <a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="200"></a>
    </td>
    <td>
        <a href="https://www.docker.com/" target="_blank"><img src="https://www.docker.com/sites/default/files/d8/2019-07/horizontal-logo-monochromatic-white.png" height="40"></a>
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
```

## Warning
Remove all docker resources and reset permission:
```sh
    bash docker/scripts/remove_docker_resources.sh
    sudo chown 1000:1000 ./docker_data/ -R
```

## Install All Containers

Install **Laravel** with composer

-   Set .env.example variables like APP_NAME=docker_man

```sh
    composer create-project laravel/laravel src
    cp .env.example ./src/.env
```

**Remove all** docker resources and reset permission:
```sh
    docker-compose --env-file ./src/.env up --build -d
```

**Initialize** Laravel Container
```sh
    docker exec -it docker_man-php bash -c "bash docker/scripts/init_laravel.sh"
```

Show init Password in **Jenkins** Container
```sh
    docker exec -it jenkins bash -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
