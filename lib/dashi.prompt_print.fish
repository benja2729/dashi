
function dashi.test \
  -d "Test abstraction for prompt templating (don't use)"

  dashi.eval $argv; set -gx __dashi_prompt_status $status
  return $__dashi_prompt_status
end

function dashi::prompt_print.segment \
  -d "Evaluate a line from the prompt config"
  # -a format -a methods

  set -l params $argv[1]
  set -l methods $argv[2..-1]

  for method in $methods
    dashi.regex.test '^!!$' $method; and break

    if dashi.regex.test '^\?' $method
      set method (echo $method | sed 's/^\?//')
      if test $__dashi_prompt_status -gt 0; continue
      else; dashi.regex.test '^$' $method; and break; end
    end

    if dashi.regex.test '^\:' $method
      set method (echo $method | sed 's/^\://')
      if test $__dashi_prompt_status -eq 0; continue
      else; dashi.regex.test '^$' $method; and break; end
    end

    set params $params (dashi.eval $method)
  end

  printf $params
end

function dashi.prompt_print \
  -d "Evaluate passed prompt from config" \
  -a section

  set -l fullname "__dashi_$section"

  # if not set -q $fullname
  #   set -gx $fullname (dashi.config.section $section)
  # end
  set -gx $fullname (dashi.config.section $section)

  set -gx __dashi_prompt_status 0
  for segment in $$fullname
    dashi::prompt_print.segment (echo $segment | dashi.gawk config.parse_prompt_segment)
  end
  set -e __dashi_prompt_status

end
