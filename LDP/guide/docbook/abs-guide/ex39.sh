#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: `basename $0` find-string"
  exit 65
fi

echo "Updating 'locate' database..."
echo "This may take a while."
updatedb /usr &
# Must be run as root.

wait
# Don't run the rest of the script until 'updatedb' finished.
# You want the the database updated before looking up the file name.

locate $1

# Lacking the wait command, in the worse case scenario,
# the script would exit while 'updatedb' was still running,
# leaving it as an orphan process.

exit 0
