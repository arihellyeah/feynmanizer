# Feynmanizer

Richard Feynman was an American physicist that coined the Feynman Technique, a technique in which one breaks down a complex concept into a form so simple that it becomes comprehensible to a child. 

The Feynmanizer app is a collection of 'Feynmanized' concepts. A logged in user can create their own concepts, adding it to one of the three categories: 'Science', 'Coding', or 'Other'. Doing so generates a new page that other users can comment on. The page also imports MERRIAM-WEBSTER'S Dictionary API, pulling in the dictionary definition of the term.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

For this app, you will need to have Ruby and Rails on your system:
Fire command prompt and run command:
```
$ ruby -v
```

Make sure Rails is installed
```
$ rails -v
```
If you see Ruby and Rails version then you are good to start. If not, [follow this guide](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm).

### Installing

Clone the repository:

```
$ git clone https://github.com/arihellyeah/feynmanizer.git
```

Install all dependencies:

```
$ bundle install
```

Create db and migrate schema:

```
$ rake db:create
$ rake db:migrate
```

Now run the application:

```
$ rails s
```

## Running the tests

This application's tests are through [rspec](https://github.com/rspec/rspec-rails).
To run the tests please run the following command:

```
$ bundle exec rspec
```

## Deployment

If you'd like to deploy this application, I recommend doing so through Heroku.
You can learn about deploying an app to Heroku through git, [here](https://devcenter.heroku.com/articles/git).

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used


## Contributing

Want to contribute? Great! Just send over a pull request and I'll check it out :-) 


## Acknowledgments

* Denver University Coding Bootcamp - thank you for giving me the skills I needed to build this application.
* My mentors: Andrew & Mike - thank you for your support.


