
function dashi.prompt_segment \
  -d 'Start a prompt segment' \
  -a delimiter # -a colors

  set -l bg $argv[1]
  set -e argv[1]
  set -l fg $argv[1]
  set -e argv[1]

  set_color -b $bg
  set_color $fg $argv
  if [ "$__bobthefish_current_bg" = 'NONE' ]
    # If there's no background, just start one
    echo -n ' '
  else
    # If there's already a background...
    if [ "$bg" = "$__bobthefish_current_bg" ]
      # and it's the same color, draw a separator
      echo -n "$__bobthefish_right_arrow_glyph "
    else
      # otherwise, draw the end of the previous segment and the start of the next
      set_color $__bobthefish_current_bg
      echo -n "$__bobthefish_right_black_arrow_glyph "
      set_color $fg $argv
    end
  end
  set __bobthefish_current_bg $bg
end
