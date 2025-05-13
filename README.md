# weave

[Initialize your application](#initialize-your-application)

[Setup your application](#setup-your-application)

[Add services to your application](#add-services-to-your-application)

[Available scripts and commands](#available-scripts-and-commands)

[Available services](#available-services)

## Initialize your application

- **Clone weave repository to your chosen application's folder**
```bash
git clone git@github.com:nicolas-tdc/weave.git <path/to/my-app>
```

- **Move to your new application's root directory**
```bash
cd <path/to/my-app>
```

- **Unlink your application from weave's git repository**
```bash
rm -rf .git
```

- **Link your application to your own application repository**
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

Modify environment files if needed.

- **Install and/or update weave**
```bash
./update-weave.sh
```

## Add services to your application

- **Add services**

*This will prompt you to select and name a new service for your application*
```bash
./weave.sh add-service
```
See [Available services](#available-services).
You can add your own git repositories in the weave.conf file "available-services" section.

- **Setup services**

See instructions found in the readme files of each of your added services

To connect your services to each other, add networks to their docker-compose files.
The networks will be automatically added or removed by weave.

## Run and kill your application

```bash
./weave.sh run
./weave.sh kill
```

## Available scripts and commands
**Execute from your application's root directory**

- **update-weave.sh**

Updates weave-core and weave available-services
```bash
./update-weave.sh
```

- **run**

Starts the application or service.
When starting the application, services are executed in the order defined in the weave.conf file.
You can also add a sleep line between services:
sleep=<seconds>
```bash
./weave.sh run
```
*Development mode*: -dev
*Staging mode*: -staging
*Single service execution* : --s=<service-name>

- **kill**

Stops the application or service
```bash
./weave.sh kill
```
*Development mode*: -dev
*Staging mode*: -staging
*Single service execution* : --s=<service-name>

- **add-service**

*Prompts user to select a service and service name, then adds it to the application*
```bash
./weave.sh add-service
```

- **rm-service**

*Removes the service from the application*
```bash
./weave.sh rm-service <service_name>
```

- **backup**

**WIP**
Backups the application or service
```bash
./weave.sh backup
```
*Development mode*: -dev
*Staging mode*: -staging
*Single service execution* : --s=<service-name>

- **backup-enable**

**WIP**
Enables cron backups for the application and all its services
```bash
./weave.sh backup-enable
```

- **backup-disable**

**WIP**
Disables cron backups for the application and all its services
```bash
./weave.sh backup-disable
```

## Available services

### Back-end

[go](https://github.com/nicolas-tdc/weave-go)

### Front-end

[vanillajs](https://github.com/nicolas-tdc/weave-vanillajs)

### Database

[mongo](https://github.com/nicolas-tdc/weave-mongo)

[mongo-express](https://github.com/nicolas-tdc/weave-mongo-express)

### Media

[navidrome](https://github.com/nicolas-tdc/weave-navidrome)

### Proxy

[nginx](https://github.com/nicolas-tdc/weave-nginx)