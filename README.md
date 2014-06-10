blackjack
============================================================================================

This program is a pseudo-simple Ruby Code to play Terminal Blackjack. 

You can run the file by:                                                                                                 
    1. Open terminal and navigate to the directory                                                                          
    2. Once in the blackjack directory, enter: Ruby -Ilib /lib/blackjack.rb
*** BUGS *** 
============================================================================================    

Recent, double value (1 & 11) for aces, Blackjack, and shuffling empty deck has been fixed. 
No known bugs. 

**NEXT** 
============================================================================================    
I will be doing some QA on the deck tomorrow. I need to make sure the program is pulling from the same deck every time. Also, I need to make sure the game shuffles the deck after it reaches the end of the deak. 

Inheritance
============================================================================================    
The only place having inheritance made since was dealer< player. However, inside my dealer class, I have some outputs specific to the dealer ie. his hand and if he bust. In the future, I may change up the logic of my game in order to add 
inheritance. 
