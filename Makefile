init:
	@@if test ! -d test/qunit; then git clone git@github.com:GerHobbelt/qunit.git test/qunit; fi
	@@cd test/qunit && git pull origin master &> /dev/null
