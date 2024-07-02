#!/bin/bash

echo "Enter directory to search for duplicate files:"
read dir

if [ ! -d "$dir" ]; then
   echo "The directory asked for doesn't exist."
   exit 1
fi

#function to find all files in the given directory and its subdirectories
find_file(){
    dirvar="$1"
    find "$dirvar" -type f -print0 | xargs -0 realpath
}

#function to compare any two files
compare(){
   file1="$1"
   file2="$2"
   diff "$file1" "$file2" > /dev/null
}

#function to ask user for deletion
ask_delete(){
      dupe="$1"
      org="$2"
      echo "Duplicate file found: $dupe (Original file: $org)"
      echo "Do you want to delete the duplicate file? (y/n):"
      read user_choice
      case "$user_choice" in y | Y )
	   rm "$dupe"
	   echo "Deleted file: $dupe"
	   ;;
	 * )
           echo "Skipped file: $dupe"
	   ;;
      esac
}

files=$(find_file "$dir")

#list of file paths to array of file contents
IFS=$'\n' read -rd '' -a file_list <<< "$files"

for ((a = 0; a < ${#file_list[@]}; a++)); do
  for ((b = a + 1; b < ${#file_list[@]}; b++)); do
      if compare "${file_list[a]}" "${file_list[b]}"; then
	   ask_delete "${file_list[b]}" "${file_list[a]}"
	   if [ ! -e "${file_list[b]}" ]; then
		  unset file_list[j]
           fi
      fi
  done
done

echo "Duplicates check completed."

exit 0

