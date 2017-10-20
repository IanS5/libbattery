all: battery

clean:
	rm battery libbattery.o

# CFLAGS=-Wall

libbattery.so: libbattery.o
	gcc -shared -o libbattery.so libbattery.o
libbattery.o: libbattery.c battery.h
	gcc $(CFLAGS) libbattery.c -o libbattery.o -c -lm -fpic

battery: battery.c libbattery.c battery.h
	gcc $(CFLAGS) battery.c libbattery.c -lm -o battery
