

echo"#PATH
PATH='$PATH:/Users/$USER/piscina42Nov22/utils:/Users/$USER/shell_scripts'
export PATH

#FPATH
FPATH='$FPATH:/Users/$USER/shell_scripts/FuntionsShell'
export FPATH

#Promp
#PS1='%n@%m %1~ %#'

#Alias
alias wmi='whoami'
# If install coreutils 'brew install coreutils'
# alias l='gls --color -lhF --group-directories-first'


# Alias accepting parametres: The alias gc build a funtion that execute the gcc
# command with some fixed parameters and one open used to add the name of the c
# file. 
alias gc='funtion compiler() { gcc -Wall -Werror -Wextra "$1" && ./a.out }; compiler'
#Alias norminette
alias n='norminette -R CheckForbiddenSourceHeader'
#Alias Delete DS_Store files in /HOME
alias ds='find ~/ -type f -name ".DS_Store" -print -delete'

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

#export PS1=$'\033[36m%n\033[m@\033[32m%m:\033[33;1m%~\033[m\$'
#PROMPT='%F{green}%*%f:%F{blue}%~%f %% '
setopt prompt_subst
export PS1='%F{105}%n%f%F{7}@%f%F{111}%m%f%F{7}:%f%F{11}%~%f%F{203}$(git_branch_name)%f %F{7}$%f'" >> ~/.bashrc
