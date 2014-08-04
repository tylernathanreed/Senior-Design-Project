//* Description *//
// Usage: compare(first, second);
// Function Returns an Integer Comparison (-1, 0, 1) between the specified Strings
// Arguments:
// 1) first : string - The first specified Value
// 2) second : string - The second specified Value

//* Arguments *//
var first, second;

first = string(argument0);
second = string(argument1);

//* Main Body *//
// Do Normal Comparison
if(first < second)
    return -1;
else if(first > second)
    return 1;
else
    return 0;
