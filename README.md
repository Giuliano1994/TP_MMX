# TP_MMX
TP de manejo de registros MMX en assembler


## Requisitos

Asegúrate de tener instalado NASM (ensamblador) en tu sistema. Puedes instalarlo en distribuciones basadas en Debian (como Ubuntu) con el siguiente comando:

```bash
sudo apt-get install nasm
```

## Compilación ASM

1. Abre una terminal en el directorio donde se encuentra el archivo `mi_programa.asm`.
2. Ejecuta el siguiente comando para ensamblar el código:

```bash
nasm -f elf64 mi_programa.asm
```

Esto generará un archivo objeto llamado mi_programa.o.
Luego, enlaza el archivo objeto para crear un ejecutable con el siguiente comando:

```bash
ld -m elf_i386 -s -o mi_programa mi_programa.o
```

Ejecución
Una vez que se haya creado el ejecutable, puedes ejecutarlo con el siguiente comando:

```bash
./mi_programa
```

## Compilación C

1. Abre una terminal en el directorio donde se encuentra el archivo `mi_programa.c`.
2. Ejecuta el siguiente comando para compilar el código c `mi_programa_c.c`junto con el objeto_ams.o `mi_programa_asm.o`:

```bash
gcc -o mi_programa_ejecutable mi_programa_C.c mi_programa_objet.o -no-pie

```

Ejecución
Una vez que se haya creado el ejecutable, puedes ejecutarlo con el siguiente comando:

```bash
./mi_programa
```
