# Java 9, Spring Boot, Docker multi-stage

### Requirements

- `docker` _(version 18.09 or newest)_

### How to do

- Build
```shell
export BUILDKIT_PROGRESS=plain
export DOCKER_BUILDKIT=1
docker build -t andreformento/backend .
```

- Run
```shell
export BUILDKIT_PROGRESS=plain
export DOCKER_BUILDKIT=1
docker run --rm -p 8080:8080 andreformento/backend
```

- Get

```
$ curl -X GET localhost:8080/products
[
   {
      "id":"ab1a3cd2-21cb-40ac-8e5c-14408e19b807",
      "title":"Product 1"
   },
   {
      "id":"bb042c03-7c8f-4578-842e-c11701ef4afd",
      "title":"Product 2"
   }
]
```

### References
- https://docs.docker.com/develop/develop-images/build_enhancements/
