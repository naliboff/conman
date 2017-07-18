      subroutine adjust_velocity_rhs_for_bc
     &  (lmv, stiff, iel, vbcl, vbcr)

      implicit double precision (a-h,o-z)
c
c.... remove above card for single-precision operation

      include 'common.h'

      dimension lmv(numel,8),stiff(8,8),vbcl(8),vbcr(*)

c.... vbcr(lmv(ivel,i)) = vbcr(lmv(ivel,i)) - stiff(i,j) * vbcl(j) 

	do i = 1, 8     ! looping column
         if (lmv(iel,i) .ne. 0) then
	 do j = 1, 8    ! looping row
          vbcr( lmv(iel,i) ) = vbcr( lmv(iel,i) )
     &                        - stiff(i,j) * vbcl(j) 	
c    &                        - stiff(i,j) * vbcl(j) 	
	 enddo
         endif
	enddo

c....  return

      return
      end
