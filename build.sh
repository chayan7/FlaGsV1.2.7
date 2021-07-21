#!/bin/sh

unset DYLD_LIBRARY_PATH
if ! echo "$0" | grep '\.sh$' > /dev/null; then
    printf 'Please run using "bash" or "sh", but not "." or "source"\\n' >&2
    return 1
fi


conv="$(conda -V 2>&1)"
printf "$conv"
condaExec="$(echo "$conv" | grep 'not' >&1)"


if [ "$condaExec" != "" ];then
	printf "\\nPlease install Conda properly and run this again, Thanks. \\n"
  exit 2
fi
if [ "$condaExec" = "" ];then
	printf "\\nAdding FlaGs environment with all dependencies. \\n"
fi



THIS_DIR=$(DIRNAME=$(dirname "$0"); cd "$DIRNAME"; pwd)
THIS_FILE=$(basename "$0")
THIS_PATH="$THIS_DIR/$THIS_FILE"
ENV_PATH="$THIS_DIR/env"
MAC_FILE="$ENV_PATH/eFlaGs.txt"
LIN_FILE="$ENV_PATH/elinFlaGs.txt"

if [ "$(uname)" = "Linux" ];then
	conda create --name eFlaGs -f --file "$LIN_FILE"
	printf "\\nPlease type the following command from any terminal to activate FlaGs environment and run:\\n"
	printf ">> conda activate eFlaGs\\n"
	printf "\\nTo deactivate please type:\\n"
	printf ">> conda deactivate\\n"
	printf "\\n"
fi
if [ "$(uname)" = "Darwin" ]; then
	conda create --name eFlaGs -f --file "$MAC_FILE"
	printf "\\nPlease type the following command from any terminal to activate FlaGs environment and run:\\n"
	printf ">> conda activate eFlaGs\\n"
	printf "\\nTo deactivate please type:\\n"
	printf ">> conda deactivate\\n"
	printf "\\n"
fi

printf "One can run FlaGs by activating eFlaGs environment from any terminal.\\n"
printf "\\nInstallation complete, Thanks. \\n"
exit 2
