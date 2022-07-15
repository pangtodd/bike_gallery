# Bike Gallery

#### By Todd Pangilinan, Marcus Ferreira, Z Perez, Erika Mogollon, & Kyle Miller

## Technologies Used

* Ruby-on-Rails
* Rspec 
* Pry
* Capybara
* Faker 
* shoulda-matchers 
* Devise 
* HTML
* CSS
* PSQL
* Active Storage for photos
* AWS 

## Description:
_Using Ruby on Rails and Postgres, this website allows a customer or employee(admin) to sign into Bike Gallery website. From there, admins can manage bikes and general users can add reviews of bikes. Admins posess full CRUD capabilities for both bikes and reviews; signed in users can create reviews; all visitors(admins, signed-in users, or visitors not signed in) can view bikes and reviews. Admins are also able to upload photos of bikes while either creating or editing photos; photos are currently configured to save on an AWS bucket. Overall, this website demonstrates our understanding of one-to-many relationship between bikes and Reviews using authentication, scopes, validations, callbacks, seeding, and flash messages._

## User Stories

* _As an admin, I want to view, add, update and delete bikes._
* _As an admin, I should be able to log in and log out of the application._
* _As an admin, I should be able to add, update and delete reviews._
*  _As an admin, I should be able to add reviews._
* _As a user, I want to be able to create an account and add a review to a bike._


## Setup/Installation Requirements

* _You will need to install the following before proceeding (click on the link to follow the installation process):_
_[Ruby](https://www.ruby-lang.org/en/documentation/installation/),_
_[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_
* Clone or download this repository onto your desktop.
* Navigate to the top-level of directory.
* Open VScode.
* Open the Gemfile at the root level. Make sure your version of Ruby matches.
* Type "bundle" to install the gems
* Make sure the appropriate code is commented in/out of `Config/database.yml` (we have configs for both Mac and PC)
* If using Windows, in `Config/database.yml` file, add username & password to the `development:`, `test:`, & `production:`
* An Example:  
```
development:
  <<: *default
database: marios-food_development
username: <%= ENV['POSTGRES_USERNAME'] %> 
password: <%= ENV['POSTGRES_PASSWORD'] %> 
```

**To enable photos to be posted**: 
Currently, the app is set up to store photos via an AWS bucket. If you have an AWS account and bucket you would like to use:
  1. Update `Config/storage.yml` to reflect your Amazon bucket's region and bucket name.
  2. Update your credentials. In your temrinal, type `EDITOR=nano bin/rails credentials:edit` (if you already have an editor set up, skip the `EDITOR=nano`).
  3. Update the credentials to match your bucket's AWS/IAM credentials. 
  4. Make sure it is not commented out. Save file.

If you do not have an AWS account and want to try out saving photos, you can save them locally:
  1. Update `config/environment/development.rb`. Change `config.active_storage.service = :amazon` to `config.active_storage.service = :local`.
  2. Update `config/environment/production.rb`. Change `config.active_storage.service = :amazon` to `config.active_storage.service = :local`.

**To Run the App in Browser**: 
  1. On Windows, run `pg_ctl start` in the terminal to run a server. On Mac, run `postgres`
  2. `rake db:create`
  3. `rake db:test:prepare`
  4. `rake db:migrate`
  5. `rake db:seed`
  6. Then run `rails s` to start up rails, which you can access by entering `localhost:3000` in your browser.
* **To Run Tests**: In the root directory of this project, run `rspec` in your command line.



#### Users:

* _To create a new user visit the webpage, on the navbar click 'Sign up' and fill out the form_

###### _To update a user to admin status_
* _open rails console (type in terminal):_
```
rails c
```
* _To update an admin status in the terminal:_
```
User.where(email:"Insert your email here").update(admin: true)
```
* _Once an admin is created you can add users as admins. Go to the webpage, on the nav bar click on:_
```
"Admin"
```
* _This will take you to the Site Administration. click on:_
```
"Users"
```
* _Click on the pencil icon next to the user you want to edit._
* _Scroll down and hit the check box next to "Admin"._

Alternatively, if you seeded the database:
* _you can sign in as a user with:_
```
email: "user test.com"
password: "password"
```

* _you can sign in as an admin with:_
```
email: "admin@test.com"
password: "password"
```
## Known Bugs

- As of 7/15, no known bugs.
- if you notice any bugs or errors, please email pang.todd@gmail.com

## License

- N/A Copyright (c) 7/13/2022, Todd Pangilinan, Marcus Ferreira, Z Perez, Erika Mogollon, & Kyle Miller
- _[MIT](https://opensource.org/licenses/MIT)_