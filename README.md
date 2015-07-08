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

    Finished in 1.27 seconds (files took 0.67874 seconds to load)
    1 example, 0 failures

Or you can test all Dockerfiles by not passing any arguments to ```rspec```:

    rspec
    .

    Finished in 1.26 seconds (files took 0.88752 seconds to load)
    1 example, 0 failures
