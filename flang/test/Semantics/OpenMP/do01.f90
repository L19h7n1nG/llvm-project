! UNSUPPORTED: system-windows
! Marking as unsupported due to suspected long runtime on Windows
! RUN: %python %S/../test_errors.py %s %flang -fopenmp
! OpenMP Version 4.5
! 2.7.1 Loop Construct
! The loop iteration variable may not appear in a firstprivate directive.

program omp_do
  integer i, j, k

  !ERROR: DO iteration variable i is not allowed in FIRSTPRIVATE clause.
  !$omp do firstprivate(k,i)
  do i = 1, 10
    do j = 1, 10
      print *, "Hello"
    end do
  end do
  !$omp end do

end program omp_do
