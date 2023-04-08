#!/bin/bash

echo "Task 3 selected."

#Get valid integer input, Get user input for a, b, and c

read -p "enter value a: " a
while [[ ! $a =~ ^[0-9]+$ || $a -le 0 ]]; do
    read -p "Incorrect selection, please enter a positive number for value a " a
done

read -p "enter value b: " b
while [[ ! $b =~ ^[0-9]+$ || $b -le 0 ]]; do
    read -p "Incorrect selection, please enter a positive number for value b " b
done

read -p "enter value c: " c
while [[ ! $c =~ ^[0-9]+$ || $c -le 0 ]]; do
    read -p "Incorrect selection, please enter a positive number for value c " c
done

echo "-----------------------------------------------------------------------"
echo "You chose the following numbers:"
echo "a: $a, b: $b, c: $c"

# Define the sequence formula as a function
sequence_term() {
  local n=$1
  echo "$((a*n*n + b*n + c))"
}

# Main function to run the program

valid_option=""
echo "Choose option 1 or 2:"
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
    
    printf "To select another task, please choose option 1.\nTo EXIT, please choose option 2.\n"
    read complete

      case "$complete" in
      1) clear
         echo "You've chosen to continue!"
      ;;
      2) echo "Exiting program!" 
          exit
      ;;
      *) echo "Invalid choice! Please try again."
      ;;
      esac
done