# Dumb Exit

Random Dockerfile for randomly exiting a random container with a random exit code after a random time interval.

### Tags:

* [1.0, latest](1.0)

### Usage:

This docker image can be used for the purpose of testing an application or component's behavior, which deals with docker containers that run and exit.
With this you can easily test exiting docker containers in your application/setup.

#### Note: The probability of the container to exit with exit code 0 is 50% on purpose.


```
docker run -d hazim/dumb-exit
```

With custom lower and upper limits for random wait:
```
docker run -d -e WAIT_LOWER_LIMIT=20 -e WAIT_UPPER_LIMIT=30 hazim/dumb-exit
```

With custom lower and upper limits of exit codes:
```
docker run -d -e EXIT_CODE_LOWER_LIMIT=1 -e EXIT_CODE_UPPER_LIMIT=5 hazim/dumb-exit
```

With custom exit code and no random randomness ( :( ):
```
docker run -d -e EXIT_CODE=0 hazim/dumb-exit;
```

