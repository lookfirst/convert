convert
=======

replacement for the [appengine conversion api](https://developers.google.com/appengine/docs/java/conversion/) that has been decommissioned as of November 2012

integrates binaries for Ghostscript / ImageMagick with a thin NodeJS web wrapper with easy deployment on Heroku.

simply ```POST/enctype=multipart/form-data``` an uploaded file to the server, with some arguments, and it'll return the result directly.

take a look at [upload.html](https://github.com/lookfirst/convert/blob/master/public/upload.html) for the arguments.

released under a Apache 2.0 style license.

deploy
------

1. install the [heroku toolbelt and setup your account](https://devcenter.heroku.com/articles/quickstart). 
1. read [these directions](https://devcenter.heroku.com/articles/nodejs) for setting up a NodeJS app.
1. ```git clone``` this repo
1. ```heroku create``` to create an appserver.
1. ```git push heroku master``` to push this code up to heroku.
1. ```heroku config:add NODE_ENV=production```
1. ```heroku ps:scale web=1``` to start the server.
1. ```http://yourapp.herokuapp.com/upload.html``` u: nixon p: @#$jfiehd1

develop
-------

1. see above for setting up the toolbelt and cloning this repo.
1. ```sudo npm install -g nodemon``` to install nodemon globally
1. ```npm install``` to install the rest of the node dependencies locally
1. ```brew install ghostscript``` && ```brew install imagemagick``` - you will need to install [brew](http://mxcl.github.com/homebrew/) first
1. ```foreman start``` to start the server
1. ```http://localhost:5000/``` u: nixon p: @#$jfiehd1

> [documentation](https://github.com/lookfirst/convert/wiki/Compile) on how Ghostscript/ImageMagick has been compiled on Heroku. binaries are in the ```/vendor``` directory.