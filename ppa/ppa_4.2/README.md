# Programming Practice Assignment - Week 4 - Question 2

## Problem Statement

The file `Pincode_info.csv` has information on the pin codes of some places.
The output of the command `head -5 Pincode_info.csv` is given below.
First line of this file gives the information about the sequence of fields in each line of file following it.

```csv
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```

## Instructions

Write a command to display the Circle name and Division name separated by space for the given pincode stored in a shell variable 'pin'.
Note: If your solution has more than one line, add a semicolon after each line.

Write your command in the file `pincode.sh`.
The script will not recieve any input through STDIN or the arguments.
The pincode should be stored in an environment variable named `pin` accessible by the script.
The script should output the Circle name and Division name separated by space to the STDOUT.

## Sample Input

For e.g. if `pin=515002` then your command should display:

## Sample Output

```bash
Andhra Pradesh Anantapur
```
