#! /bin/bash
#
# Changes every filename in working directory to all lowercase.
#
# Inspired by a script of john dubois,
# which was translated into into bash by Chet Ramey,
# and considerably simplified by Mendel Cooper, author of this document.


for filename in *  #Traverse all files in directory.
do
   fname=`basename $filename`
   n=`echo $fname | tr A-Z a-z`  #Change name to lowercase.
   if [ "$fname" != "$n" ]  # Rename only files not already lowercase.
   then
     mv $fname $n
   fi  
done   

exit 0


# Code below this line will not execute because of "exit".
#--------------------------------------------------------#
# To run it, delete script above line.

# The above script will not work on filenames containing blanks or newlines.

# Stephane Chazelas therefore suggests the following alternative:


for filename in *
# Not necessary to use basename, since "*" won't return any file containing /
do n=`echo "$filename/" | tr '[:upper:]' '[:lower:]'`
#                    Slash added so that trailing newlines are not
#                    removed by command substitution.
   # Variable substitution:
   n=${n%/}   #Removes trailing slash, added above, from filename.
   [[ $filename == $n ]] || mv "$filename" "$n"
   # Checks if filename already lowercase.
done

exit 0
