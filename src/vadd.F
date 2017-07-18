       subroutine vadd(vrhs , v)
c
      use bc

      implicit double precision (a-h,o-z)
c
c.... deactivate above card(s) for single precision operation
c
#include<common.h>
       dimension vrhs(*) , v(*) 
c
       do 100 j = 1 , ndof
       do 100 i = 1 , numnp
          if(idv(j,i) .ne. 0 ) then
             v(j+ndof*(i-1)) = vrhs(idv(j,i))
          else
             v(j+ndof*(i-1)) = vbc(j,i)
          end if
100   continue
c
c   fix up v for wrap-around b.c. 
c 
      if (nwrap .ne. 0 ) then
cc        do 200 n=1,2*nwrap+2
cc          iwrap = 2*numnp - 2*nwrap-2+n
        do 200 n=1,(2*nwrap)
          iwrap = 2*numnp - 2*nwrap+n
          v(iwrap) = v(n)
200     continue
      end if
      return
      end
