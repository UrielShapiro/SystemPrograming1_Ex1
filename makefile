CC = gcc
LOOPS_OBJECT_FILES = basicClassification.o advancedClassificationLoop.o
REC_OBJECT_FILES =  basicClassification.o advancedClassificationRecursion.o


loops: libclassloops.a
libclassloops.a: $(LOOPS_OBJECT_FILES)
	ar -rcs libclassloops.a $(LOOPS_OBJECT_FILES)

recursives: libclassrec.a
libclassrec.a: $(REC_OBJECT_FILES)
	ar -rcs libclassrec.a $(REC_OBJECT_FILES)

recursived: libclassrec.so
libclassrec.so: $(REC_OBJECT_FILES)
	$(CC) -shared -o libclassrec.so $(REC_OBJECT_FILES)
loopd: libclassloops.so
libclassloops.so: $(LOOPS_OBJECT_FILES)
	$(CC) -shared -o libclassloops.so $(LOOPS_OBJECT_FILES)

mains: main.o libclassrec.a
	$(CC) -Wall -o mains main.o libclassrec.a


maindloop: main.o libclassloops.so
	$(CC) -o maindloop main.o libclassloops.so

maindrec: main.o libclassrec.so
	$(CC) -o mainrec main.o libclassrec.so

all: main.o $(LOOPS_OBJECT_FILES) $(REC_OBJECT_FILES)


main.o: NumClass.h main.c
	$(CC) -c main.c
basicClassification.o: basicClassification.c NumClass.h
	$(CC) -c basicClassification.c
advancedClassificationLoop.o:advancedClassificationLoop.c NumClass.h
	$(CC) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) -c advancedClassificationRecursion.c

clean:
	rm -f *.o *.a *.so

.PHONY: clean all