
function dashi.unicode2hex -a unicode \
  -d "Convert unicode character to hex string"

  echo $unicode | hexdump | dashi.awk unicode2hex
end
