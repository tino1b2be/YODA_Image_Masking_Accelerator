
#Tinotenda Chemvura

## Main Program

CC=g++
CCFLAGS=-std=c++11

SRC = Tests.cpp \
        ../src/Image.cpp \
        ../src/Image.h \
        catch.hpp \

OBJ = $(SRC:.cpp=.o)

PROG = tests

$(PROG) : $(OBJ)
	$(CC) $(CCFLAGS) $(SRC) -o tests

.cpp.o:
	$(CC) $(CCFLAGS) -c $<

depend:
	$(CC) -M $(SRC) > incl.defs

clean:
	rm -f *.o
	rm -f *.pgm
	rm -f tests
