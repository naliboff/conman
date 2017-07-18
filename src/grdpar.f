      subroutine grdpar (x, gpars,  ngpars)
c
c-----------------------------------------------------------------------
c
c  This routine reads the grid parameters.
c
c
c input:
c  x            : unstructured mesh coordinates
c
c output:
c  gpars      : structured mesh parameters (xmin, xmax, xinc,
c                                    ymin, ymax, yinc)
c  ngpars      : structured mesh resolution parameters 
c
c Farzin Shakib, Spring 1989.
c-----------------------------------------------------------------------
c
      implicit double precision (a-h,o-z)
c
c     maximum pixel for x and z direction is 601 
      parameter (ipsolx = 301, ipsolz = 101)
      include 'common.h'
c  
      dimension x(2,*), gpars(3,2), ngpars(2)
c
c.... compute the maximum and minimum mesh values
c
      xmin = x(1,1)
      xmax = x(1,numnp)
      ymin = x(2,1)
      ymax = x(2,numnp)
c
cdo 100 n = 2, numnp
cxmin = min (xmin, x(1,n))
cxmax = max (xmax, x(1,n))
cymin = min (ymin, x(2,n))
cymax = max (ymax, x(2,n))
100      continue
c
c.... get grid resolution
c
c      ngpnt = 65 - 1
      ngpnt = ipsolx - 1
      fact  = dmin1(one, (xmax-xmin)/(ymax-ymin))
      ngpnt = int(fact * dble(ngpnt))
      ngpars(1)  = ngpnt + 1
      hxy        =     (xmax - xmin) / dble(ngpnt)
c      hxy        =     (xmax - xmin) / dble(ngpars(1))
      itmp       = int((ymax - ymin) / hxy + 0.5)
c      ngpars(2)  = itmp + 1
      ngpars(2)  = itmp
      gpars(1,1) = xmin
      gpars(2,1) = xmax
      gpars(1,2) = ymin
      gpars(2,2) = ymax
      gpars(3,1) = hxy
      gpars(3,2) = hxy
      gpars(2,2) = gpars(1,2) + float(itmp) * hxy
c
c.... return
c
      return
      end
