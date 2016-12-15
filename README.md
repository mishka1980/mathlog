mathlog
=======

This is basically a journaling utility. Just run the "mathlog" command to open your text editor where you can type in TeX. A master file automatically
be updated to import the file you're writing. 

If you run mathlog without arguments, it should open the tex file ~/Math/mathlog/yyyymmdd.tex. If it doesn't exist yet, it will also add the lines
\section\*{mm dd, yyyy} 
\input{yyyymmdd.tex} 
into the file ~/Math/mathlog/mathlog.tex, right before the flag %%%


