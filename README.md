### Dotfiles
Personal dotfiles meant to be used with stow to install all of them.
#### Instalation
* `$sh stow-test.sh`
review the output to ensure that everything will work as expected. This script runs with `-nvv` options so no changes will be applied.

* `$sh stow -v <package-name>`
This command will install the package (create symblink for every file inside the given package)
For more information and usage options read `$man stow` and visit the website [GNU stow](https://www.gnu.org/software/stow/)
