CC=gcc
AR=ar 
OBJECTS_MAIN=main.o
OBJECTS_loop=advancedClassificationLoop.o
OBJECTS_REC=advancedClassificationRecursion.o
OBJECTS_Basic=basicClassification.o
FLAGS= -Wall -g 
all:loops	recursived	loopd	recursives	mains	maindloop	maindrec

loops:libclassloops.a

libclassloops.a:	$(OBJECTS_loop)	$(OBJECTS_Basic)	
	$(AR)	-rcs	libclassloops.a	$(OBJECTS_loop)	$(OBJECTS_Basic)	

recursives:libclassrec.a
libclassrec.a:	$(OBJECTS_REC)	$(OBJECTS_Basic)
	$(AR)	-rcs	libclassrec.a	$(OBJECTS_REC)	$(OBJECTS_Basic)	

recursived:	libclassrec.so
libclassrec.so:	$(OBJECTS_REC)	$(OBJECTS_Basic)	
	$(CC)	-shared	-o	libclassrec.so	$(OBJECTS_REC)	$(OBJECTS_Basic)	

loopd:libclassloops.so 
libclassloops.so:$(OBJECTS_loop)	$(OBJECTS_Basic)	
	$(CC)	-shared	-o	libclassloops.so	$(OBJECTS_loop)	$(OBJECTS_Basic)	

mains:	$(OBJECTS_MAIN)	loops	recursives
	$(CC)	$(FLAGS)	-o	mains	$(OBJECTS_MAIN)	libclassloops.a	libclassrec.a

maindloop:	$(OBJECTS_MAIN) 
	$(CC)	$(FLAGS)	-o	maindloop	$(OBJECTS_MAIN)	./libclassloops.so

maindrec:	$(OBJECTS_MAIN) 
	$(CC) 	$(FLAGS)	-o 	maindrec	$(OBJECTS_MAIN)	./libclassrec.so

main.o:	main.c	NumClass.h	
	$(CC)	$(FLAGS)	-c 	main.c	

advancedClassificationLoop.o:	advancedClassificationLoop.c	NumClass.h 
	$(CC)	$(FLAGS)	-c	advancedClassificationLoop.c	

advancedClassificationRecursion.o:	advancedClassificationRecursion.c	NumClass.h
	$(CC) 	$(FLAGS) 	-c 	advancedClassificationRecursion.c	

basicClassification.o:	basicClassification.c	NumClass.h
	$(CC)	$(FLAGS)	-c	basicClassification.c	

.PHONY:clean all

clean all:
	rm	-f	*.o	*.a	*.so	mains	maindrec	maindloop