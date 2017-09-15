#!/bin/bash
# -*- encoding: utf-8 -*-
# Author: Olivier Dalle

# Retrieve on GH a list of projects matching string given as param,
# in the given organization
# Assumes the environment variable GH_TOKEN contains the user's GH
# API token 

ORG=DeptInfoProjects

# Where the GH token is stored 
GH_TOKEN_FILE=$HOME/dev/GitHubApi/access_token.txt

if [ -f ${GH_TOKEN_FILE} ]
then
    GH_TOKEN=${GH_TOKEN:-`cat ${GH_TOKEN_FILE}`}
fi


if [ "x$1" != "x" ]
then
    curl -i -s  -H "Authorization: token $GH_TOKEN" https://api.github.com/orgs/${ORG}/repos | grep '["]ssh_url["]' | grep $1 | awk '{print $2}' | tr -d '",'
else
    curl -i -s  -H "Authorization: token $GH_TOKEN" https://api.github.com/orgs/${ORG}/repos | grep '["]ssh_url["]' | awk '{print $2}' | tr -d '",'
fi
