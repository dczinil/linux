# Admin Srv Linux

## Alias
Para generar nuevos comandos con instruccines especificas utilizando comandos existentes y flag´s.

*   Hay validar que en el archivo "~./bashrc" se encuentre la siguiente descripción.
```
# Alias definitions.
# You may want to put all your additions into a separate file like
# /.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f /.bash_aliases ]; then
    . /.bash_aliases
fi
```
&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; Si no se encuentra, abria que escribir lo.

*   Se creal el archivo ".bash_aliases" en la ruta "~".
*   Dentro dl archivo se van agenerando los alias. La sintaxis es la siguiente;
```
alias "nombre del alias"="'Comandos, flag´s y patch que se van a utilizar, todo va dentro de comillas simples.'"

alias vpy='python3 -m venv venv'
```
*   Al finalizar de editar cada archivo hay que reiniciar lo por lo que se corre lo siguiente, segun corresponda.


```
source ~/.bashrc

source ~/.bash_aliases
```


## Comandos

### Comandos epeciales
    alias "palabra cable del alias"="'Comando'"

### less - Se utiliza para mostrar texto en la pantalla de la terminal. 

    less 'Opción' 'Nombre del archivo'

Limpia la pantalla antes de mostrar la información.</br>
    less -c 'Nombre del archivo'

Al colocar un número 'sin las comillas' muestra el archivo apartir de la línea que indique.</br>
    less '+10' 'Nombre del archivo'

Examina el archivo previo en la línea de comandos.</br>
    les :p 'Nombre del archivo'

Deshabilita el auto-ajuste las líneas larga seran visibles por navegador latenal.</br>
    less -S 'Nombre del archivo'
### cat - 

### head - 

### tail - 

## Permisos - 