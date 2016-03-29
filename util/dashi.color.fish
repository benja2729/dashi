
function dashi.color \
  -d "Fetch named color" \
  -a name

  set -l fullname "__dashi_colors_$name"

  # Return cached global color
  if set -q $fullname
    echo -n $$fullname
    return 0
  end

  # Default to using fish default colors
  if contains $name (set_color -c)
    echo $name
    return 0
  end

  set -l colors (dashi.config.section colors)
  for color in $colors
    # Convert list to array
    set color (echo $color | sed -e "s/\s*\:\s*/\n/g")

    if test $name = $color[1]
      # Cache color on a global variable
      set -gx $fullname $color[2]
      echo -n $$fullname
      return 0
    end
  end

  return 1
end
