Recipe Box project
==================

This is another exercise in rails.  It's a simple recipe box application.  Users
can create and edit an account, log in and out, create and edit recipes (with a 
picture) and delete recipes.  There is no function for following other users, or 
viewing other user's submissions, that's outside the projects current scope.
Built over a two day period from 11-16 to 11-17 2015.

To get this up and running
--------------------------
_Note: This project was built in the Ruby development environment at https://c9.io/.
This simulates an IDE built on Unix.  This project should run properly on any *nix
machine (Linux, MacOS X, etc.) but getting this to work on Windows is difficult due 
to lack of support of the necessary tools.  If the user has any difficulties, I
recommend creating a Cloud9 account (seriously, it's awesome) and uploading the 
project there._

1. Clone the project.  
2. Make sure you have Ruby installed.  If not, get it [here](https://www.ruby-lang.org/en/downloads/). 
3. From the command line make sure you have bundler installed by entering "gem install bundler"
4. Navigate to the root folder of the project.
5. Run "bundle install" and rake db:migrate to set things up.  This will also seed
the database.
6. Install the ImageMagick program to work with Paperclip in handling photos.  The
program can be found here: http://www.imagemagick.org/script/binary-releases.php.
If you are on Cloud9 simply run "sudo apt-get install ImageMagick" from the command
line.
7. Rune "rails server" to get things running.  On Cloud9 run "rails s -b $IP -p $PORT"
8. Open your browser and navigate to "http://localhost:3000"  There you should seed
the page.  If you are running this on Cloud9 the URL will be different, the terminal
will show you the correct URL
9. When you're done, simply hit ctrl/cmd + c to quit the server.

Components used
---------------
* Ruby on Rails
* BCrypt
* Sass CSS
* Bootstrap
* Paperclip
* Cocoon

Still to do
-----------
* Implement persistent user sessions
* Add automated testing