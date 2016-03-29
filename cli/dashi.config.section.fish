
function dashi.config.section \
  -d "Fetch named section of the config" \
  -a section

  set -l target $DASHI_PATH/config/settings
  dashi.gawk config_section -v section=$section $target
end
