#!/bin/bash

function mod_to_git () {
	if [ -d .git ]; then
		git ls-files --modified | xargs git add
	else
		echo "not a git repo!!!"
	fi
}
