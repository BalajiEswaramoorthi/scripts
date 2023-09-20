USER=$(whoami)
SCRIPT_PATH=/home/$USER/scripts

for script in $(find $SCRIPT_PATH -type f -name "*.sh")
do
	. "$script"
done

# neovim as defaut cscope editor
if command -v nvim &> /dev/null
then
	export CSCOPE_EDITOR=nvim
else
	echo ""
fi
