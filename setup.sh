#!/usr/bin/env sh

TEMP_DIR=$(mktemp -d -q || exit 1)

echo "creating $TEMP_DIR"

mkdir "$TEMP_DIR/share"
mkdir "$TEMP_DIR/state"

git clone --depth 1 https://github.com/wbthomason/packer.nvim "$TEMP_DIR/share/nvim/site/pack/packer/start/packer.nvim"

env XDG_CONFIG_HOME=$(pwd) XDG_DATA_HOME="$TEMP_DIR/share" XDG_STATE_HOME="$TEMP_DIR/state" nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
env XDG_CONFIG_HOME=$(pwd) XDG_DATA_HOME="$TEMP_DIR/share" XDG_STATE_HOME="$TEMP_DIR/state" nvim

echo "\n"
echo "to remove the temp directory created for this recreation, run 'sudo rm -r $TEMP_DIR'"

echo "to re-open nvim, run 'env XDG_CONFIG_HOME=$(pwd) XDG_DATA_HOME=$TEMP_DIR/share XDG_STATE_HOME=$TEMP_DIR/state nvim'"
