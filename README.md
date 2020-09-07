# Dormart API

![Build Status](https://github.com/mohamed-elalem/dormart-api/workflows/Ruby/badge.svg "Build Status") [![codecov](https://codecov.io/gh/mohamed-elalem/dormart-api/branch/master/graph/badge.svg?token=8AM4E1U05G)](https://codecov.io/gh/mohamed-elalem/dormart-api)


This is the API for an e-commerce app called dormart.

## Table of Contents

- [Dormart API](#dormart-api)
  - [Table of Contents](#table-of-contents)
    - [Installation](#installation)
    - [Running](#running)
    - [Testing](#testing)
    - [Notes](#notes)
    - [Todo](#todo)

### Installation

- Install postgres and configure it accordingly.
- install redis
- install mailcatcher gem 
  ```bash
  $ gem install mailcatcher
  ```
- Run the following
  ```bash
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
  ```

- Sign overcommit
  ```bash
  overcommit --sign
  ```

### Running

- run mailcatcher
  ```bash
  $ mailcatcher
  ```
- run redis
  ```bash
  $ redis-server
  ```
- run sidekiq
  ```bash
  $ sidekiq
  ```
- run rails server
  ```bash
  $ rails s
  ```

### Testing

The minimum test coverage required for the code to be pushed into master is **80%**.
This is maintained by overcommit which will not allow a commit to happen unless the code is safe.

To run the tests use the following commands.

```bash
$ rspec
```

### Notes

...

### Todo

- [ ] Dockerize the application.
- [ ] ...
