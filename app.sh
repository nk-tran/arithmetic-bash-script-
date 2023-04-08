#Menu prompts user to choose available tasks
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
    2) echo "Goodbye, $name!" 
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
  1/t/T. Find the triangular numbers that are within a range specified and print only the even ones.\n
  2/p/P. Find all the numbers that can be written as the product of two nonnegative even integers
         in succession and print them in increasing order.\n 
  3/q/Q. Find the terms of a sequence given by the rule Term = an(sq) + bn + c, where a and b and c are integers and n 
         is a positive integer.\n 
  4/e/E. Exit.\n"
  read option

    case "$option" in
############################################TASK 1#####################################################################################
    1|t|T) 
      clear
      echo "Task 1 selected."
      echo "Find the triangular numbers that are within a range specified and print only the even ones."
      echo "------------------------------------------------------------------------------------------------------"
      echo "Please choose 2 numbers to find the trianglular numbers within the range"

      #Gets starting and ending points from user & verifies if inputs are valid
      read -p "Please enter your starting number: " startVal
      while [[ $startVal -le 0 || -z "$startVal" ]]
      do
         read -p "Please enter a valid starting number(greater than zero): " startVal
      done

      read -p "Please enter your stopping number: " endVal
      while [[ $endVal -le 0 || -z "$endVal" ]]
      do
         read -p "Please enter a valid starting number(greater than zero): " endVal
      done

      odd=0
      even=0

      #Verifies starting and ending points are valid
      while [ $startVal -gt $endVal ]
      do
      echo "Please make sure your selections are valid. Your starting number must be lower than your ending number"
      read -p "Please enter your starting number: " startVal
      read -p "Please enter your stopping number: " endVal
      done

      clear

      echo "You have selected the starting number: $startVal"
      echo "You have selected the ending number: $endVal"
      echo "These are all the even triangular numbers between $startVal and $endVal:"


      #Finds all triangular numbers and counts how many are even/odd.
      for (( i=1; i <= $endVal; i++ ))
      do
         triNums=$((i * (i + 1) / 2))
            if (( triNums % 2 == 0 && triNums >= startVal && triNums <= endVal ))
            then
               echo "$triNums"
               ((even++))
            fi
            
            if (( triNums % 2 != 0 && triNums >= startVal && triNums <= endVal ))
            then
               ((odd++))
            fi
      done

      echo "number of odd triangular numbers: $odd"
      echo "number of even triangular numbers: $even"

      #Option to go back to main menu or exit
      complete=""
      while [[ $complete != "1" && $complete != "2" ]]
      do
        echo "------------------------------------------------------------------------"
        printf "1)Select another task.\n2)To EXIT.\n"
         read complete

            case "$complete" in
            1) clear
               echo "You've chosen to continue!"
            ;;
            2) echo "Exiting program, goodbye $name!" 
               exit
            ;;
            *) echo "Invalid choice! Please try again."
            ;;
            esac
      done
    ;;
############################################END TASK 1#####################################################################################

############################################## TASK 2#####################################################################################
    2|p|P) 

      clear
      echo "Task 2 selected."
      echo "Find all the numbers that can be written as the product of two nonnegative even integers in succession and print them in  increasing order."
      echo "------------------------------------------------------------------------------------------------------"

      #Prompt and Check for First Valid Input
      num_of_products=-1
      while [[ $num_of_products -le 0 || -z "$num_of_products" ]]
      do
         read -p "How many numbers of product do you want to print? --> " num_of_products
      done

      # Prompt and Check for Second Valid Input
      multiple_of=0
      while ! [[ "$multiple_of" =~ ^[0-9]+$ ]] || (("$multiple_of" == 0)) || [ -z "$multiple_of" ]
      do
         read -p "Enter a number to check multiples of --> " multiple_of
      done

      #Initialize the first two even non-negative integers
      num1=2
      num2=4
      #Calculate product and ouput results
      echo
      printf "Outputs:\n"
      for (( i=0; i<num_of_products; i++ )); do
         product=$((num1 * num2))
         if (( $product % $multiple_of == 0 )); then
            echo "$product is a multiple of $multiple_of"
            echo
         else
            echo "$product is NOT a multiple of $multiple_of"
            echo
         fi
         num1=$((num1 + 2))
         num2=$((num2 + 2))
      done

      #Option to go back to main menu or exit
      complete=""
      while [[ $complete != "1" && $complete != "2" ]]
      do
        echo "------------------------------------------------------------------------"
        printf "1)Select another task.\n2)To EXIT.\n"
         read complete

            case "$complete" in
            1) clear
               echo "You've chosen to continue!"
            ;;
            2) echo "Exiting program, goodbye $name!" 
               exit
            ;;
            *) echo "Invalid choice! Please try again."
            ;;
            esac
      done 
    ;;
