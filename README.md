CCSF Coders Club Website [![Build Status](https://travis-ci.org/CCSF-Coders/ccsf_coders_website.svg)](https://travis-ci.org/CCSF-Coders/ccsf_coders_website)
================

This project was started to recreate the CCSF Coders' Club website in an
indy-hacker fashioned theme. This site is intended to provide backend utilities
to users eventually, and currently serves as an information base for the Coders
Club.

Git Involved
===============

Check the issues page. We have tagged various issues as 'beginner-friendly' to encourage beginners coders to contribute!

You can always ask for help on our Google Group, [located here.](https://groups.google.com/forum/#!forum/ccsfcoders).

Understanding the structure of the website
===============

Due to a problem with the hills server (where we host the coders club website), we require a index.html file so we do not generate a '500 internal server error.'

Templates (located under /templates/ directory) are php files that are collections of partials. They are what is typically understood to be the web page. If you load ccsf.edu/coders, you will be redirected to ccsf.edu/coders/templates/index.php, and the totality of what you see is considered to be the 'template.' We used PHP's require_once() method to collect multiple partials into one bundle.

Partials (located under /partials/ directory) are files that are some portion of a template. A good example of a partial is the `<head>` section of the coders website is a partial called header.php. The template index.php calls header.php via require_once(), and header.php in turn calls navigation.php as well as loading some scripts and styles. So, a partial is a file that can be made up of smaller partials, as well as including javascript or styles as needed.

The philosophy is to make it trivial to re-use as many elements that make up our main pages as possible. For example: this structure allows us to have one navigation.php that we can re-use on every single page.

Bootstrap Reboot
===============

[Bootstrap](http://getbootstrap.com/) is a CSS and JavaScript library that helps web pages look nice on a variety of platforms (desktop, mobile, etc.). We use it. It is really helpful to familiarize yourself with the Grid system in particular. There are a number of good resources you can use to familiarize yourself with Bootstrap, get googling!

When editing html, you will notice a lot of funny class names attached to various elements. These class names are usually reserved by Bootstrap, and do a lot of the heavy lifting. For example:

    <div class="container">
        <div class="row">  
            <div class="col-lg-12 text-center">
                <h1>Welcome</h1>
            </div>
        </div>
    </div>
    
Each one of those class names are reserved by Bootstrap and help align the content (namely the `<h1>` tag) be perfectly centered on the page, no matter how big or small the screen is! If we were to re-organize the classes to be applied to different elements, the code would <b>NOT</b> work as intended.

When creating new content for the website, try and copy an existing partial and template and begin by modifying them. Keep in mind that when you re-organize and delete elements or classes, things make look drastically different then before!

Local developing of the website
===============

This website uses PHP, as described above. A developer may find that if you open the .html files in your browser by dragging and dropping, the PHP files 'don't work.' This is because we are using PHP as a server side scripting HTML pre-processor, and a developer's browser does not know what to do with the .php files.

But, a developer want to develop the website using PHP is on Hills (CCSF's server). What do?

###Long way (but interesting, if your into Virtual Machines and/or Vagrant): 
Follow the instructions on our repo at https://github.com/CCSF-Coders/vagrant-apache-php
###Short way: 
In PHP 5.4 and above you may run this in your console to start a simple php webserver:

    $ php -S localhost:80

Thanks, and find out more, to this StackOverflow post: http://stackoverflow.com/a/4302028/3494646

Testing & Continuous Integration
===============

Automated testing with Travis CI is here! You can [view our build history by clicking here.](https://travis-ci.org/CCSF-Coders/ccsf_coders_website)

###How does Travis CI work?
When a push or pull request is made to this repo, Travis CI will know. Travis CI will then spin up a virtual machine on their servers, run our tests and report back how it went. 

###Manually run the tests
The tests use Python and the `py.test` library. You can install all necessary dependences by running

    pip install -r stable-req.txt

in the `tests/` directory.

The tests also run headlessly by utilizing PhantomJS. You can install PhantomJS using Node's NPM:

    npm install -g phantomjs

To run the tests, first enter the `tests` directory and run:

    py.test -s tests/test_basic.py
    
NOTE: The tests are hard-configured to look for the address `http://localhost:80/templates/index.php`. If your webserver is serving at a different address (notice the port number in particular), then you can modify the port the webserver listens on or change this line in the file `test_basic.py`

        self.driver.get('http://localhost:80/templates/index.php')
        
to the desired url.

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