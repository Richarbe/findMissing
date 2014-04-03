#imgtypes=("jpg" "png" "gif")
#txttypes=("txt" "cpp" "py" "c" "html" "xml" "json" "js")
#forms list of image type files in directory
list=( $(find . -type f | grep -E "(.jpg|.png|.gif)" ) )
#forms list of text type files in directory
txtlist=( $(find . -type f | grep -E "(.txt|.html|.json|.js)") )
reflist=()

for i in ${txtlist[@]};
do
    echo $i
done
echo ""

#forms a list of references to image type files in the files in txtfiles
for i in ${txtlist[@]};
do
    reflist=( "${reflist[@]}" $(grep -o [a-zA-Z0-9_./-]* $i | grep -E "(.jpg|.png|.gif)" | sort -u ) )
done

for i in ${list[@]};
do
    echo $i
done
echo ""

for i in ${reflist[@]};
do
    echo $i
done
