CC = gcc
FLAGS = -Wall -g
# LOOPS_OBJECT_FILES = basicClassification.o advancedClassificationLoop.o
# REC_OBJECT_FILES =  basicClassification.o advancedClassificationRecursion.o
LB=basicClassification
LL=advancedClassificationLoop
LR= advancedClassificationRecursion
# STATIC_LIBS = loops recursives
# DYNAMIC_LIBS = recursived loopd
# MAINS = mains maindloop maindrec

.SUFFIXES:

loops: libclassloops.a
libclassloops.a: $(LB).o $(LL).o
	ar -rcs $@ $^

recursives: libclassrec.a
libclassrec.a: $(LB).o $(LR).o
	ar -rcs $@ $^

recursived: libclassrec.so
libclassrec.so: $(LB).o $(LR).o
	$(CC) $(FLAGS) -shared -o $@ $^
loopd: libclassloops.so
libclassloops.so: $(LB).o $(LL).o
	$(CC) $(FLAGS) -shared -o $@ $^

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o $@ $^


maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so

all: loops maindrec recursives recursived loopd mains maindloop 

main.o: NumClass.h main.c
	$(CC) $(FLAGS) -c main.c
$(LB).o: $(LB).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC
$(LL).o:$(LL).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC
$(LR).o: $(LR).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC

clean:
	rm -f *.o *.a *.so mains maindloop maindrec mainrec

.PHONY: clean all loops loopd  recursived recursives