CC = gcc
FLAGS = -Wall -g
LB=basicClassification
LL=advancedClassificationLoop
LR= advancedClassificationRecursion
MAIN = main
STATIC_LIBS = loops recursives
DYNAMIC_LIBS = recursived loopd
MAINS = mains maindloop maindrec
EXECUTABLES = mains maindloop maindrec mainrec

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

mains: $(MAIN).o libclassrec.a
	$(CC) $(FLAGS) -o $@ $^


maindloop: $(MAIN).o libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(MAIN).o ./libclassloops.so

maindrec: $(MAIN).o libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(MAIN).o ./libclassrec.so

all: $(MAINS) $(STATIC_LIBS) $(DYNAMIC_LIBS)

main.o: NumClass.h $(MAIN).c
	$(CC) $(FLAGS) -c $(MAIN).c
$(LB).o: $(LB).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC
$(LL).o:$(LL).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC
$(LR).o: $(LR).c NumClass.h
	$(CC) $(FLAGS) -c $< -fPIC

clean:
	rm -f *.o *.a *.so $(EXECUTABLES)

.PHONY: clean all $(STATIC_LIBS) $(DYNAMIC_LIBS)