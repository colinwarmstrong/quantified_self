# Quantified Self

[![Build Status](https://travis-ci.com/colinwarmstrong/quantified_self.svg?branch=master)](https://travis-ci.com/colinwarmstrong/quantified_self) [![Coverage Status](https://coveralls.io/repos/github/colinwarmstrong/quantified_self/badge.svg?branch=testing)](https://coveralls.io/github/colinwarmstrong/quantified_self?branch=testing)

(Quantified Self)[https://quantifiedself1.herokuapp.com/] is an API built to serve as the backend for an application designed to track daily food intake. It is built using Rails and a Postgres database.  The project was built as part of the curriculum for the backend program at Turing School of Software and Design. The project spec can be found [here](http://backend.turing.io/module4/projects/quantified_self/quantified_self_rails).  


## Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes.

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

The test suite is built using RSpec.  After setting up the respository locally, run the following command to run the test suite:
```
bundle exec rspec
```

## Endpoints

All endpoints can be accessed by appending them to the root URL `https://quantifiedself1.herokuapp.com`

##### Food Endpoints
- GET [/api/v1/foods](https://quantifiedself1.herokuapp.com/api/v1/foods)
	- Returns information about all foods currently in the database. Each food will be returned in the following format:
	```
    {
    "id": 1,
    "name": "Banana",
    "calories": 150
	},
    ```
    
- GET [/api/v1/foods/:id](https://quantifiedself1.herokuapp.com/api/v1/foods/1)
	- Returns information about a specific food.
	```
	{
    "id": 1,
    "name": "Banana",
    "calories": 150
	}
    ```

- POST /api/v1/foods
	- Allows creating a new food with paramaters in this form: 
	```
    { "food": { "name": "Name of food here", "calories": "Calories here"} }
    ```
- PATCH /api/v1/foods/:id
	- Allows one to update an existing food with parameters in this form: 
	```
    { "food": { "name": "Mint", "calories": "14"} }
    ```
- DELETE /api/v1/foods/:id
	- Deletes the specified food.

##### Meal Endpoints
- GET [/api/v1/meals](https://quantifiedself1.herokuapp.com/api/v1/meals)
	- Returns information about all meals currently in the database.
	```
    [
      {
          "id": 1,
          "name": "Breakfast",
          "foods": [
              {
                  "id": 1,
                  "name": "Banana",
                  "calories": 150
              },
              {
                  "id": 6,
                  "name": "Yogurt",
                  "calories": 550
              },
              {
                  "id": 12,
                  "name": "Apple",
                  "calories": 220
              }
          ]
      },
      {
          "id": 2,
          "name": "Snack",
          "foods": [
              {
                  "id": 1,
                  "name": "Banana",
                  "calories": 150
              },
              {
                  "id": 9,
                  "name": "Gum",
                  "calories": 50
              },
              {
                  "id": 10,
                  "name": "Cheese",
                  "calories": 400
              }
          ]
       }
  ]
    ```
- GET [/api/v1/meals/:meal_id/foods](https://quantifiedself1.herokuapp.com/api/v1/meals/1/foods)
	- Returns information about a specific meal and the foods eaten at that meal.
	```
    {
    "id": 1,
    "name": "Breakfast",
    "foods": [
        {
            "id": 1,
            "name": "Banana",
            "calories": 150
        },
        {
            "id": 6,
            "name": "Yogurt",
            "calories": 550
        },
        {
            "id": 12,
            "name": "Apple",
            "calories": 220
        }
      ]
    }
    ```
- POST /api/v1/meals/:meal_id/foods/:id
	- Adds the food with the specified id to the specified meal. If successful, returns:
	```
    {
    	"message": "Successfully added {FOODNAME} to {MEALNAME}"
	}
    ```
- DELETE /api/v1/meals/:meal_id/foods/:id
	- Removes the food with the specified id to the specified meal. If successful, returns:
	```
    {
    	"message": "Successfully removed {FOODNAME} from {MEALNAME}"
	}
    ```

##### Favorites Endpoints
- GET [/api/v1/favorite_foods](https://quantifiedself1.herokuapp.com/api/v1/favorite_foods)
	- Returns information about foods that are eaten most frequently in the following format:
	```
	[
      {
        "timesEaten": 4,
        "foods":
          [
            {
              "name": "Banana",
              "calories": 200,
              "mealsWhenEaten": ["Breakfast", "Dinner"]
            },
      },
      "timesEaten": 3,
      "foods":
        [
          {
            "name": "Strawberries",
            "calories": 200,
            "mealsWhenEaten": ["Breakfast", "Lunch", "Dinner"]
          },
          {
            "name": "Almonds"
            "calories": 800,
            "mealsWhenEaten": ["Snacks"]
          }
        ]
      }
  ]
	```

## Deployment

Quantified Self is deployed through [Heroku](https://www.heroku.com/) and hosted at https://quantifiedself1.herokuapp.com/.

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
