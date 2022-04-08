# Bandit

### Nivel 0 - Ingresar por SSH al puerto 2220 usuario bandit0 contraseña bandit0
    ssh bandit0@bandit.labs.overthewire.org -p 2220
    bandit0
### Nivel 1 - La siguiente contraseña se almacena en un archivo llamado 'readme'.
    ls
        readme
    cat readme
        boJ9jbbUNNfktd78OOpsqOltutMc3MY1

### Nivel 2 - La siguiente contraseña se almacena en un archivo llamado '-'.
    ls
        -
    cat /home/bandit1/-
        CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9


















### Nivel 1 La contraseña para el siguiente nivel esta en el archivo readme en el directorio principal.</br>
- La "~" que esta en nuestro promt "bandit0@bandit:´~´$" nos indica que estamos en el directorio "/home..." de nuestro usuario (bandit0). Realizamos una inspección de los archivos que hay.</br>
- Vemos que en efecto hay un archivo llamada "readme", por lo que lo revisamos con el comando "cat", que nos ayuda a imprimir en pantalla lo que un archivo tiene sin necesidad de abrir lo.</br>
- No aparece la contraseña.
    boJ9jbbUNNfktd78OOpsqOltutMc3MY1
### Nivel 1 La contraseña para el siguiente nivel esta localizada en un archivo llamado "-" en el directorio "/home".
- Se realiza un inspección de archivos.</br>
    ls -la
- Se ve que el archivo esta en el directorio pero por el nombre del archivo no podemos facil mente.</br>
- Agregamos toda la ruta y el nombre del archivo. Para conocer la ruta en la que nos encontramos;</br>
    pwd
        /home/bandit1
- Agregamos ruta y archivo al comando "cat".
    cat /home/bandit1/-
        CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
### Nivel 2 la contraseña esta en un archivo que lleva espacios nombre.</br>
Hay que revisar en que directorio estamos y enlistar los archivos que estan dentro de el.
    pwd
        /home/bandit2
    ls -la
spaces in this filename

                # Con base a las intrucciones deducimos donde esta la contraseña. Le realizamos un comando "cat" agregando una \ antes de cada espacio o también se puede colocar la primera letra y la tecla tabulación dado que es el unico archivo empiesa con esta letra.

:~$ cat spaces\ in\ this\ filename
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

    # Nivel 3 la contraseña para el siguiente nivel esta en un archivo oculto dentro del directorio, la forma de ocultar en linux empiezan con un ".", antes del nombre por lo que aplicaremos el comando ls, como costumbre tengo aplicar los parametros -la, "-l" la enlistar el contenido y "-a" mostrar los archivos ocultos.

:~$ ls -la
drwxr-xr-x  2 root root 4096 May  7  2020 inhere

                # Se valida que exista el directorio e ingresamos a el.

:~$ cd inhere/
:~/inhere$

                # Revisamos que archivos hay en el directorio, nuevamente con ls -la, para que nos muestre incluso los ocultos.

:~/inhere$ ls -la
-rw-r----- 1 bandit4 bandit3   33 May  7  2020 .hidden

                # Pasamos el archivo por el comando "cat", para ver su contenido.

:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB

    # Nivel 4 

 




