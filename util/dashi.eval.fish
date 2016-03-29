
function dashi.eval \
  -d "Shortcut dashi namespaced methods" \
  -a method

  if functions -q "dashi."(echo $method | sed 's/\s.*$//')
    eval "dashi.$method"
  else
    eval $method
  end

  return $status
end
