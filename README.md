# Get Weather
## _Get your all city weather forecast at one place_

GetWeather is a Rails 6 based application, Uses a public API to get weather data to show on users screen.

- Rails 6
- Third Party Public API for weather.
- Bootstrap 5.1
- JQuery 3.6

## Installation

GetWeather requires Ruby 3.0+, Node.js and yarn installed into machine to run.

Install the dependencies and devDependencies and start the server.

```sh
git clone https://github.com/ketanBamnDevtech/get-weather.git && cd get-weather
bundle install
yarn install
rails db:setup
```

For development environments use below master-key

```sh
masterkey: 126df87cd2fe06b15d656beeb5e7570a
test user email: testuser@yopmail.com
test user password: password
```

## Docker

GetWeather is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8080, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
cd GetWeather
docker build -t <youruser>/GetWeather:${package.json.version} .
```

This will create the GetWeather image and pull in the necessary dependencies.
Be sure to swap out `${package.json.version}` with the actual
version of GetWeather.

Once done, run the Docker image and map the port to whatever you wish on
your host. In this example, we simply map port 8000 of the host to
port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart=always --cap-add=SYS_ADMIN --name=GetWeather <youruser>/GetWeather:${package.json.version}
```

> Note: `--capt-add=SYS-ADMIN` is required for PDF rendering.

Verify the deployment by navigating to your server address in
your preferred browser.

```sh
127.0.0.1:8000
```
