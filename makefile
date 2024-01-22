LoopMain: main.o basicClassification.o advancedClassificationLoop.o 
	gcc -o all main.o basicClassification.o  advancedClassificationLoop.o
main.o: NumClass.h main.c
	gcc -c main.c
basicClassification.o: basicClassification.c NumClass.h
	gcc -c basicClassification.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -c advancedClassificationRecursion.c
advancedClassificationLoop.o:advancedClassificationLoop.c NumClass.h
	gcc -c advancedClassificationLoop.c

clean:
	rm -f *.o