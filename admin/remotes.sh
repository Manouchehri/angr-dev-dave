#!/bin/bash -e

# on github
GITHUB_REPOS="
angr/claripy
angr/tracer
angr/simuvex
angr/pyvex
angr/angr-management
angr/angr-dev
angr/angr-doc
angr/vex
angr/angr
angr/binaries
angr/archinfo
angr/angr.github.io
Manouchehri/cle
angr/identifier
angr/wheels
angr/fidget
shellphish/driller
shellphish/fuzzer
shellphish/rex
shellphish/patcherex
shellphish/shellphish-qemu
shellphish/shellphish-afl
shellphish/driller-afl
shellphish/afl-other-arch
mechaphish/colorguard
mechaphish/meister
mechaphish/cgrex
mechaphish/compilerex
mechaphish/network_dude
mechaphish/scriba
mechaphish/povism
mechaphish/path_performance
mechaphish/common-utils
mechaphish/ambassador
mechaphish/vm-workers
mechaphish/network_poll_creator
mechaphish/worker
mechaphish/multiafl
mechaphish/simulator
mechaphish/farnsworth
mechaphish/pov_fuzzing
mechaphish/qemu-cgc
salls/angrop
zardus/mulpyplexer
zardus/cooldict
"

GITLAB_REPOS="
angr/claripy
angr/tracer
angr/simuvex
angr/pyvex
angr/angr-management
angr/angr-dev
angr/angr-doc
angr/vex
angr/angr
angr/binaries
angr/archinfo
angr/angr.github.io
Manouchehri/cle
angr/identifier
angr/wheels
angr/fidget
cgc/driller
cgc/fuzzer
cgc/rex
cgc/patcherex
cgc/shellphish-qemu
cgc/shellphish-afl
cgc/driller-afl
cgc/afl-other-arch
cgc/colorguard
cgc/meister
cgc/cgrex
cgc/compilerex
cgc/network_dude
cgc/scriba
cgc/povism
cgc/path_performance
cgc/common-utils
cgc/ambassador
cgc/vm-workers
cgc/network_poll_creator
cgc/worker
cgc/multiafl
cgc/simulator
cgc/farnsworth
cgc/pov_fuzzing
cgc/qemu-cgc
angr/angrop
"

function add_remotes
{
	name=$1
	base_url=$2
	repos=$3

	for repo in $repos
	do
		dir=$(basename $repo)
		if [ ! -e $dir ]
		then
			echo "DNE: $repo"
			continue
		fi

		cd $dir
		git remote | grep -q $name && cd .. && continue
		git remote add $name $base_url$repo
		git fetch $name
		cd ..
	done
}

add_remotes github git@github.com: "$GITHUB_REPOS"
add_remotes gitlab git@git.seclab.cs.ucsb.edu: "$GITLAB_REPOS"
