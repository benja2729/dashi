
function uninstall::clear_variables
  for name in (set --names | grep '^__dashi')
    set -e $name
  end
end

function uninstall --on-event uninstall_dashi
  uninstall::clear_variables
end

