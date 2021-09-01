## Viewing Party

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
# Welcome to Viewing Party - We Are Here To party
[![Screen-Shot-2021-09-01-at-11-01-23-AM.png](https://i.postimg.cc/JhXyQGN5/Screen-Shot-2021-09-01-at-11-01-23-AM.png)](https://postimg.cc/XZV7jNDr)

### Schema
[![Screen-Shot-2021-08-31-at-5-20-25-PM.png](https://i.postimg.cc/fTPhTkxZ/Screen-Shot-2021-08-31-at-5-20-25-PM.png)](https://postimg.cc/jLy1Mxgk)

Find the [project spec here](https://github.com/turingschool-examples/viewing_party/projects/1).
## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#tools-used)
- [Contributing](#contributors)

# README
------

### <ins>Overview</ins>

[Viewing Party](https://github.com/sami-p/viewing_party) is a 10-day, 3 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

Our challenge was to build a functioning web app consisting of multiple relational databases and pull from multiple APIs to create friendships that can make viewing parties associated with a movie.

Learning goals and areas of focus consisted of:

- Consume JSON APIs that require authentication 
- Build an application that requires basic authentication 
- Organize and refactor code to be more maintainable 
- Implement a self-referential relationship in ActiveRecord 
- Apply RuboCop’s style guide for code quality 
- Utilize Continuous Integration using Travis CI 
 -Deploy to Heroku 

[Technical Requirements](https://github.com/turingschool-examples/viewing_party/projects/1)

### <ins>Tools Used</ins>
- Ruby 2.7.2
- Rails 5.2.6
- PostgresQL
- Postico
- Capybara
- Launchy
- Orderly
- SimpleCov
- Git/GitHub
- HTML
- CSS
- Bootstrap
- RSpec
- Pry
- Atom
- VS Code
- Heroku
- Faraday
- Travis
- RuboCop
- Figaro

### <ins>Contributors</ins>

👤  **Amanda McGuire**
- Github: [Amanda McGuire](https://github.com/amcguire17)
- LinkedIn: [Amanda McGuire](https://www.linkedin.com/in/amanda-e-mcguire)

👤  **Elliot Olbright**
- Github: [Elliot Olbright](https://github.com/ElliotOlbright)
- LinkedIn: [Elliot Olbright](https://www.linkedin.com/in/elliotolbright/)

👤  **Sami Peterson**
- Github: [Sami Peterson](https://github.com/sami-p)
- LinkedIn: [Sami Peterson](https://www.linkedin.com/in/samantha-peterson-15b18220b/)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/sami-p/viewing_party.svg?style=flat-square
[contributors-url]: https://github.com/sami-p/viewing_party
[forks-shield]: https://img.shields.io/github/forks/sami-p/viewing_party.svg?style=flat-square
[forks-url]: https://github.com/sami-p/viewing_party/network/members
[stars-shield]: https://img.shields.io/github/stars/sami-p/viewing_party.svg?style=flat-square
[stars-url]: https://github.com/sami-p/viewing_party/stargazers
[issues-shield]: https://img.shields.io/github/issues/sami-p/viewing_party.svg?style=flat-square
[issues-url]: https://github.com/sami-p/viewing_party/issues
<!--


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->


# Viewing Party

## Background and Description

"For this project, you will be building an application to explore movies and create a viewing party event for you and your friends to watch a movie together. The application will require basic authentication."

## Learning Goals
- Consume JSON APIs that require authentication 
- Build an application that requires basic authentication 
- Organize and refactor code to be more maintainable 
- Implement a self-referential relationship in ActiveRecord 
- Apply RuboCop’s style guide for code quality 
- Utilize Continuous Integration using Travis CI 
- Deploy to Heroku 

## Requirements
- Use RuboCop in project to enforce style guide
- Deploy to Heroku
- Use TravisCI for Continuous Integration
- Consume The Movie DB API
- Implement Basic Auth
- Choose one exploration option to complete

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```
    
* Consume API
  
   * visit [Movie DB API](https://developers.themoviedb.org/3/getting-started/introduction) to generate API key
   * Add API to Enviroment
  ```ruby 
   # config/apllication.yml  
   MOVIE_API: <<api_key>>
  ```
  * Interpolate API Key into endpoint calls
    *  *Example:
  ```ruby
     class MovieDbService < ApiService
     
        def self.top_movies_1_data
          get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API']}&language=en-US&page=1")
        end
     
     end 
  ```

* [System dependencies](https://github.com/bfl3tch/little-esty-shop/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate}
    Created database 'viewing_party_development'
    Created database 'viewing_party_test'
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```

* [Heroku Deployment](https://morning-caverns-25715.herokuapp.com/), for production
