invoke-elevated{
  new-junction ~\.vim ..\.vim\
  new-junction ~\WindowsPowerShell\ ..\

  new-symlink ~\.vimrc ../.vimrc
  new-symlink ~\.gitconfig ../.gitconfig
  new-symlink ~\.gitignore ../.gitignore
}
