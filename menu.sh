read -p "What is your name? " name

choice=""
option=""

while [[ $choice != "1" && $choice != "2" ]]
do
  printf "Welcome, $name!\nPlease choose an option:\n 1. Continue with the application\n 2. Exit\n"
  read choice

    case "$choice" in
    1) echo "You've chosen to continue!"
    ;;
    2) echo "Goodbye!" 
       exit
    ;;
    *) echo "Invalid choice! Please try again."
    ;;
    esac
done

while [[ $option != "4" && $option != "e" && $option != "E" ]]
do
  echo "Please select from one of the following tasks:"
  printf "
  1/t/T. Find the triangular numbers that are within a range specified by the user and print only the even ones.\n
  2/p/P. Find all the numbers that can be written as the product of two nonnegative even integers
     in succession and print them in increasing order\n 
  3/q/Q. Find the terms of a sequence given by the rule Term = an(sq) + bn + c, where a and b and c are integers specified by the user and n 
     is a positive integer\n 
  4/e/E. Exit\n"
  read option

    case "$option" in
    1|t|T) echo "Task 1 selected"
    ;;
    2|p|P) echo "Task 2 selected"
    ;;
    3|q|Q) echo "Task 3 selected"
    ;;
    4|e|E) echo "Goodbye!" 
       exit
    ;;
    *) echo "Invalid choice! Please try again."
    ;;
    esac


done
