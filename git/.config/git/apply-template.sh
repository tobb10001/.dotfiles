#!/usr/bin/env bash

find ~/git -type d -name .git -print0 | xargs -0 dirname -z | xargs -0 -I% -n 1 git -C % init
