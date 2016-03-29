
function dashi.prompt_git_root -d "Print root folder of current git repo"
  basename (dashi.prompt_git_toplevel) ^/dev/null
end
