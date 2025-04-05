# weave

## Create a weave application

- Clone repository to your application folder
*Name and chose a location for your app*
```bash
git clone git@github.com:nicolas-tdc/weave.git ./path/to/my-app
```

**Move to my_app application's root directory**

- Remove weave git remote
*This will unlink your directory from weave's repository*
```bash
rm .git
```

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

- Add services
*This will prompt you to select and name a new service for the application*
```bash
./weave.sh add
```
See [weave-core](https://github.com/nicolas-tdc/weave-core) for available services.

- Setup services: see instructions found in README.md files of your added services
[See weave-service default setup and commands](./weave/default-service/README.md)

## Commands
**From application's root directory**

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
*Updates the application and all its services*
```bash
./weave.sh update
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
