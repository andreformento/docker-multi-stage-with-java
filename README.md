# Java 9, Spring Boot, Docker multi-stage

### Requirements

- `docker`
- `docker-compose`

### How to do

- Build and run: `docker-compose up --build`
- Get:

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

- Clean all: `docker-compose down -t 0`
