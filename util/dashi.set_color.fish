
function dashi.set_color \
  -d "Abstraction to include presets"

  set -l params

  for arg in $argv
    switch $arg
      case '--background=*'
        set params $params '-b'
        set arg (echo $arg | sed -e 's/^.*\=//')
        set params $params (dashi.color $arg)
        continue
      case '-*'
        set params $params $arg
      case '*'
        set params $params (dashi.color $arg)
      end
  end

  set_color $params
end
