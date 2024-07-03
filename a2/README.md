                                                         dupe.sh README.md
                                                         

1. PURPOSE: Command dupe.sh is a shell script which searches for duplicate text files in the user input directory. After conducting a thorough search of the files present in the directory and its subdirectories, any duplicate files are brought to the notice of the user and are deleted only if the user agrees to it.

2. USECASES: Duplicate files can prove to be cumbersome especially when dealing with vast quantites of data. User errors may also lead to multiple files having the same name which will require excessive quantities of time to rifle thorugh manually when text files are thousands of lines long.This command is useful to declutter and remove replicates in a specific directory. Dupe.sh reduces grunt work and saves time by searching through directories containing a vast number of files in seconds for any copies.

3. UTILIZATION: As the directory holding the script has been added to PATH, the script can be run as any regular command by simply typing out dupe.sh in the terminal. Other ways of running this script are typing ./dupe.sh after entering the specific directory housing the script or by using ~/cs131/a2/dupe.sh if user wants to access the command from a different location. In all the above cases, the user will be urged to type in the directory to be checked and then the command runs. In case of using the command ./dupe.sh the directory to be checked must also be present in the same directory as the script.

4. EXAMPLES:

Case 1 - If the user inputs the wrong directory when prompted the command throws an error message and stops running. The terminal output of a this situation has been pasted below.

[shwethalsu24@sjsu a2]$ ~/cs131/a2/dupe.sh

Enter directory to search for duplicate files:

checkdirectory

The directory asked for doesn't exist.

Case 2 - If there are no duplicates in the input directory the output is as following.

[shwethalsu24@sjsu cs131]$ dupe.sh

Enter directory to search for duplicate files:

trial

Duplicates check completed.

Case 3 - If there are any duplicates, the terminal output is pasted below. The command retains or removes files based on user's choice of either y or n.

[shwethalsu24@sjsu a2]$ ./dupe.sh

Enter directory to search for duplicate files:

test

Duplicate file found: /mnt/scratch/shwethalsu24/cs131/a2/test/test2/r.txt (Original file: /mnt/scratch/shwethalsu24/cs131/a2/test/q.txt)

Do you want to delete the duplicate file? (y/n):

n

Skipped file: /mnt/scratch/shwethalsu24/cs131/a2/test/test2/r.txt

Duplicates check completed.

5. IMPROVEMENTS: Presently, this script is compatible with .txt files. Future work involves incorporating other formats of files like .csv files if possible.
