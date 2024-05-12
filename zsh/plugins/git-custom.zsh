_update_references() {
  local base_branch="${1:=main}"
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  shift

  if [ "$current_branch" = "$base_branch" ]
  then
    echo "Cannot update base branch from itself."
    return 1
  fi

  echo "Updating base branch: $base_branch"
  $("git stash")
  $("git checkout $base_branch")
  $("git pull")
  $("git checkout $current_branch")

  echo "Updating $current_branch references"
  $("git rebase $base_branch $current_branch --update-refs --interactive")

  echo "Restoring stash"
  $("git stash pop")
}

alias git-update-refs="_update_references"
