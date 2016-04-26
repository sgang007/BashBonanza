#!/bin/bash

find $1 -type f -printf '%T@ %p\n' | sort -n | head -5 | cut -f2- -d" " | sed -e 's,^./,,' | xargs gvfs-trash
