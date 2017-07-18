      subroutine print_reg(t)
c
c.... program to print kinematic data
c
      implicit double precision (a-h,o-z)
c
c.... deactivate above card(s) for single precision operation
c
      dimension t(65,65)
        common /io    / iin,    igeom, iout , itsout , itout , imout, 
     &                  irsin , irsout, icomp, igeoid
c     &                , ivisc , ivt  ,  ivin  , ivout

      do j=65,1,-1
        do i=1,65
          if(dabs(t(i,j)) .lt. 1.0e-5) t(i,j) = 0.0d0
        enddo
      enddo
c
      open(40,file="temp.bench.output")
      do j=65,1,-1
          write(40,2000) (t(i,j),i=1,65)
      enddo
      close(40)

c      dimension t(111,101)
c      common /io    / iin,igeom,iout ,itsout ,itout ,imout ,
c     &                irsin ,irsout

      nn = 0
c
c      do j=101,1,-1
c        do i=1,111
c          if(abs(t(i,j)) .lt. 1.0e-5) t(i,j) = 0.0d0
c        enddo
c      enddo
c
c      open(40,file="temp.bench.output")
c      do j=101,1,-1
c          write(40,2000) (1.3000e3*t(112-i,j),i=1,111)
c for GMT this works fine
c       do i=1,111
c         x = 660.0*(i-1)/110.
c         y = 600.0*(j-1)/100.
c         write(itout,*) x,y, t(i,j)
c       enddo
c      enddo
c      close(40)
c
c
      return
c
 2000 format(65(1pe14.7,1x))
      end
