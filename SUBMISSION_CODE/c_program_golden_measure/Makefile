#Tinotenda Chemvura 

## Main Program

CC=g++
CCFLAGS=-std=c++11

SRC = src/main.cpp \
        src/Image.cpp \
        src/Image.h \

OBJ = $(SRC:.cpp=.o)

PROG = imageops

$(PROG) : $(OBJ)
	$(CC) $(CCFLAGS) $(SRC) -o imageops
	
.cpp.o:
	$(CC) $(CCFLAGS) -c $<

depend:
	$(CC) -M $(SRC) > incl.defs

clean:
	rm -f *.o
	rm -f imageops
	rm -f tests
	rm -f *.pgm
	
