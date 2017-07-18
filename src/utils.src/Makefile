#
# makefile for the solver routines
# 
FC=gfortran
FFLAGS = -O3 -fdefault-real-8 -fdefault-double-8 -fdefault-integer-8

UTILS= fftsubs.o merror.o mydate.o mytime.o timer.o

#
../../libs/libutils.a: $(UTILS)
	$(AR) cr ../../libs/libutils.a  $(UTILS) 

clean:
	rm -rf core $(UTILS) 

