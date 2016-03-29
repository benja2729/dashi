BEGIN {
  visited = 0
}

{ sub( /^[[:space:]]+/, "") }
!NF || /^\#/ { next }

/^\[.+\]/ {
  if(visited == 1) {
    visited = 0
    exit
  }

  sect = gensub( /[[:space:]\[\]]*/, "", "g")
  if(sect ~ section) {
    visited = 1
    next
  }
}

visited == 1 { print }
