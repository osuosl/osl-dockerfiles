OSL Dockerfiles
===============

Dockerfiles for deploying/developing Python-based webapps and NodeJS-based
webapps. Each Dockerfile works slightly differently, so after choosing a
platform read its README.md before using it.

Testing
-------

To test the Dockerfiles, install the required gems from the included Gemfile:

    bundle install

Now, to test a specific Dockerfile simply run its spec with ```rspec```:

    $ rspec spec/python_webapp_spec.rb
    .

    Finished in 3.29 seconds (files took 1.3 seconds to load)
    15 examples, 0 failures

Or you can test all Dockerfiles by not passing any arguments to ```rspec```:

    $ rspec
    ...............

    Finished in 3.29 seconds (files took 1.3 seconds to load)
    15 examples, 0 failures
