
LOCAL_GRUNT=node_modules/.bin/grunt

.PHONY: init build all

all: init build

init:
	@@if test ! -d test/qunit; then git clone git@github.com:GerHobbelt/qunit.git test/qunit; fi
	@@cd test/qunit && git pull origin master

# is grunt set up?
$(LOCAL_GRUNT): package.json Makefile 				\
				init
	npm install

dist/sizzle.js: $(LOCAL_GRUNT)						\
				sizzle.js
	@$(LOCAL_GRUNT)				

dist/sizzle.min.js: $(LOCAL_GRUNT)					\
				sizzle.js
	@$(LOCAL_GRUNT)				

build: 			$(LOCAL_GRUNT)						\
				sizzle.js
	@$(LOCAL_GRUNT)				
	