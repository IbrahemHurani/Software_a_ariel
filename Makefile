CC=gcc
FLAGS=	-Wall	-g
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_BASIC=basicClassification.o
OBJECTS_ADVANCEDLOOP=advancedClassificationLoop.o
OBJECTS_ADVANCEDREC=advancedClassificationRecursion.o

all:	loops	recursived	loopd	recursives	mains	maindloop	maindrec

loops:	libclassloops.a
libclassloops.a:	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDLOOP)
	$(AR)	-rcs	libclassloops.a	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDLOOP)
		

recursives:	libclassrec.a
libclassrec.a:	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDREC)
	$(AR)	-rcs	libclassrec.a	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDREC)

recursived:	libclassrec.so
libclassrec.so:	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDREC)
	$(CC)	-shared	-o	libclassrec.so	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDREC)

loopd:	libclassloops.so
libclassloops.so:	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDLOOP)
	$(CC)	-shared	-o	libclassloops.so	$(OBJECTS_BASIC)	$(OBJECTS_ADVANCEDLOOP)

mains:	$(OBJECTS_MAIN)	recursives	loops
	$(CC)	$(FLAGS)	-o	mains	$(OBJECTS_MAIN)	libclassrec.a	libclassloops.a

maindloop:	$(OBJECTS_MAIN) 
	$(CC)	$(FLAGS)	-o	maindloop	$(OBJECTS_MAIN)	./libclassloops.so

maindrec:	$(OBJECTS_MAIN) 
	$(CC)	$(FLAGS)	-o	maindrec	$(OBJECTS_MAIN)	./libclassrec.so	

main.o:	main.c	NumClass.h
	$(CC)	$(FLAGS)	-c	main.c

basicClassification.o:	basicClassification.c	NumClass.h
	$(CC)	$(FLAGS)	-c	basicClassification.c

advancedClassificationLoop.o:	advancedClassificationLoop.c	NumClass.h
	$(CC)	$(FLAGS)	-c	advancedClassificationLoop.c


advancedClassificationRecursion.o:	advancedClassificationRecursion.c	NumClass.h
	$(CC)	$(FLAGS)	-c	advancedClassificationRecursion.c

.PHONY: clean all

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
