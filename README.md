Codename Monos
==============

'Monos' (Greek for alone) is the codename for my as-yet undesigned Ludum Dare 22 entry.

It's being written in JRuby and uses Slick and LWJGL for the magic.

DIARY.txt contains an updated diary about my progress.

Scripts
-------

* `bin/run` - Runs game under JRuby directly
* `bin/build_jar` - Removes old jar file (if any) and builds a new jar for packaging or running
* `bin/run_jar` - Runs the jar file with Java

Technologies
------------

* JRuby 1.6.5
* Warbler (packages into jar file)
* Launch4j (creates packed .exe for Windows)
* Jar Bundler (comes with Xcode - makes .app file for OS X from jar)

Directories
-----------

* `bin` - scripts and game runner
* `data` - game data, sounds, fonts, images, etc.
* `lib` - game code plus slick and LWJGL libraries
* `misc` - miscellaneously, currently just a Launch4j build file
* `native` - native libraries for OS X, Linux and Windows