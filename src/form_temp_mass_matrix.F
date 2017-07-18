      subroutine form_temp_mass_matrix(x , tlhs )
c
c-------------------------------------------------------------------------
c
c   This routine calculates the contribution of the mass  for the thermal
c   left hand side
c
c-------------------------------------------------------------------------
c

      use materials
      use fe
      use bc

      implicit double precision (a-h,o-z)
c
c.... remove above card for single-precision operation
c
c
#include<common.h>
c
        dimension  x(2,*), tlhs(*)  
c
        dimension tmassl(4) , xl(2,4)
     &            , rl(4) 

c.... initialization
	do i = 1, 4
	  tmassl(i) = zero
	enddo
	
c
c.... loop over the elements
c

      do iel = 1,numel
        do n = 1,4
          xl(1,n) = x(1, ien(iel,n) )
          xl(2,n) = x(2, ien(iel,n) )
c	  rl(n)   = dens(lmt(iel,n))
	  rl(n)   = dens(ien(iel,n))
        enddo
c
c.... call the global shape function
c
c       call genshg (shdx, shdy, det, xl, iel)
c
         volume=det(iel,1)+det(iel,2)+det(iel,3)+det(iel,4)
c

        do n = 1, 4

	  tmassl(n) = rl(1) * shl(1,n) + rl(2) * shl(2,n)
     &              + rl(3) * shl(3,n) + rl(4) * shl(4,n)
        enddo
c
c        volume=volume/
c     &           (tmassl(1)+tmassl(2)+tmassl(3)+tmassl(4))
c
        do n = 1, 4
          tlhs(ien(iel,n))=tlhs(ien(iel,n))+tmassl(n)*det(iel,n) 

        enddo
c
c.... end element loop 
c
      enddo
c
c....  invert mass 
c
        nloop = numnp
c        if (nwrap .gt. 0) nloop = numnp - nwrap - 1
        if (nwrap .gt. 0) nloop = numnp - nwrap
        do 300 i = 1 , nloop
           k = idt(i)
           if(k.eq.0) then
              tlhs(i) = one
           else
              tlhs(i) = one/tlhs(i)
           end if
300   continue
c....  return
c
      return
      end
