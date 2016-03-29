
function dashi::config.print_settings -a section
  set -l targetfile $DASHI_PATH/config/settings
  dashi.config.section $targetfile $section | sed -e "s/\s/\t/g"
end

function dashi.config -d "Display config settings"
  switch $argv[1]
    case '*'
      dashi::config.print_settings $argv[1]
  end
end
