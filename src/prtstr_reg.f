      subroutine prtstr_reg(press)
c
c.... program to print stress data
c
      implicit double precision (a-h,o-z)
c
c.... deactivate above card(s) for single precision operation
c     number of stress data : row 111, column 101

      dimension press(111,101)
c
      common /io    / iin,igeom,iout ,itsout ,itout ,imout ,
     &                irsin ,irsout

      nn = 0
c
c     pscale = press(1,93)
c     do j=101,1,-1
c       do i=1,111
c         press(i,j) = press(i,j) - pscale
c       enddo
c     enddo
c
      do j=101,1,-1
c         write(imout,2000) (press(112-i,j),i=1,111)
c for GMT this works fine
        do i=1,111
          x = 660.0D+0*(i-1)/110.0D+0
          y = 600.0D+0*(j-1)/100.0D+0
          write(imout,*) x,y, press(i,j)
        enddo
      enddo
c
c
      return
c
 2000 format(111(1pe14.7,1x))
      end
