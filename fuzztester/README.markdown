# About
Fuzztester spiders a website, and then continues on to spider a random link on that page

#Prereq
phantomjs on your machine
Get it from here http://code.google.com/p/phantomjs/

#Launch
	phantomjs.exe fuzztester.coffee <URLtoFetch>

##Sample
	phantomjs.exe fuzztester.coffee http://www.gfader.com

		Getting: http://www.gfader.com ...
		 Page title is Peter Gfader - Agile Software Consultant and Trainer
		 Loading time 1374 msec
		 Links in page: 4
		  1
		Getting: http://blog.gfader.com/ ...
		 Page title is Peter Gfader 's .NET Blog
		 Loading time 8537 msec
		 Links in page: 285
		  141
		Getting: javascript:void(0) ...
		 FAIL to load the address

