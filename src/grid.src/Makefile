#
# makefile for the grid library
# 
FC=pgf90
FC=gfortran
FFLAGS = -O3 -r8 -i8
FFLAGS = -O3 -fdefault-real-8 -fdefault-double-8 -fdefault-integer-8

GRID=genBC.o genfl12.o genfl.o geniBC.o genNBC.o iclear_mov.o move.o smove.o clear.o

#
../../libs/libgrid.a: $(GRID)
	$(AR) cr ../../libs/libgrid.a  $(GRID) 

clean:
	rm -rf core $(GRID) 

