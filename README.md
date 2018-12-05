# README

## Features

- product catalog and cart functionality
- admin login and session management
- mailing system in connection with checkout
- internationalization with English and German

## Additional Gems

### Implementation

* [Comfy](https://github.com/comfy/comfy-bootstrap-form)

### Quality assurance

* [Guard](https://github.com/guard/guard)
* [RuboCop](https://github.com/rubocop-hq/rubocop)
* [Brakeman](https://brakemanscanner.org/)
* [License_finder](https://www.rubydoc.info/gems/license_finder)
* [SimpleCov](https://github.com/colszowka/simplecov)

## Getting started

e-commerce Web Application

To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```

Next, migrate the database:
```
$ rails db:migrate
```

Then, you can load some data to test the application in the browser:
```
$ rails db:fixtures:load
```

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```

## Run third party quality assurance

### Guard

Run automated tests with [guard](https://github.com/guard/guard):

```
$ bundle exec guard
```

### RuboCop

Verify the code style with the static code analyzer
[rubocop](https://github.com/rubocop-hq/rubocop):

```
$ rubocop -FRE -a
```

### Brakeman

Check for security problems
[brakeman](https://brakemanscanner.org/):

```
$ brakeman -A
```

### License Finder

Check dependencies with
[license_finder](https://www.rubydoc.info/gems/license_finder):

```
$ license_finder
```

### Simplecov

Check dependencies with
[SimpleCov](https://github.com/colszowka/simplecov):

Run your tests and open up ```coverage/index.html``` in your browser.

