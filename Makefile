test:
	npm test

watchTest:
	./node_modules/.bin/mocha --compilers coffee:coffee-script --watch test/*.coffee -R spec

compile:
	./node_modules/.bin/coffee --output build/ --compile src/*

.PHONY: test
