Simple midi to javascript ( actually [coffee-script](http://coffeescript.org/) ) function mapper.

## install instructions

````
npm install
````

then

````
make start
````

or

````
./node_modules/.bin/coffee app/start.cofee
````
## how to use it

by default it will create a socket.io server at [localhost:1337](http://localhost:1337)  
at the moment there is a very simple "cc message 2 function" map model, which
definitely could be replaced by something more appropriated depending on how
you prefer to structure your code

## get in touch!

 - If you feel interested by this project and want to develop this further
 - have some nice ideas 
 - want to chat about it
 - want me to come over and have a geeky session  

just drop me a line: ````hems.inlet+gh@gmail.com````

````
$ happy patching
````

## thanks to :  
 * [coffee-script](http://coffeescript.org/)  
 ~ It gives me nightmares just to think how life could be without you

 * [node-midi](https://github.com/justinlatimer/node-midi)  
 ~ without you this wouldn't be possible wire this all in less than 10 minutes 

 * [inquirer](https://www.npmjs.org/package/inquirer)  
 ~ that awesome module to do awesome prompts on the command line  

 * [Dave Smith](http://www.davesmithinstruments.com/)  
 ~ For making something so good 30 years ago ( MIDI )

 * [socket.io](http://socket.io/)  
 ~ You guys have done a great work!

## unthanks to :  

 * [Dave Smith](http://www.davesmithinstruments.com/)  
 ~ For doing posh synths and not fucking about doing a new implementation of
 midi that works in modern days and then convincing everyone to swap and also
 for not sending me any of those posh synths that i won't probably afford to
 buy for the next good few years

 * [socket.io](http://socket.io/)  
 ~ For releasing 1.0 with loads of bugs