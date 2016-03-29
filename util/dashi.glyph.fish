
function dashi.glyph \
  -d "Render named glyph" \
  -a name

  set -l fullname "__dashi_glyphs_$name"

  # Return cached global glyph
  if set -q $fullname
    echo -ne $$fullname
    return 0
  end

  set -l glyphs (dashi.config.section glyphs)
  for glyph in $glyphs
    # Convert list to array
    set glyph (echo $glyph | sed -e "s/\s*\:\s*/\n/g")

    if test $name = $glyph[1]
      # Cache glyph on a global variable
      # Run through eval so unicode is interpreted properly
      eval "set -gx $fullname $glyph[2]"
      echo -ne $$fullname
      return 0
    end
  end

  return 1
end
