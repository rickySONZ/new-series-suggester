# New Series Suggester

Generates a list of a random show suggestions that can provide detailed information when 
selecting a show via list index. This CLI application pulls from the API source
https://www.tvmaze.com/api and specifically from http://api.tvmaze.com/shows?page=1
however the page # on the second web address is a random page from 1 - 200.

# Usage

Video Link to Walkthrough: https://www.loom.com/share/165101cd211b4e95b90d252b162d6a4d
To run, input 'bin/run' in terminal

```bin/run # returns below
Hello you look like you have some free time on your hands...
Might I suggest a new show?
------------DATA HAS BEEN GRABBED SUCCESSFULLY------------
1. Show 1
2. Show 2
3. Show 3
4. Show 4
5. Show 5
6. Show 6
7. Show 7
8. Show 8
9. Show 9
10. Show 10
11. Show 11
12. Show 12
13. Show 13
14. Show 14
15. Show 15
16. Show 16
17. Show 17
18. Show 18
19. Show 19
20. Show 20
-----------------------------------------------------------------------
Would you like to see details about any of the shows on this list?
Please enter the number of the show you would like to know more about
If you would like to exit the program, please type Exit or End
----------------------------------------------------------------------- 
```

From here you are able to choose the following options:
- any integer 1-20 # returns specific show details, will ask for further input after
- "end" or "exit" # exits the program
- "list" # return list of 20 shows, will ask for further input after
- any other input # returns an error message and input will need to be reinput

Program will continue to loop until ended via proper messages listed above.


# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.


# License
[MIT](https://choosealicense.com/licenses/mit/)
