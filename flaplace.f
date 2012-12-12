c File flaplace.f
c Build with:
c   f2py -c --fcompiler=gnu95 flaplace.f -m flaplace
c
      subroutine timestep(u,n,m,dx2,dy2)
      double precision u(n,m)
      double precision dx2,dy2,dnr_inv,error
      integer n,m,i,j
cf2py intent(in) :: dx2,dy2
cf2py intent(in, out) :: u
cf2py intent(out) :: error
cf2py intent(hide) :: n,m
      dnr_inv = 0.5d0 / (dx2+dy2)
      do 200,j=2,m-1
         do 100,i=2,n-1
            u(i,j) = ((u(i-1,j) + u(i+1,j))*dy2+
     &           (u(i,j-1) + u(i,j+1))*dx2)*dnr_inv
 100        continue
 200     continue
      error = 0.0
      end
