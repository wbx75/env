#!/bin/bash

ENV_LOCATION=$(pwd)

ln -s $ENV_LOCATION/.bashrc $HOME/.bashrc
ln -s $ENV_LOCATION/.bash_profile $HOME/.bash_profile
ln -s $ENV_LOCATION/.bash_logout $HOME/.bash_logout
ln -s $ENV_LOCATION/.vim $HOME/.vim

