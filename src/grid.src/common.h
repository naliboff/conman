c----------------------------------------------------------------------
c
c  This file contains the common blocks and the data declaration
c needed for the routines.  Hence, it is not necessary to modify
c the common blocks other than in this file, with the following
c
c
c----------------------------------------------------------------------
c
ccccccccc1ccccccccc2ccccccccc3ccccccccc4ccccccccc5ccccccccc6ccccccccc7cc
        real*4  a, cpunew, cpuold, cpu(20)
        character*1 ititle
c
        common a(1)
c
        common /const /zero  , pt25,    pt33,   pt5,     pt66,   one,    
     &                 onept5, two ,   three,  four,   sixten,  eps7
c
        common /elmpar/ ntype ,  numel , nen    , nenl   , 
     &                  nedof , numsuf , nipt   , nsize  ,
     &                  nsizet,  nEGnp , nEGdf  , nodebn ,
     &                  ntotal
   
c
        common /glbpar/ numnp  ,  nsd    , ndof   , nelx    , nelz , 
     &                  necho  ,  inrstr , iorstr , iflow   , isky ,
     &                  ntimvs ,  ntseq  , numeg  , nwrap   , numat,
     &                  neqt   ,  neqv   ,
     &                  iistep ,  itype  , isolve,
     &                  Di     ,  diff_T , cgamma  , rho0    , T0
     
c
        common /io    / iin,    igeom, iout , itsout , itout , imout, 
     &                  irsin , irsout, icomp, igeoid
c     &                , ivisc , ivt  ,  ivin  , ivout
     
        common /ioc   / name5
c
        common /title / ititle(80)
c
        common /tmdata/dt     , time   , 
     &                 alpha  , epstol , accel,
     &                 time0  , tsdprt , tmax   , tsave  , 
     &                 t_ini  , t_end  , datasv ,
     &                 tmovi0 , tmovi1 , tmovis , nmplot ,
     &                 lstep  , npass  , istep0 , nstep  , 
     &                 niter  ,  nsvprt , nstprt , nsmprt
     
c
        common /box / pert , xsize , zsize 
c
        common /fswtch/ FACSTW
        common /timer1/ cpu  ,cpunew,  cpuold, icode
c       
	parameter (ireg = 0)
