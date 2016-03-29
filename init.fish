
function init -a path --on-event init_dashi
  autoload $path/lib $path/util $path/cli

  set -gx DASHI_PATH $path
  set -gx DASHI_CONFIG (omf.xdg.config_home)/dashi
end

# function init.update_bind_mode --on-variable fish_bind_mode
#   switch $fish_bind_mode

#     case default
#       set -gx __dashi_colors_vi_mode_bg $__bobthefish_med_grey
#       set -gx __dashi_colors_vi_mode_fg $__bobthefish_dk_grey

#     case insert
#       set -gx __dashi_colors_vi_mode_bg $__bobthefish_lt_green
#       set -gx __dashi_colors_vi_mode_fg $__bobthefish_dk_grey

#     case visual
#       set -gx __dashi_colors_vi_mode_bg $fish_color_selection
#       set -gx __dashi_colors_vi_mode_fg normal
#   end
# end
