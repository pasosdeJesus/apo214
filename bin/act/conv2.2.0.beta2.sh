#!/bin/sh
# Convierte de apo214 2.2.0.beta1 a 2.2.0.beta2

for i in `git ls-tree -r main --name-only`; do
  excluye=0
  if (test "$i" == "-") then {
    excluye=1;
  } else {
    for j in db/migrate db/structure.sql bin/act; do 
      echo $i | grep "$j" > /dev/null 2>&1
      if (test "$?" = "0") then {
        excluye=1;
      } fi;
    done;
  } fi;
  if (test "$excluye" == "1") then {
    echo "Excluyendo de conversión $i";
  } else {
    n=$i
    antn="";

    for j in id_lugarpreliminar:lugarpreliminar_id id_persona:persona_id; do
      antes=`echo $j | sed -e 's/:.*//g'`;
      despues=`echo $j | sed -e 's/.*://g'`;
      grep "$antes" $n > /dev/null;
      if (test "$?" = "0") then {
        if (test "$antn" != "$n") then {
          echo "";
          echo -n "Remplazando en $n: ";
          antn=$n
        } fi;
        echo -n " $antes"
        sed -i -e "s/$antes/$despues/g" $n;
      } fi;
    done;
  } fi;
done;
echo "";
