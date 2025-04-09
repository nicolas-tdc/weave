# weave

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
git remote add origin <your_github_repository>
git push -u origin main
```

## Setup your application   
*To do after initializing your application or after cloning your own application repository*

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

[default-service-readme](./weave-core/default-service/README.md)

## List of available commands
**Execute from application's root directory**

- Start application

*Starts the application and all its services*
```bash
./weave.sh start
```

- Start service

*Starts a single service*
```bash
./weave.sh start service_name
```

- Stop application

*Stops the application and all its services*
```bash
./weave.sh stop
```

- Stop service

*Stops a single service*
```bash
./weave.sh stop service_name
```

- Update application

*Updates the application and all its added services*
```bash
./weave.sh update
```

- Update weave

*Updates weave-core and weave available-services*
```bash
./weave-update.sh
```

- Add service

*Prompts user to select a service and service name, then adds it to the application*
```bash
./weave.sh add
```

- Backup application

*Backups the application and all its services*
```bash
./weave.sh bak
```

- Backup service

*Backups a single service*
```bash
./weave.sh bak service_name
```

- Enable cron for backup task

*Enables cron backups for the application and all its services*
```bash
./weave.sh bak-on
```

- Disable cron for backup task

*Disables cron backups for the application and all its services*
```bash
./weave.sh bak-off
```
