CC = gcc
FLAGS = -Wall
LOOPS_OBJECT_FILES = basicClassification.o advancedClassificationLoop.o
REC_OBJECT_FILES =  basicClassification.o advancedClassificationRecursion.o
# STATIC_LIBS = loop recursives
# DYNAMIC_LIBS = recursived loopd
# MAINS = mains maindloop maindrec

loops: libclassloops.a
libclassloops.a: $(LOOPS_OBJECT_FILES)
	ar -rcs libclassloops.a $(LOOPS_OBJECT_FILES)

recursives: libclassrec.a
libclassrec.a: $(REC_OBJECT_FILES)
	ar -rcs libclassrec.a $(REC_OBJECT_FILES)

recursived: libclassrec.so
libclassrec.so: $(REC_OBJECT_FILES)
	$(CC) $(FLAGS) -shared -o libclassrec.so $(REC_OBJECT_FILES)
loopd: libclassloops.so
libclassloops.so: $(LOOPS_OBJECT_FILES)
	$(CC) $(FLAGS) -shared -o libclassloops.so $(LOOPS_OBJECT_FILES)

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a


maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so

all: loops maindrec recursives recursived loopd mains maindloop 

main.o: NumClass.h main.c
	$(CC) $(FLAGS) -c main.c
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o:advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

clean:
	rm -f *.o *.a *.so mains maindloop maindrec mainrec

.PHONY: clean all