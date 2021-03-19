#//-------------------------------------------------
#// shell prompt
#//-------------------------------------------------

function fish_prompt --description 'Set command prompt'
  set -l last_status $status

  #// two level PWD
  set -l TLPWD (echo "$PWD" | sed -E "s|.+/(.*)/(.*)|/.../\1/\2|")

  #// prompt delimiter
  set -l delimit ' $ '

  #// construct prompt
  echo -ns (set_color -o green)$USER'@'(hostname)(set_color normal)' ''['(set_color -o blue)$TLPWD(set_color normal)']' (__fish_git_prompt) $delimit
end

#// command color and style
set -gx fish_color_autosuggestion   666
set -gx fish_color_command          normal
set -gx fish_color_comment          -o green
set -gx fish_color_cwd              -o green
set -gx fish_color_cwd_root         -o red
set -gx fish_color_end normal
set -gx fish_color_error            -o red
set -gx fish_color_escape           -o cyan
set -gx fish_color_history_current  -o cyan
set -gx fish_color_param            -o blue
set -gx fish_color_quote            -o cyan
set -gx fish_color_valid_path       -o green

#// fish git prompt
set __fish_git_prompt_showdirtystate        'yes'
set __fish_git_prompt_showstashstate        'yes'
set __fish_git_prompt_showuntrackedfiles    'yes'
set __fish_git_prompt_showupstream          'yes'
set __fish_git_prompt_color_branch          -o cyan
set __fish_git_prompt_color_upstream_ahead  -o green
set __fish_git_prompt_color_upstream_behind -o red

#// status chars
set __fish_git_prompt_char_cleanstate        '✓'
set __fish_git_prompt_char_dirtystate        '*'
set __fish_git_prompt_char_invalidstate      '#'
set __fish_git_prompt_char_stagedstate       '+'
set __fish_git_prompt_char_stashstate        '$'
set __fish_git_prompt_char_stateseparator    ''
set __fish_git_prompt_char_untrackedfiles    '*'
set __fish_git_prompt_char_upstream_ahead    '>' '↑'
set __fish_git_prompt_char_upstream_behind   '<' '↓'
set __fish_git_prompt_char_upstream_diverged '<>'
set __fish_git_prompt_char_upstream_equal    ''
set __fish_git_prompt_char_upstream_prefix   ''
