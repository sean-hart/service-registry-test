# service-registry-test

## The Basics

`service-registry-test` is a RESTful CRUD service built using Ruby and Rails. In the interest of not reinventing the wheel, Rails 5.0+ was chosen as it implements an `--api` flag allowing us to skip creation of a view. As a RESTful service, inputs will be http calls via something like `curl` or `httpie`. Outputs are returned as JSON.

## Endpoints
* List
* Create
* Read
* Update
* Delete

## Data Model
For the purposes of this PoC, we've chosen to implement `sqlite` as a light weight data store on disk. This can be changed out with something like `postgresql` as required.

The `service-registry-test` model contains the following fields:
* service_name (string)
* owner (string)
* description (string)
* language (string)

## Prerequisites
This service requires the following installed to compile and run:

* Ruby 2.2.2+
* Rails 5.0+

## Local Setup
There are a few areas to configure your local environment for this application once its been cloned

### Data Persistence
To initialize the included `sqlite` data store, run the following command:

```
rails db:migrate
```

### Running Tests
To run the included test suite, run the following command:

```
bundle exec rspec
```

### Running The Service
To start the application, run the following command from within `service-registry-test` folder:

```
rails s
```

## Examples
The following examples show how to interact with the service running locally on port 3000 using `httpie`:

### Add a Service
```
http POST :3000/services service_name=hollowchronic owner=Damion description=Amazing! language=Ruby
```

### Add Another Service
```
http POST :3000/services service_name=wizbang owner=Clarice description=Neat! language=Ruby
```

### List Services
```
http :3000/services
```

### View Service (ID 1)
```
http :3000/services/1
```

### Update Service (ID 1)
```
http PUT :3000/services/1 service_name=hellochrono
```

### Delete Service (ID 2)
```
http DELETE :3000/services/2
```
