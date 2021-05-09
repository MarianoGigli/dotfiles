### Dotfiles
Personal dotfiles with the current configuration files for my window manager, bash, nvim, vim, terminal emulator and some extra common configs.  
The repo that can be cloned and setup following the instruction bellow.

#### Dependencies
You must have [__make__](https://www.gnu.org/software/make/) and [__stow__](https://www.gnu.org/software/stow/) installed.

#### Usage
`make <<target>>`  

Targets:  
  - __help__   Show this help.  
  - __check__  run stow in dry run mode to validate actions.  
  - __create__ create symlinks using stow.  
  - __update__ delete and create symlinks using stow.  
