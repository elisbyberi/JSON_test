all:
	gnatmake -P json_test

debug:
	BUILDTYPE=Debug gnatmake -P json_test

clean:
	gnatclean -P json_test
	BUILDTYPE=Debug gnatclean -P json_test
