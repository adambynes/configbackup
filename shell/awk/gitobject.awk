#!/bin/awk -f

BEGIN {
    #print "type a number";
   FS="/" 
}
{
    #print "the square is", $1*$1;
    #print "type another number";
    print  $3$4    
}
END {
  # print "DONE";
} 

