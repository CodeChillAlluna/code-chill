# Code & Chill

[![Server version](https://img.shields.io/github/tag/CodeChillAlluna/code-chill-server.svg?label=Server&style=for-the-badge)](https://github.com/CodeChillAlluna/code-chill-server)
[![Client version](https://img.shields.io/github/tag/CodeChillAlluna/code-chill-client.svg?label=Client&style=for-the-badge)](https://github.com/CodeChillAlluna/code-chill-client)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge)](https://opensource.org/licenses/Apache-2.0)

Master project : Online development environment

Code&Chill is a web application written in Java and React. It gives users the possibility to use their development environment in a browser. No more worries about setup so just code, and chill.

If you want to know more about this project check our website : https://codechillalluna.github.io/code-chill/



# Sumary

- [Code&Chill Server](#server)
- [Code&Chill Client](#client)
- [Installation](#installation)



# Server

The server of Code&Chill is written in Java with the framework Spring-Boot 1.5. It's using JPA to interact with a Postgres database or whatever database you want to use, JWT for authentication, Docker to manage user environments, and more.

The code for the server is accessible [here](https://github.com/CodeChillAlluna/code-chill-server).



# Client

The client of Code&Chill is written in TypeScript with the framework React.

The code for the client is accessible [here](https://github.com/CodeChillAlluna/code-chill-client).



# Installation

We're only going to show you the easiest installation for Code&Chill (Client & Server on the same server with one command to start), but you can easily separate the server and the client on two servers.

For the easiest installation, we decided to dockerize our application so you can see our images on [DockerHub](https://hub.docker.com/u/codechillaluna).



## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)



## Download

We're assuming you are on your `$HOME` directory during the installation but you can be wherever you want, you'll just have to replace `$HOME` by the directory where you are during this guide.

First of all, go in your `$HOME` directory and clone this repository and go in the repository folder.

```sh
git clone https://github.com/CodeChillAlluna/code-chill.git
cd code-chill
```



## Configuration

Next we'll configure the server and the client part.

### Server

The configuration for the server is in <a href="resources/application.yml" target="_blank">`resources/application.yml`</a>. Open the file and edit the values you want. All of the configuration fields are commented to let you know what it's for.

### Client

The configuration for the server is in <a href="resources/config.js" target="_blank">`resources/config.js`</a>. Open the file and edit the values you want. All of the configuration fields are commented to let you know what it's for.



## Starting Code&Chill

The last step is to start the containers to run Code&Chill. For that you'll find a <a href="docker-compose.yml" target="_blank">`docker-compose.yml`</a> in this repository. If you cloned this repository in your `$HOME` folder, you don't have to edit it. If you cloned it elsewhere, you'll have to change the path to your configurations files in it.

Now to start Code&Chill, just type the following command while you are in the folder where `docker-compose.yml` is.

```sh
docker-compose up

# If you want to start Code&Chill in the background, use this command
docker-compose up -d
```

If you want, you can also create a service file to run Code&Chill at startup. You can find a service file for Code&Chill in the `resources` of this repository.
