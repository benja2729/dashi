
function dashi.regex.test \
  -d "Test presence of regex in string" \
  -a regex -a string

  echo $string | grep -q -E $regex
  return $status
end
