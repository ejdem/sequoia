# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7
* System dependencies
- postgres
* Configuration

* Database creation

* Database initialization
`rails db:migrate`
to load initial data
merchants: `rake data_import:merchants\['../path/to/merchants.csv'\]`
shoppers: `rake data_import:shoppers\['../path/to/shoppers.csv'\]`
orders: `rake data_import:orders\['../path/to/orders.csv'\]`

Please run orders as the last one, so there are merchants and shoppers matching.

* How to run the test suite
`rails test`


- [x] add models for:
  - [x] merchants
  - [x] orders
  - [x] shoppers
- [ ]  validations for models?
- [x] add importer classes:
  - [x] merchants
  - [x] orders
  - [x] shoppers
  - [x] add rake tasks for them
- [x] adds dummy disbursements endpoint, and json schema:
  - [x] filter by merchant
  - [x] filter by week
- [x] disbursement model: merchant_id, amount(decimal)  
  - [x] store week on disbusement
- [x] add rake task, to compute Disbursements:
  - [x] add service class to compute total fee amount
  - [ ] test the service
  - [x] adds rake task calling the serivce
  - [x] store fee in a postgres


Disbusment requirements:
- Order.completed - orders where completed_at < Time.current and where created_at > last_monday
- make sure no order is computed twice!
- make sure no order is skipped
- fee:
  - 1% < 50E
  - 0.95% >=50 && < 300E
  - 0.85% >= 300E
  ? Should fees and brackets be configurable?
