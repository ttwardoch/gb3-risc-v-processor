.PHONY: \
	softwareblink \
	hardwareblink \
	bubblesort \
	benchmark \
	test \
	clean

softwareblink:
	cd softwareblink; make clean; make; make install
	cd processor; make
	
benchmark:
	cd benchmark; make clean; make; make install
	cd processor; make
	
test:
	cd test; make clean; make; make install
	cd processor; make

hardwareblink:
	cd hardwareblink; make clean; make;

bubblesort:
	cd bubblesort; make clean; make; make install
	cd processor; make

clean:
	cd softwareblink; make clean
	cd hardwareblink; make clean
	cd bubblesort; make clean
	cd processor; make clean
	rm -f build/*.bin
