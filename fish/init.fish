#//-------------------------------------------------
#// greetings, motd, et al..
#//-------------------------------------------------

#// fish greeting
function fish_greeting --description 'Set fish greeting'
  #//clear
  set_color -o cyan
  echo -en 'This is FISH '
  set_color -o red
  echo -e $FISH_VERSION
  set_color normal
  echo ' '
  echo -en ;date
  echo -en ;uptime
  echo ' '
  if type -q $fortune
    echo -en ;fortune
    echo ' '
  end
end

#// custom sources
source $custom_home/custom/export.fish
source $custom_home/custom/aliases.fish
source $custom_home/custom/utils.fish
