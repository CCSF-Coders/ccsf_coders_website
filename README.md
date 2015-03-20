CCSF Coders Club Website
================

This project was started to recreate the CCSF Coders' Club website in an
indy-hacker fashioned theme. This site is intended to provide backend utilities
to users eventually, and currently serves as an information base for the Coders
Club.

Git Involved
===============

Trello is a common project management tool, and one we are attempting to use. [Click here to see what we have planned for the website, or give you some idea's of what you can contribute.](https://trello.com/b/VoEhp0kn/ccsf-edu-coders)

You can always ask for help on our Google Group, [located here.](https://groups.google.com/forum/#!forum/ccsfcoders)

Understanding the structure of the website
===============

Due to a problem with the hills server (where we host the coders club website), we require a index.html file so we do not generate a '500 internal server error.'

Templates (located under /templates/ directory) are php files that are collections of partials. They are what is typically understood to be the web page. If you load ccsf.edu/coders, you will be redirected to ccsf.edu/coders/templates/index.php, and the totality of what you see is considered to be the 'template.' We used PHP's require_once() method to collect multiple partials into one bundle.

Partials (located under /partials/ directory) are files that are some portion of a template. A good example of a partial is the <head> section of the coders website is a partial called header.php. The template index.php calls header.php via require_once(), and header.php in turn calls navigation.php as well as loading some scripts and styles. So, a partial is a file that can be made up of smaller partials, as well as including javascript or styles as needed.

The philosophy is to make it trivial to re-use as many elements that make up our main pages as possible. For example: this structure allows us to have one navigation.php that we can re-use on every single page.

Local developing of the website
===============

This website uses PHP, as described above. A developer may find that if you open the .html files in your browser by dragging and dropping, the PHP files 'don't work.' This is because we are using PHP as a server side scripting HTML pre-processor, and a developer's browser does not know what to do with the .php files.

But, a developer want to develop the website using PHP is on Hills (CCSF's server). What do?

######Long way (but interesting, if your into Virtual Machines and/or Vagrant): 
Follow the instructions on our repo at https://github.com/CCSF-Coders/vagrant-apache-php
######Short way: 
In PHP 5.4 and above you may run this in your console to start a simple php webserver:

    $ php -S localhost:8000

Thanks, and find out more, to this StackOverflow post: http://stackoverflow.com/a/4302028/3494646

Testing & Continuous Integration
===============

Automated testing with Travis CI is here! You can [view our build history by clicking here.](https://travis-ci.org/CCSF-Coders/ccsf_coders_website)

###How does Travis CI work?
When a push or pull request is made to this repo, Travis CI will know. Travis CI will then spin up a virtual machine on their servers, run our tests and report back how it went. 

###Manually run the tests
Please note that the current tests use Selenium's python bindings, so one would need to 
`pip install selenium`
preferably in a virtualenv, before running the tests. 

To run the tests, `cd` into the tests/ directory and run 

    python basictests.py -v

Developer Notes
===============

###Conventions
Some boilerplate notes: project wide, let's use the same tabbing convention

* Tab size: 2
* Tab type: spaces

Always indent inside of blocks on newlines. This is not considered throughout
the project thus far and should be considered from now on.

Types of block criteria:

* HTML/PHP tags
* CSS selectors
* JavaScript and PHP functions
* Loops and if statements of any kind

For example

    <?php
      $var = ["Hello", "World"];
      foreach($var in $value) {
        echo $value;
      }
    ?>

    <p>
      Hello, World.
    </p>

###Organization
Keep javascript files in /scripts/

Note: Please locate any non-trivial javascript files under /scripts/ and load them into header.php. That way we dont have to run around looking for where a piece of javascript is loaded in some 3rd level partial.

Keep css files in /styles/

Note: Please locate any non-trivial css files under /styles/ and load them into header.php. Same reason as above.

Keep partials (html files that are a part of a bigger template) in /partials/

Keep templates (php files that combine multiple partials) in /templates/

###Commenting
Dont forget, please :)