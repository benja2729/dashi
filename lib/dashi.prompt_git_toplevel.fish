
function dashi.prompt_git_toplevel -d "Print top-level path of current git repo"
  command git rev-parse --show-toplevel ^/dev/null
end
