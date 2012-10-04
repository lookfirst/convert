convert
=======

replacement for the [appengine conversion api](https://developers.google.com/appengine/docs/java/conversion/) which has been decommissioned as of November 2012

This project integrates binaries for Ghostscript/ImageMagick with a thin NodeJS web wrapper with easy deployment on Heroku.

Simply ```POST/enctype=multipart/form-data``` an uploaded file to the server, with some arguments, and it'll return the result directly. Take a look at the [upload.html](https://github.com/lookfirst/convert/blob/master/public/upload.html) file for examples of the arguments.

This project is released under a Apache 2.0 style license.

deploy
------

1. Install the [heroku toolbelt and setup your account](https://devcenter.heroku.com/articles/quickstart). 
1. Read [these directions](https://devcenter.heroku.com/articles/nodejs) for setting up a NodeJS app.
1. ```git clone``` this repo
1. ```heroku create``` to create an appserver.
1. ```git push heroku master``` to push this code up to heroku.
1. ```heroku config:add NODE_ENV=production```
1. ```heroku ps:scale web=1``` to start the server.
1. ```http://yourapp.herokuapp.com/upload.html``` u: nixon p: @#$jfiehd1

develop
-------

1. See above for setting up the toolbelt and cloning this repo.
1. ```sudo npm install -g nodemon``` to install nodemon globally
1. ```npm install``` to install the rest of the node dependencies locally
1. ```foreman start``` to start the server
1. ```http://localhost:5000/``` u: nixon p: @#$jfiehd1

> I also added [documentation](https://github.com/lookfirst/convert/wiki/Compile) for compiling recent versions of Ghostscript/ImageMagick on Heroku. The binaries are packaged in the ```/vendor``` directory.