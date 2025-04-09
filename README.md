# weave

## Initialize your application

- Clone weave repository to your application's folder

*Name and chose a location for your app*
```bash
git clone git@github.com:nicolas-tdc/weave.git ./path/to/my-app
```

- Move to 'my-app' application's root directory
```bash
cd ./path/to/my-app
```

- Remove weave git remote

*This will unlink your directory from weave's repository*
```bash
rm -rf .git
```

- Initialize your git project
*Create your own application repository and execute initial git setup*
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <you_github_repositoty>
git push -u origin main
```

## Setup your application   
*To do after initializing your application or after cloning your own application repository*

- Update weave
*This will install and update weave*
```bash
./weave-update.sh
```

- Copy environment file
*This environment file will provide common variables to all services containers*
```bash
cp .env.dist .env
```

## Add services to your application

- Add services
*This will prompt you to select and name a new service for the application*
```bash
./weave.sh add
```
See [weave-core](https://github.com/nicolas-tdc/weave-core) for available services.

- Setup services

*See instructions found in README.md files of your added services*

[weave-service default setup and commands](./weave/default-service/README.md)

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
