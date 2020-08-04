c$$$  Assumes the r function has been set using ftest::save_rfun
      subroutine fcallr(n, y, z, w, res)
      integer n
      double precision y(n), z(n), w(n), res
c$$$      call intpr1('N is', -1,  n)
c$$$      call dblepr('y is', -1,  y, 10)
c$$$      call dblepr('z is', -1,  z, 10)
c$$$      call dblepr('w is', -1,  w, 10)
      call rfcall(n, y, z, w, res)
      return
      end
      
