#forms list of image type files in directory
list=( $(find . -type f -exec basename {} \; | grep -E "(.jpg|.png|.gif)" | grep -Ev "._" | sort -u ) )
#forms list of text type files in directory
txtlist=( $(find . -type f | grep -E "(.txt|.html|.json|.js)") )
reflist=()

#forms a list of references to image type files in the files in txtfiles
for i in ${txtlist[@]};
do
    reflist=( "${reflist[@]}" $(grep -o [a-zA-Z0-9_./-]* $i | grep -E "(.jpg|.png|.gif)" | rev | cut -d '/' -f 1 | rev | sort -u ) )
done

#prints unreferenced files
for i in ${list[@]};
do
    nref=true
    for j in ${reflist[@]};
    do
	if [ "$i" == "$j" ];
	then
	    nref=false
	fi
    done
    if [ "$nref" = true ];
    then
	echo $i
    fi
done
