osuosl/python_webapp
=============

Building the python_webapp image
--------------------------------

To build the Python webapp Dockerfile:

    docker build -t osuosl/python_webapp .

This tags the docker image on your system as ```osuosl/python_webapp``` so
it can be referenced later.

Creating a new python_webapp-based Dockerfile
---------------------------------------------

Go to the repository you want to add a Dockerfile to. The main goal of
your new Dockerfile will be to copy in the program's source code and run any
necessary things like migrations or static file collection. Open a new file,
and inherit from the ```osuosl/python_webapp``` image you just created:

    FROM osuosl/python_webapp

To run your webapp, find the ```wsgi.py``` file. This is the interface between
Django and nginx. Since the ```python_webapp``` Docker image doesn't know where
this file is, we need to change the Gunicorn configuration to reflect its new
location with ```sed```:

    RUN sed -i 's/WSGIPATH/ganeti_webmgr.ganeti_web/g' /etc/supervisor.d/app.conf

Now copy over the source code into ```/opt/app/src```. Generally just copying
the entire working directory should be fine:

    COPY . /opt/app/src

If you need to place a config file for the application on the Docker image, now
is the time.

Install any required Python packages:

    RUN pip install .

And run migrations, collectstatic, and any other required operations:

    RUN python manage.py collectstatic --noinput
    RUN python manage.py syncdb --noinput

Voila! The Dockerfile is complete. It should look something like this:

    FROM osuosl/python_webapp

    RUN sed -i 's/WSGIPATH/ganeti_webmgr.ganeti_web/g' /etc/supervisor.d/app.conf
    COPY . /opt/app/src
    COPY ./config.yml /opt/ganeti_webmgr/config/config.yml
    RUN pip install .
    RUN django-admin.py collectstatic --noinput --settings "ganeti_webmgr.ganeti_web.settings"
    RUN django-admin.py syncdb --noinput --settings "ganeti_webmgr.ganeti_web.settings"

