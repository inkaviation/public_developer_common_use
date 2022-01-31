#!/bin/bash
DEVELOPER_COMMON_USE_SCRIPTS_PATH="$HOME/developer_common_use_scripts"
ON_BASHRC_SCRIPT='on_bashrc.sh'
BASHRC_PATH="$HOME/.bashrc"

if [ ! -d "$DEVELOPER_COMMON_USE_SCRIPTS_PATH/.git" ]; then
  echo "Cloning developer_common_use_scripts repository"
  git -C $HOME clone git@github.com:inkaviation/developer_common_use_scripts.git
fi

if [ -f "$DEVELOPER_COMMON_USE_SCRIPTS_PATH/$ON_BASHRC_SCRIPT" ]; then
  grep "$ON_BASHRC_SCRIPT" $BASHRC_PATH
  if [ $? -eq 1 ]; then
    echo "Adding $ON_BASHRC_SCRIPT on $BASHRC_PATH"
    echo "source $DEVELOPER_COMMON_USE_SCRIPTS_PATH/$ON_BASHRC_SCRIPT" >> $BASHRC_PATH
    echo "Executing for first time"
    source $DEVELOPER_COMMON_USE_SCRIPTS_PATH/$ON_BASHRC_SCRIPT
  fi
fi