############################################END TASK 2#####################################################################################

############################################## TASK 3#####################################################################################
    3|q|Q) 
    
      clear

      echo "Task 3 selected."
      echo "Find the terms of a sequence given by the rule Term = an(sq) + bn + c, where a and b and c are integers and n 
         is a positive integer."
      echo "------------------------------------------------------------------------------------------------------"

      #Get valid integer input, Get user input for a, b, and c

      read -p "Enter value a: " a
      while [[ ! $a =~ ^[0-9]+$ || $a -le 0 ]]; do
         read -p "Incorrect selection, please enter a positive number for value a " a
      done

      read -p "Enter value b: " b
      while [[ ! $b =~ ^[0-9]+$ || $b -le 0 ]]; do
         read -p "Incorrect selection, please enter a positive number for value b " b
      done

      read -p "Enter value c: " c
      while [[ ! $c =~ ^[0-9]+$ || $c -le 0 ]]; do
         read -p "Incorrect selection, please enter a positive number for value c " c
      done

      echo "-----------------------------------------------------------------------"
      echo "You chose the following values:"
      echo "a: $a, b: $b, c: $c"
      echo "-----------------------------------------------------------------------"
      # Define the sequence formula as a function
      sequence_term() {
      local n=$1
      echo "$((a*n*n + b*n + c))"
      }

      #program starts
      valid_option=""
      echo "Choose one of the following options:"
      printf "1.Find a limited number of terms\n2.Find a term and check if it's a factor\n" 
      read valid_option
      while [[ $valid_option != "1" && $valid_option != "2" ]]
      do
      echo "Incorrect selection. Please choose option 1 or 2."
      printf "1.Find a limited number of terms\n2.Find a term and check if it's a factor\n" 
      read valid_option
      done

      case $valid_option in
         1)
            read -p "Enter the number of terms to find: " num_terms
            while [[ ! $num_terms =~ ^[0-9]+$ || $num_terms -le 0 ]]; do
            read -p "Invalid input, please try again with a positive integer: " num_terms
            done

            product=1
            for ((i=1; i<=num_terms; i++)); do
            term=$(sequence_term $i)
            echo "$term"
            product=$((product * term))
            done
            echo "Product of terms: $product"
            ;;
         2)  
            read -p "Enter the term position to find: " term_pos
            while [[ ! $term_pos =~ ^[0-9]+$ || $term_pos -le 0 ]]; do
            read -p "Invalid input, please try again with a positive integer: " term_pos
            done

            read -p "Enter the number to check for factors: " num_to_check
            while [[ ! $num_to_check =~ ^[0-9]+$ || $num_to_check -le 0 ]]; do
            read -p "Invalid input, please try again with a positive integer: " num_to_check
            done

            term=$(sequence_term $term_pos)
            echo "The $term_pos term is $term."
            ((num_to_check % term == 0)) && echo "This term is a factor of $num_to_check." || echo "This term is not a factor of $num_to_check."
            ;;
         *)
            echo "Invalid option, please try again with a positive integer."
            ;;
      esac

      complete=""
      while [[ $complete != "1" && $complete != "2" ]]
      do
        echo "------------------------------------------------------------------------"
         printf "1)Select another task.\n2)To EXIT.\n"
         read complete

            case "$complete" in
            1) clear
               echo "You've chosen to continue!"
            ;;
            2) echo "Exiting program, goodbye $name!" 
               exit
            ;;
            *) echo "Invalid choice! Please try again."
            ;;
            esac
      done
    ;;
############################################END TASK 3#####################################################################################
    
    4|e|E) echo "Goodbye, $name!" 
       exit
    ;;
    *) echo "Invalid choice! Please try again."
    ;;
    esac

done
