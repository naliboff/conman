#
# makefile for the solver routines
# 
FC=gfortran
FFLAGS = -O3 -fdefault-real-8 -fdefault-double-8 -fdefault-integer-8 

SOLVER=zfactor.o back.o factor.o coldot.o unfact.o unback.o

#
../../libs/libsolver.a: $(SOLVER)
	$(AR) cr ../../libs/libsolver.a  $(SOLVER) 

clean:
	rm -rf core $(SOLVER) 

