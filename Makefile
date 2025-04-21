# Compiler
# Makefile

all: animal

animal: animal.cpp
	g++ -o animal animal.cpp

test: animal
	bash test.sh

clean:
	rm -f animal



