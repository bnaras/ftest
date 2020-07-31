cccc  Assumes the r function has been set!
      subroutine frcall(n, y, z, w, res)
      integer n
      double precision y(n), z(n), w(n), res
      call intpr1('N is', -1,  n)
      call dblepr('y is', -1,  y, 10)
      call dblepr('z is', -1,  z, 10)
      call dblepr('w is', -1,  w, 10)
      call rfcall(n, y, z, w, res)
      return
      end
      
