/**



 ------  Turing Review  -------
    
    
    @author Sean Hobeck
    @date 1/24/2023
    


**/



% ---------------- The Basics --------------------- %


% Initializing a variable (Creating a variable).
% To create a variable we start with the keyword 'var'
% Then we state the name and then a intialized value.
% And then we can specify the type for the variable

% We initialized a string called '_variable1'.
var _variable1 : string

% We can also set a intiialized value with the ':='
var _variable2 : string := "Hello, World!\n"

% We can also set the number of characters we want to have in the string.

% This created a 4-character string with the name '_variable3'.
var _variable3 : string(4)

% We can also do this with different types.
%
% int -> a whole number (integer).
% string -> a list of characters.
% real -> a real number (decimal or not).
% boolean -> a boolean statement (true or false).

% We can now create something called a array.
% You can imagine a array as a list in a sense.
%
% This is how you would initialize a array.

% If you wanted to create a list of integers 
% you would set the fixed-length of the array, 
% array 0.. (your max length) and then the type of the array
% after typing 'of'.

var _variable_array : array 0..4 of int

% You unfortunately cannot initialize a list of 
% you can actually set specific indexes though with
% the brackets '()'.
%
% Make sure that you know that all arrays start at 0, not at 1.
% This sets the array to be { 1, 2, 3, 4 }.
_variable_array(0) := 1
_variable_array(1) := 2
_variable_array(2) := 3
_variable_array(3) := 4



% ---------------- Strings are weird --------------------- %



% Most people who start to work with strings often
% get confused and upset with how they work in programming languages.
%
% Strings have very special rules that can be very annoying and weird at times.
% Heres an Example:
%
%       put "\x20"
%
% What do you think this command does?
% Most people would think it would print "x20" or something along the lines of that, 
% but in reality it doesn't this actually prints a character specifically the ascii value 
% of 0x20 (this happens to be the space character).
%
% The backslash character actually means the start of the special character.
% Another example is if we wanted to print the quotation character in a sentence of some kind.
% We would do this by typing "\"Hello, World!\"" 
put "\"Hello, World!\"" 

% This actually prints  "Hello, World!"  to the output console.
% And if you wanted to print the backslash character by itself then you would actually type
put "\\"

% Some other commands that you should know are, 
% 
% locate(row, column)  -> This locates the next printed string to a specific column, and row; Max is (24, 24) for the runtime window.
% colour(c)  -> This sets the colour of the next Turing command to be a specific colour.
%

% Some of the escape / special characters that are most commonly used are:
%
% "\n"  -> This is essentially the same thing as 'skip'
% "\t"  -> This adds a tab.
% "\'"  -> This adds a single quote.
% "\""  -> This adds a double quote.

% Concatinating strings are actually very simple.
% To add strings together in the same sentence is as simple as adding a + to your put statement or equal statement.
put "Hello! " + "Hello, there!"

% Note, when you finish a put statement if you do not specify .. it will clear and start on the next line in the console.
% An example of that would be...
put "Is this sentence going to be continued? " ..
put "Yes!"

% Another thing to add is that if you wanted to skip another line, instead of calling 'put' and having to add something, 
% You can simply use the 'skip' command and actually just add it to the end of your previous print statement.
% To add things to your printing statement you can actually add a comma, this allows you to continue on the same line
% and add more things to your print statement.
put "This is on a single line."
put "This is also on a single line, but the next is skipped.", skip

% 

% Another thing to note is if you are going to be converting a string to a integer
% There is a special command that can actually help you with this.
% 
% The command is  strint()
%
% strint is a very strict command, and can only be used when you can actually convert a string to a integer.
% In this case if you wanted to check if a string could be converted to a integer you would call another command before-hand.
%
% That command is  strintok()
%
% This tells you if its okay to convert a string to a integer (you cannot convert letters to a integers).
% Heres a example:
var _variable4 : string := "$10101"
var _variable5 : string := "10101"

if strintok(_variable4) then
    put "\"_variable5\" can be a integer!"
    
    % Then we can convert it to a integer (we cant).
else
    put "\"_variable4\" cannot be a integer!"
end if


if strintok(_variable5) then
    put "\"_variable5\" can be a integer!"
    
    % Then we can convert it to a integer.
    var _variable5_int : int := strint(_variable5)
    put _variable5_int, ", is the integer version of \"_variable5\""
else
    put "\"_variable5\" cannot be a integer!"
end if
% Mr. Henrich likes to call  strintok()  and  strint()  as error checking.




% ---------------- Procedures, Loops & Conditionals --------------------- %



% Most people are not familiar with loops and conditionals, 
% it may sound scary at first but conditional is another word for a 'if' statement.
% Procedures are also most commonly called, functions.
%
% This is how you would declare a function / procedure,
% 
% procedure (procedureName)
%       Your code...
% end (procedureName)
%

procedure exampleProcedure
    put "This is a example procedure!"
end exampleProcedure

% This is the most common procedure
procedure clearScreen
    var single_character : string(1)
    locate(24, 1)
    put "Press ENTER to clear screen."
    
    % This gets a SINGLE character from the input of your keyboard.
    getch(single_character)
    
    % This is the Windows Systemcall for clearing the console.
    cls
end clearScreen

% Calling the procedure


% 
% Conditionals may sound confusing but they are very simple.
% They work by checking a boolean statement and if it is true it will call the code after the 'then'.
% And if the condition is false then it executes the code after the 'else' statement.
%
% You then have to end the conditional by typing 'end if' after everything.
var _variable6 : boolean := true

% Stating the conditional
if _variable6 then
    % _variable6 is true
else
    % _variable6 is false
end if

clearScreen

%
% Loops can be confusing. They're often difficult to wrap your head around but they are as simple as they sound.
% Forever loops are started with the 'loop' command and end with the 'end loop' command.
% Heres an example:
loop
    % Do your code...
    
    % Leave the loop
    exit
end loop

% If you wanted to exit the loop and execute some other code, you would use the command 'exit'.
% This is specifically if you wanted to exit now, not with a condition.
% If you wanted to use a condition then you would actually be using the command 'exit when (condition)'
% Using this creates something called a conditional loop.
%
% There is two more types of loops that are most commonly used.
% That is, increasing and decreasing loops. They start with the command 'for' and end with the command 'end for'.
% These work by having a temporary integer and then increasing or decreasing until it reaches a condition.
% You can add a range to the for loop and this can be decreasing and increasing (by default this is increasing).
%
% An example of this would be...
for i : 1..10
    put i
end for
put skip
clearScreen

% An example of a decreasing for loop would be...
for decreasing i : 10..1
    put i
end for
put skip
clearScreen

% You can now add a increasing / decreasing amount you can do this by using the command 'by (amount)'
% and then specifying the amount you want to increase / decrease by every loop.
%
% You do this by specifying the keyword 'by' after your range (1..10) in the loop
% Heres an example:
for i : 0..10 by 2
    put i
end for
put skip
