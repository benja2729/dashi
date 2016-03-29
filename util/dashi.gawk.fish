
function dashi::gawkfile -a name
  echo $DASHI_PATH/util/awkfiles/$name.awk
end

function dashi.gawk -d "Dashi-specific abstraction to awk"
  set argv[1] (dashi::gawkfile $argv[1])
  gawk -f $argv
end
