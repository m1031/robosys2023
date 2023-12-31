#!/bin/bash -xv
# SPDX-FileCopyrightText: 2023 Mahiro Yamoto
# SPDX-License-Identifier: BSD-3-Clause
ng () {
      echo NG at Line $1
      res=1
}
res=0
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng ${LINENO}
out=$(seq 3 | ./plus)
[ "${out}" = 6 ] || ng ${LINENO}
out=$(echo あ| ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
out=$(echo a | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
out=$(echo| ./plus) #空文字
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}
[ "$res" = 0 ] && echo OK
exit $res
