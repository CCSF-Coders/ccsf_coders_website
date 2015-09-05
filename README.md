CCSF Coders Club Website [![Build Status](https://travis-ci.org/CCSF-Coders/ccsf_coders_website.svg)](https://travis-ci.org/CCSF-Coders/ccsf_coders_website)
================

This project was started to recreate the CCSF Coders' Club website in an
indy-hacker fashioned theme. This site is intended to provide backend utilities
to users eventually, and currently serves as an information base for the Coders
Club.

Git Involved
===============

Check the issues page. We have tagged various issues as 'beginner-friendly' to encourage beginners coders to contribute!

This website lives at [ccsf.edu/coders](ccsf.edu/coders)

You can always ask for help on our Google Group, [located here.](https://groups.google.com/forum/#!forum/ccsfcoders).

Local developing of / Playing with the website
===============

This website uses PHP. A developer may find that if you open the `index.html` file in your browser by dragging and dropping, the website 'won't work.' This is because browsers do not know what to do with .php files. Currently, there are two ways to play with the website after cloning the repo to your computer:

### Long way (but interesting, if your into Virtual Machines and/or Vagrant): 
Follow the instructions on our repo at https://github.com/CCSF-Coders/vagrant-apache-php
### Short way: 
In PHP 5.4 and above you may run this in your console to start a simple php webserver:

(Note: You may need to `sudo` to run this command on your machine)
```bash
    $ php -S localhost:80
```

When you are finally ready to submit your changes to this repo, checkout this guide on how to make a [really good pull request](http://railsbridge.github.io/bridge_troll/) (replace bridge_troll with ccsf_coders_website and railsbridge with CCSF-Coders)(Thanks, [RailsBridge!](https://github.com/railsbridge)).

For a video on how to develop this website locally, submit a change and update the real website, [see this video made by Tyler.](https://www.youtube.com/watch?v=kjXa8po8aes)

Understanding the structure of the website
===============

The website starts at `index.html`. When you open that file, however, you should find you are redirected to a `template\index.php`.

`templates` (located under /templates/ directory) are php files that are collections of `partials`. They are what is typically understood to be the web page. If you load ccsf.edu/coders in your browser, you will be redirected to ccsf.edu/coders/templates/index.php, and the totality of what you see is considered to be the `template.` If you inspect the contents of any `template`.php file, you will see that they are a collection of PHP's require_once() methods to collect multiple `partials` into one file.

`partials` (located under /partials/ directory) are files that are some portion of a `template`. A good example of a `partial` is the `<head>` section of the coders website is a `partial` called `header.php`. The `template` `index.php` calls `header.php` via require_once(), and `header.php` in turn calls `navigation.php` as well as loading some scripts and styles. So, a `partial` is a file that can be made up of smaller `partials` and/or include arbitrary amounts of other HTML code as needed.

The philosophy is to make it trivial to re-use as many elements that make up our main pages as possible. For example: this structure allows us to have one navigation.php that we can re-use on every single page.

###Bootstrap Reboot

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