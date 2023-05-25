USER=$(whoami)
SCRIPT_PATH=/home/$USER/scripts

for script in $(find $SCRIPT_PATH -type f -name "*.sh")
do
	. "$script"
done

# neovim as defaut cscope editor
export CSCOPE_EDITOR=nvim