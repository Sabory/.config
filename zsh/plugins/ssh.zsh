_change_ssh_profile() {
  local arg=$1
  shift

  case "$arg" in
    personal) profile="personal_gh";;
    fintual) profile="fintual_gh";;
  esac

  if [ -z "$profile" ]; then
    echo "Profile '$arg' do not exist... Elegible profiles: 'personal' | 'fintual'"

    return 1 
  fi

  $(ssh-add -D)
  $(ssh -T $profile)
}

alias change-ssh-profile="_change_ssh_profile"
