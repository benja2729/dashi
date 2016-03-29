
/^ *["']/ {
  template  = gensub( /^["'](.+)["']/, "\\1", 1, $0)
  formatted = gensub( /{{([^{}]+)}}/, "%s", "g", template)
  print(formatted)

  split(template, method_arr, /{{|}}/)
  for(idx in method_arr) {
    method = method_arr[idx]
    if (idx % 2 != 0) { continue }
    print(method)
  }
}

/^ *\w/ {
  print("%s")
  print($0)
}
