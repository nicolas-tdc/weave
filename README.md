# weave

[Initialize your application](#initialize-your-application)

[Setup your application](#setup-your-application)

[Add services to your application](#add-services-to-your-application)

[Available scripts and commands](#available-scripts-and-commands)

## Initialize your application

- Clone weave repository to your chosen application's folder
```bash
git clone git@github.com:nicolas-tdc/weave.git <path/to/my-app>
```

- Move to your new application's root directory
```bash
cd <path/to/my-app>
```

- Unlink your application from weave's git repository
```bash
rm -rf .git
```

- Link your application to your own application repository
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your_git_repository>
git push -u origin main
```

## Setup your application   
*To do after initializing your application or cloning it from your repository*

- Install and update weave
```bash
./weave-update.sh
```

- Copy environment file

*This environment file will provide your custom common variables to all services containers*
```bash
cp .env.dist .env
```

## Add services to your application

- Add services

*This will prompt you to select and name a new service for your application*
```bash
./weave.sh add
```
See [weave-core](https://github.com/nicolas-tdc/weave-core) for available services.

- Setup services

See instructions found in the readme files of your added services

*Or in weave's default service's readme file*

[default-service-readme](https://github.com/nicolas-tdc/weave-core/blob/main/default-service/README.md)

## Available scripts and commands
**Execute from your application's root directory**

- weave-update.sh

*Updates weave-core and weave available-services*
```bash
./weave-update.sh
```

- r | run

*Starts the application or service*
```bash
./weave.sh r
```
Options:
*Development mode* : -d|-dev
*Single service execution* : --s=<service-name>|--service=<service-name>

- k | kill

*Stops the application or service*
```bash
./weave.sh k
```
Options:
*Development mode* : -d|-dev
*Single service execution* : --s=<service-name>|--service=<service-name>

- upd | update

*Updates the application or service*
```bash
./weave.sh upd
```
Options:
*Development mode* : -d|-dev
*Single service execution* : --s=<service-name>|--service=<service-name>

- add | add-service

*Prompts user to select a service and service name, then adds it to the application*
```bash
./weave.sh add
```

- bak | backup-task

*Backups the application or service*
```bash
./weave.sh bak
```
Options:
*Development mode* : -d|-dev
*Single service execution* : --s=<service-name>|--service=<service-name>

- bak-on | backup-enable

*Enables cron backups for the application and all its services*
```bash
./weave.sh bak-on
```

- bak-off | backup-disable

*Disables cron backups for the application and all its services*
```bash
./weave.sh bak-off
```
