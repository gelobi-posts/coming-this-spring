cd scripts

start/b jitter coffee js

start/b watchify js/stage/stage.js --path js --noparse=FILE --dg false -s stage -o dist/stage.js

cd ../styles

start/b compass watch

cd ..

cd scripts/coffee/server

nodemon serve.coffee