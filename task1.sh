clear
echo "You have chosen task 1!"
echo "Please choose 2 numbers to find the trianglular numbers within the range"

read -p "Please enter your starting number: " startVal
read -p "Please enter your stopping number: " endVal

odd=0
even=0

while [ $startVal -gt $endVal ]
do
  echo "Please make sure your selections are valid. Your starting number must be lower than your ending number"
  read -p "Please enter your starting number: " startVal
  read -p "Please enter your stopping number: " endVal
done

clear

echo "You have selected the starting number: $startVal"
echo "You have selected the ending number: $endVal"
echo "------------------------------------------------------------------------"
echo "These are all the even triangular numbers between $startVal and $endVal:"

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
echo "------------------------------------------------------------------------"

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

