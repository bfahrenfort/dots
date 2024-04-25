# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function translate_status {
  local s=$(echo $?)
  local ground="%{$reset_color%}%B⏚%b"
  # local s=$'%?'
  if [[ $s == 0 ]]; then
    echo $ground
    return
  fi
  echo "╰─%F{red}$s%f"
}

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

FINAL=$'%B%F{red}›%f%F{green}›%f%F{yellow}›%f%b' 

function prompt_char {
  echo "$FINAL"
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

function single_status_line {
  local ruby_env='$(ruby_prompt_info)'
  local git_info='$(git_prompt_info)'

  if [[ -z $(git_prompt_info) && -z $(ruby_prompt_info) && -z $(virtualenv_prompt_info) ]] then
    return
  fi

  echo -n "─$git_info"
  if [[ ! -z $(git_prompt_info) && ! -z $(ruby_prompt_info) ]]; then
    echo -n "╟"
  fi
  echo -n $ruby_env
  echo "║"
}

function status_line {
  local ruby_env='$(ruby_prompt_info)'
  local git_info='$(git_prompt_info)'

  local none="╮"
  if [[ -z $(git_prompt_info) && -z $(ruby_prompt_info) && -z $(virtualenv_prompt_info) ]] then
    echo $none
    return
  fi

  echo -n "┬$git_info"
  if [[ ! -z $(git_prompt_info) && ! -z $(ruby_prompt_info) ]]; then
    echo -n "╟"
  fi
  echo -n $ruby_env
  echo "║"
}

local prompt_char='$(prompt_char)'

precmd () {
  s=$(translate_status)
  local left="╭─${FG[039]}%n %B${FG[015]}at%b ${FG[141]}$(box_name) %B${FG[015]}in%b %B${FG[153]}%~%b"
  PROMPT="$left $(single_status_line)
╰─${prompt_char}%{$reset_color%} "

# Alternate, four-line prompt
#   PROMPT="$left
# ├$(status_line)
# │$s
# ╰─${prompt_char}%{$reset_color%} "

}

ZSH_THEME_GIT_PROMPT_PREFIX="─╢  ${FG[242]}on "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[202]}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[040]}✔"

ZSH_THEME_RUBY_PROMPT_PREFIX="─╢  ${FG[239]}using${FG[243]} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%} "
