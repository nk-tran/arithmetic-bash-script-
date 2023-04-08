# Author: Huynh Yen Nhu Ly
# Last modified: Apr. 7, 2023
# Task 2
# Find a number of products of two nonnegative even integers 
# and display them in succession.
# Check each result if they are multiple of a number.

clear
echo "You chose TASK 2."
echo

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

#Select another task to perform
ans=''
while [[ "$ans" != 'y' || "$ans" != 'Y' || "$ans" != 'n' || "$ans" != 'N' ]]; do
    read -p "Do you want to select another task to perform?(Y/N) ==> " ans
    case $ans in
    Y|y)
        echo "You chose to continue";;
    N|n)
        exit;;
    *)
        echo "Invalid answer. Please try again!";;
    esac
done   

