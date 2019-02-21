![alt text](https://img.shields.io/badge/ruby-2.4.1-red.svg "Ruby")
![alt text](https://img.shields.io/badge/rails-5.2.1-red.svg "Ruby on Rails")
[![CircleCI](https://circleci.com/gh/hbellows/git_wired_be/tree/master.svg?style=svg)](https://circleci.com/gh/hbellows/git_wired_be/tree/master)
[![codecov.io](https://codecov.io/gh/hbellows/git_wired_be/branch/master/graph/badge.svg)](https://codecov.io/gh/hbellows/git_wired_be)
# About This Project
This API application contains endpoints that can be consummed by a frontend application to help developers track frontend functionality creation and completion by matching their github issues to an customizable, animated wireframe.  The user can specify wireframe elements and link them to the corresponding github issue.  The wireframe element will then change shade based on the issue's status as it progresses through development (ie, "To Do", "In Progress", and "Done").

View this application's progess by visiting it's [project board](https://github.com/hbellows/git_wired_be/projects/1).

## System Requirements
Please note: This application uses GitHub for Oauth, so you'll likely need to grab your own GitHub developer keys prior to using this application.

More information about GitHub developer keys can be found in the [GitHub developer docs](https://developer.github.com/v3/).

 - Ruby >= 2.4.1
 - Rails >= 5.2.1
 - Your own GitHub API key is needed to run the tests.
 - Please see the following section for instructions on handling personal api keys.

# Inital Setup
1. Clone or fork this project to your local machine.
2. Run `bundle` in the project folder.
3. Run `figaro install` in the project folder.
4. Add the following API keys to config/application.yml with the variable names exactly as shown:
   - `GITHUB_API_KEY`
5. Run `rails db:{create,migrate,seed}` in the project folder.
6. To use the application locally, run `rails s` and navigate to `http:localhost:3000`
7. Or, use go [here](https://git-wired-be.herokuapp.com/) to see the application live

# How To Use 
These are the endpoints that are currently available in the application:

## Repositories

To see all repositories for a user: 
```
GET to /api/v1/repositories
```
```
{
    "data": {
        "id": "hbellows",
        "type": "repository",
        "attributes": {
            "repositories": [
                {
                    "id": 1,
                    "name": "git_wired_be",
                    "github_id": "170214553"
                },
                {
                    "id": 2,
                    "name": "Brownfield-of-Dreams",
                    "github_id": "170607745"
                },
                {
                    "id": 3,
                    "name": "quantifiedSelfApi",
                    "github_id": "168269382"
                }
            ]
        }
    }
}
```
## Issues
```
GET to /api/v1/repositories/:repository_id/issues
```
```
{
  repo: 
   {
     name: 'Repo1"
     id:  1
     html_url: 'https://github.com/octocat/Hello-World'
    }
   issues:
      [
        {
          id:                1
          github_id:         4
          github_number:     99999
          github_html_url:   "https://github.com/octocat/Hello-World/issues/1347",
          github_title:      "Title of my Issue"
          github_body:       "Content of my issue body"
          github_state:      "open"
        },
        {...},
        {...},
      ]
}
```
## Wireframes
```
GET to /api/v1/repositories/:repository_id/wireframes
```
```
{
    "data": {
        "id": "git_wired_be",
        "type": "wireframe",
        "attributes": {
            "repository_wireframes": [
                {
                    "id": 1,
                    "repository_name": "My Repository",
                    "name": "Wireframe 1",
                    "object": "Wireframe Description 1",
                    "created_at": "February 20, 2019",
                    "updated_at": "February 20, 2019"
                },
                {
                    "id": 2,
                    "repository_name": "My Repository",
                    "name": "Wireframe 2",
                    "object": "Wireframe Description 2",
                    "created_at": "February 20, 2019",
                    "updated_at": "February 20, 2019"
                },
                {
                 "id": 3,
                    "repository_name": "My Repository",
                    "name": "Wireframe 3",
                    "object": "Wireframe Description 3",
                    "created_at": "February 20, 2019",
                    "updated_at": "February 20, 2019"
                }
            ]
        }
    }
}
```
```
GET to /api/v1/repositories/:repository_id/wireframes/:id
```
```
{
    "data": {
        "id": "git_wired_be",
        "type": "wireframe",
        "attributes": {
            "repository_wireframes": [
                {
                    "id": 1,
                    "repository_name": "My Repository",
                    "name": "Wireframe 1",
                    "object": "Wireframe Description 1",
                    "created_at": "February 20, 2019",
                    "updated_at": "February 20, 2019"
                }
            ]
        }
    }
}
```
```
POST to /api/v1/repositories/:repository_id/wireframes

body:
  {
    name: "Wireframe Name",
    object: "Description of Wireframe"
  }

Returns status code 201 and
  {
    message: "Wireframe successfully created"
  }
```
```
PUT to /api/v1/repositories/:repository_id/wireframes/:id

body:
  {
    name: "Wireframe Name",
    object: "Description of Wireframe"
  }

Returns status code 201 and
  {
    message: "Wireframe successfully updated"
  }
```
## Projects
To see all projects attached to a repository:
```
GET to /api/v1/repositories/:repository_id/projects
```
```
{
    "data": {
        "id": "git_wired_be",
        "type": "project",
        "attributes": {
            "repository_projects": [
                {
                    "repo_id": 1,
                    "project_id": 2166821
                    "name": "git_wired_be",
                    "state": "open",
                    "creator": "hbellows",
                    "creator_id": 35637783
                    "created_at": "February 12, 2019",
                    "updated_at": "February 17, 2019"
                }
            ]
        }
    }
}
```
```
GET to /api/v1/repositories/:repository_id/projects/:id
```
```
{
    "data": {
        "id": "git_wired_be",
        "type": "columns",
        "attributes": {
            "column_cards": [
                {
                    "column_name": "To Do",
                    "cards": [
                        17756001,
                        17755985,
                        17755977,
                        17562127
                    ]
                },
                {
                    "column_name": "In Progress",
                    "cards": [
                        17559315, 
                        17625549
                    ]
                },
                {
                    "column_name": "Needs Review",
                    "cards": []
                }
            ]
        }
    }
}

```

# Running Tests
Run `rspec` to run the full test suite, or `rails server` to load up the application.
# Dependencies

 ### All Environments
 [Rails](https://guides.rubyonrails.org/)
 
 [Postgresql](https://www.postgresql.org/)
 
 [Puma](https://github.com/puma/puma)
 
 [Bootsnap](https://github.com/Shopify/bootsnap)
 
 [Faraday](https://github.com/lostisland/faraday)
 
 [Figaro](https://github.com/laserlemon/figaro)
 
 [Fast_jsonapi](https://github.com/Netflix/fast_jsonapi)
 
 [Jason Web Token for Ruby](https://github.com/jwt/ruby-jwt)
 
 ### Development
 [Rspec for Rails](https://github.com/rspec/rspec-rails)
 
 [Capybara](https://github.com/teamcapybara/capybara)
 
 [Factory Bot for Rails](https://github.com/thoughtbot/factory_bot_rails)
 
 [Pry for Rails](https://github.com/rweng/pry-rails)
 
 [Awesome Print](https://github.com/awesome-print/awesome_print)
 
 [Fuubar](https://github.com/thekompanee/fuubar)
 ### Test
 [VCR](https://github.com/vcr/vcr)
 
 [Webmock](https://github.com/bblimke/webmock)
 
 [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
 
 [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
 
 [Simplecov](https://github.com/colszowka/simplecov)
  

# Contributing
GitWired is an open source project. We invite your participation through issues and pull requests! 

When adding or changing a service please add tests.

Issues needing additional support:
- Getting more robust card details from this GitHub endpoint: https://developer.github.com/v3/issues/
- Matching event details to the card from this GitHub endpoint: https://developer.github.com/v3/issues/events/

# Related Projects

More information about GitWiredFe can be found [here](https://github.com/JoelSmith123/git_wired_fe).
The GitWired frontend application is a JavaScript/React application that consummes the endpoints provided in this API.  

# Schema
![Schema](Schema.png)

# Contributors
This is a Capstone project for students wrapping up their studies at the Turing School of Software and Design.  The entire project consists of a backend Rails API application that provides endpoints for a JavaScript/React frontend application to consume.

Contributors to the backend application are [Harper Bellows](@hbellows) and [Jordan Whitten](@jordanwa1947).

Contributors to the frontend application are [Kate Rimkunas](@kate-v2) and [Joel Smith](@joelsmith123)

More information about the entire project can be found [here](http://backend.turing.io/module4/projects/cross_pollination/cross_pollination_spec).

More information about Turing School can be found [here](https://turing.io/).
