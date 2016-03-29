{
  match($0, / [0-9a-zA-Z]{2} [0-9a-zA-Z]{2} [0-9a-zA-Z]{2} [0-9a-zA-Z]{2}/)
  hex = substr($0, RSTART, RLENGTH)
  gsub( / /, "\\x", hex)
  print(hex)
  exit
}
