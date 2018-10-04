# Quantified Self

Quantified Self is an API built to serve as the backend for an application designed to track daily food intake. It is built using Rails and a Postgres database.  The project was built as part of the curriculum for the backend program at Turing School of Software and Design. The project spec can be found [here](http://backend.turing.io/module4/projects/quantified_self/quantified_self_rails).  

[![Build Status](https://travis-ci.com/colinwarmstrong/quantified_self.svg?branch=master)](https://travis-ci.com/colinwarmstrong/quantified_self)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need access to a terminal application and a text editor.

### Installing

From your terminal, clone the repository to your local machine:

```
git clone https://github.com/colinwarmstrong/quantified_self.git
```

Change into the directory:

```
cd quantified_self
```

Install and update gems:

```
bundle install
bundle update
```

Setup the database:

```
rake db:{drop,create,migrate,seed}
```

The repository is now setup on your local machine. To run a local version of the repository, first spin up a local Rails server:

```
rails s
```

Once the server is up and running, visit [http://localhost:3000/api/v1/foods](http://localhost:3000/api/v1/foods) or any of the other endpoints to see the JSON that is returned.


## Running the tests

The test suite is built using RSpec.  To run the test suite after you have set up the repository locally, run `rspec` from the command line.

## Deployment

Quantified Self is deployed through [Heroku](https://www.heroku.com/).

## Built With

* [Rails 5.1.6](https://rubyonrails.org/) - Ruby based web framework
* [Postgres 1.1.3](https://www.postgresql.org/) - Relational SQL Database

## Author

* **Colin Armstrong**  
 	- [GitHub](https://github.com/colinwarmstrong)
 	- [LinkedIn](https://www.linkedin.com/in/colinwarmstrong/)
 	- [Twitter](https://twitter.com/colinarms93)


## Contributing

If you would like to contribute, you can email the author at colinwarmstrong@gmail.com.
