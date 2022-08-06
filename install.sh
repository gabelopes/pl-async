$LIBRARY_NAME="async.pl"
$PROLOG_COMMAND="swipl"
$PROLOG_PATH=$(dirname $(which $PROLOG_COMMAND))
$PROLOG_LIBRARY_PATH="$(dirname $PROLOG_PATH)/library"
$SCRIPT_PATH=$(dirname $(which $0))
$LIBRARY_PATH="$SCRIPT_PATH/$LIBRARY_NAME"
$DESTINATION_PATH="$PROLOG_LIBRARY_PATH/$LIBRARY_NAME"

if [ ! -f "$DESTINATION_PATH" -o $1 = "--force" ]
then
  cp -f $LIBRARY_PATH $DESTINATION_PATH
else
  echo "File with name '$LIBRARY_NAME' already exists in '$PROLOG_LIBRARY_PATH'. If you would like to overwrite it, run this script with --force parameter."
fi