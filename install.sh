#!/usr/bin/env bash

QMK_CONFIG_PATH="$HOME/.config/qmk/qmk.ini"
QMK_HOME=$(sed -nr "/^\[user\]/ { :l /^qmk_home[ ]*=/ { s/[^=]*=[ ]*//; p; q;}; n; b l;}" $QMK_CONFIG_PATH)
GITHUB_USERNAME="worldunseen"

function link_keymap {
    echo "Linking $1 layout to QMK firmware repo"
    ln -s $(pwd)/$1 $QMK_HOME/keyboards/$1/keymaps/$GITHUB_USERNAME
}

if [ ! -f $QMK_CONFIG_PATH ]; then
    echo "qmk.ini config file not found!"
    exit -1
fi

link_keymap planck
