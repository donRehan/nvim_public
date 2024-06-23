#### Startup_nvim

to change startup logo
I went to local nvim setup , found current theme I am using in its folder
this being dashboard.lua

in header , content I had to substitute it by whatever I  wanted to add
A good software for such things is the following site
http://www.patorjk.com/software/taag/ 
Helps in generating ASCII art text

Another one is this 
https://505e06b2.github.io/Image-to-Braille/

## LSP

#### clangd
to get it working with c++ usually create a text file in the same directory
as the c++ file containing the following !

compile_flags.txt

inside of which add the following "-std=c++17"
this will resolve the issue incase of having multiple c++ versions
