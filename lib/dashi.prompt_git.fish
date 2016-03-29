
function dashi.prompt_git -d "Slightly altered __fish_git_prompt"
  set -l base (__fish_git_prompt | tr -d '()')
  echo -nes \uE0A0$base
end
