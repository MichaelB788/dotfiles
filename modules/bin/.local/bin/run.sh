#!/bin/bash

should_build="${1:--n}"
exe="path/to/exe"
input="path/to/input"

if [[ "${should_build}" == "-b" ]]; then
  (cd build && ninja)
fi

./"${exe}" "${input}"
