sequential: main.o sequential.o utilities.o
	gcc -fopenmp -lm -g -o schooling main.o sequential.o utilities.o
	rm -f *.o

parallel_for: main.o parallel_for.o utilities.o
	gcc -fopenmp -lm -g -o schooling main.o parallel_for.o utilities.o
	rm -f *.o

main.o: src/main.c src/fish.h src/utilities.h
	gcc -fopenmp -c src/main.c

sequential.o: src/sequential.c src/fish.h
	gcc -c src/sequential.c

parallel_for.o: src/parallel_for.c src/fish.h
	gcc -fopenmp -c src/parallel_for.c

utilities.o: src/utilities.c src/utilities.h src/fish.h
	gcc -fopenmp -c src/utilities.c

clean:
	rm -f *.o
