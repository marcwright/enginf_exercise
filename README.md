# SalesLoft Engineering Infrastructure Exercise

SalesLoft is looking to add weather information to our app. Why? I dunno, Product Management is weird. 

Anyways, we need to set up a small proxy service so that we can abstract away the provider we use behind the scenes. Engineering Infrastructure is kicking off this project so we can get all the plumbing hooked up and good to go for development to add caching, service load balancing, and other complex things. 

They will need:
- The initial API
- A basic test suite
- CI to be setup
- A Docker-ized application
- Deployment files for Kubernetes

## What You Get

[Sinatra](http://sinatrarb.com/intro.html) has been set up and [Puma](http://puma.io/) is available to run the application server.

[Rspec](https://relishapp.com/rspec/rspec-core/docs) is also set up with some scaffolding in place. You must fill this in with your own tests.

No HTTP client is provided, but we like using [HTTParty](https://github.com/jnunemaker/httparty).

## Expected API

Your mission, if you choose to accept it, is to get weather information from [Dark Sky's API](https://darksky.net/dev) and present it as an HTTP API. You will need to get your own API key from Dark Sky, but they are free. **Please don't commit your API key into the repository or publish it to a Docker registry!**

`/weather?latitude&longitude` is the expected input for a location (e.g., `/weather?latitude=33.7984&longitude=-84.3883`). 

It should return JSON with the current weather and 7 day forecast. The response looks like this:
```json
{
  "date": "2018-01-23",
  "type": "partly-cloudy-day",
  "description": "Partly Cloudy",
  "temperature": 61.78,
  "wind": {
    "speed": 4.66,
    "bearing": 147
  },
  "precip_prob": 0,
  "daily": [
    {
      "date": "2018-01-23",
      "type": "partly-cloudy-day",
      "description": "Mostly cloudy throughout the day.",
      "temperature": {
        "low": 46.78,
        "high": 68.66
      }
    },
    ...
  ]
}
```

## CI and Deployment

You may use any CI system you like, as long as it works with Docker. We use [Codeship](http://codeship.com/) at SalesLoft, but it is not required.

For deployment, we use Kubernetes, so the app will need to run within a Docker container and you can re-use the container from the tests. We don't need to have the container image available publicly, just this repository.

If you don't have a Kubernetes cluster available, you can run one locally with [Minikube](https://kubernetes.io/docs/setup/minikube/) or remotely with [Katacode](https://www.katacoda.com/courses/kubernetes/playground) or [Play with Kubernetes](https://labs.play-with-k8s.com/).

In the end, you should be able to push to Github and have the test suite run. And we should be able to add the Kubernetes resources to a cluster and be able to access the API. 

