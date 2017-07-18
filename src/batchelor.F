      subroutine batchelor(x,y,vx,vy)
c
c  A program to implement the Batchelor cornerflow solution
c  See Batchelor (1967) pp. 224-225
c
c  modified from Peter van Keken
c
      implicit double precision (a-h,o-z)

      real*8 x,y,vx,vy,speed,stream,edot12
      real*8 rr,theta0,v0,thetaprime,theta
      real*8 pi,vr,vtheta,xprime,yprime
      real*8 ftheta,dfdtheta,factor,x0,y0
      real*8 eps
c
c  constants
c
      data eps /1d-5/
c
c     *** Angle is 45 degrees
      pi=4.d0*atan(1.d0)
      theta0 = pi/4d0
      v0=1.54
c
c Define the coordinate system
c
c                ----------------> +y
c                |\
c                | \                The angle (y,r) is thetaprime
c                |  \
c                |   \ r
c                |
c                v +x
c
c Make sure the boundary conditions are set the right way on both
c sides of the wedge:
c
      x0=610
      y0=550
      xprime=(x0-x)
      yprime=(y0-y)
      rr=dsqrt(xprime**2.d0+yprime**2.d0)
c
c Calculate theta: There may be a problem for small radial diistances.
c
      thetaprime=acos(xprime/rr)
      if ((yprime .lt. 0).or.(xprime .lt. 0)) then
c        write(*,*)'Above wedge!'
         vx=0.d0
         vy=0.d0
         speed=0.d0
         stream=0.d0
         edot12=0.d0
      else if (thetaprime.gt.theta0+eps) then
c        write(*,*)'In slab!'
         vx=v0*sin(theta0)
         vy=v0*cos(theta0)
         speed=dsqrt(vx**2.d0+vy**2.d0)
         stream=0.d0
         edot12=0.d0
      else
c
c Here is Batchelor's solution for the problem:
c
       theta=theta0-thetaprime

       factor=v0/(theta0**2.d0-sin(theta0)**2.d0)

       ftheta=-theta0**2.d0*sin(theta)+
     +         (theta0-sin(theta0)*cos(theta0))*theta*sin(theta)+
     +         sin(theta0)**2.d0*theta*cos(theta)
       ftheta=factor*ftheta

       dfdtheta=-theta0**2.d0*cos(theta)+
     +  (theta0-sin(theta0)*cos(theta0))*
     *    (sin(theta)+theta*cos(theta))+
     +  sin(theta0)**2.d0*(cos(theta)-theta*sin(theta))
       dfdtheta=factor*dfdtheta
       vr=dfdtheta
       vtheta=-ftheta
c       write(*,'(''theta,vr,vtheta: '',3f12.5)')
c    v    theta,vr,vtheta
c
c Perform the transformation from polar coordinates back to
c cartesian coordinates.
c
       vx= vr*cos(theta0-theta)+vtheta*sin(theta0-theta)
       vy= vr*sin(theta0-theta)-vtheta*cos(theta0-theta)

c
c Speed at nodal point:
c
       speed=dsqrt(vx**2.d0+vy**2.d0)
c
c Stream function:
c
       stream=rr*ftheta
c
c Divergent component of strain rate: e_dot(1,2):
c
       edot12=theta0**2.d0*sin(theta)+
     +  (theta0-sin(theta0)*cos(theta0))*
     *    (2.d0*cos(theta)-theta*sin(theta))-
     -  sin(theta0)**2.d0*(2d0*sin(theta)+theta*cos(theta))
       edot12=factor*edot12/rr
c
      endif
c
      return
      end
