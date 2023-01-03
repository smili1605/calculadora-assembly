### PROJETO - CALCULADORA/ASSEMBLY ###
### EQUIPE: EFRAIM; JO�O GUILHERME; NICHOLAS; TANYSE; THIAGO. ###

.data

### Introduzindo strings para melhor compreens�o na execu��o do c�digo ###

introd: .asciiz "\nAdi��o\n"
introd1: .asciiz "\nSubtra��o\n"
introd2: .asciiz "\nMultiplica��o\n"
introd3: .asciiz "\nDivis�o\n"
introd4: .asciiz "\nRaiz quadrada\n"
var0: .asciiz "\nCALCULADORA\n0-Sair\n1-Adi��o\n2-Subtra��o\n3-Multiplica��o\n4-Divis�o\n5-Raiz Quadrada\nEscolha uma op��o: "
var1: .asciiz "Digite um valor: "
var2: .asciiz "Digite outro valor: "
var3: .asciiz "Resultado: "

### Criasciiz ndo a fun��o soma ###

.macro soma

la $a0,introd # Lendo a string "Adi��o" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um n�mero #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usu�rio digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrado $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usu�rio ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

add $t2,$t0,$t1 # Realizando a soma dos valores imputados pelo usu�rio e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a fun��o de soma #

### Criando a fun��o subtra��o ###

.macro subtracao

la $a0,introd1 # Lendo a string "Subtra��o" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um n�mero #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usu�rio digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrador $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usu�rio ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

sub $t2,$t0,$t1 # Realizando a subtra��o dos valores imputados pelo usu�rio e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a fun��o de subtra��o #

### Criando a fun��o multiplica��o ###

.macro multiplicacao

la $a0,introd2 # Lendo a string "Multiplica��o" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um n�mero #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usu�rio digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrador $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usu�rio ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

mul $t2,$t0,$t1 # Realizando a multiplica��o dos valores imputados pelo usu�rio e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a fun��o de multiplica��o #

### Criando a fun��o divis�o ###

.macro divis�o

la $a0,introd3 # Lendo a string "Divis�o" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um n�mero #
li $v0,4 # Imprimindo a string #
syscall

li $v0,6 # Aguardando o usu�rio digitar um valor real #
syscall
mov.s $f1,$f0 # Movendo o valor real para o registrador $f1 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usu�rio ###

la $a0,var2
li $v0,4
syscall

li $v0,6
syscall
mov.s $f3,$f0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

div.s $f5,$f1,$f3 # Realizando a divis�o dos valores imputados pelo usu�rio e que foram movidos para os registradores #
mov.s $f12,$f5 # Agora movendo do registrador $f5 para $f12 #
li $v0,2 # Imprimindo o valor real guardado em $f12 #
syscall

.end_macro #Finalizando a fun��o de divis�o #

### Criando a fun��o raizquadrada ###

.macro raizquadrada

la $a0,introd4 # Lendo a string "Raiz quadrada" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um n�mero #
li $v0,4 # Imprimindo a string #
syscall

li $v0,6 # Aguardando o usu�rio digitar um valor real #
syscall
mov.s $f1,$f0 # Movendo o valor real para o registrador $f1 #

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

sqrt.s $f5,$f1 # Realizando a raiz quadrada do valor imputado pelo usu�rio e que foi movido para o registrador #
mov.s $f12,$f5 # Agora movendo do registrador $f5 para $f12 #
li $v0,2 # Imprimindo o valor real guardado em $f12 #
syscall

.end_macro #Finalizando a fun��o de raizquadrada #

.text

## Criando a fun��o global main ###

.globl main

### Criando o la�o de repeti��o ###

laco: # Chamada da fun��o #

main: # Chamada da fun��o #

la $a0,var0 # Lendo a string contendo as op��es de opera��es #
li $v0,4 # Imprimindo a string #
syscall


li $v0,5 # Aguardando o usu�rio selecionar a op��o #
syscall
move $t3,$v0 # Movendo a resposta para o registrado $t3 #

### Iniciando o la�o ###

jal interacao 
j laco

interacao: # Chamada da fun��o #

beq $t3,0,sair # Caso selecione a op��o '0', o programa ir� pular para a linha "sair" #
beq $t3,1,somar # Caso selecione a op��o '1', o programa ir� pular para a linha "somar" #
beq $t3,2,subtrair # Caso selecione a op��o '2', o programa ir� pular para a linha "subtrair" #
beq $t3,3,multiplicar # Caso selecione a op��o '3', o programa ir� pular para a linha "multiplicar" #
beq $t3,4,dividir # Caso selecione a op��o '4', o programa ir� pular para a linha "dividir" #
beq $t3,5,raiz # Caso selecione a op��o '5', o programa ir� pular para a linha "raiz" #

somar: # Linha "somar" #

soma # Chamando fun��o "soma" #
jr $ra # Retoma para "interacao" #

subtrair: # Linha "subtrair" #

subtracao # Chamando fun��o "subtra��o" #
jr $ra # Retoma para "interacao" #

multiplicar: # Linha "multiplicar" #

multiplicacao # Chamando fun��o "multiplica��o" #
jr $ra # Retoma para "interacao" #

dividir: # Linha "dividir" #

divis�o # Chamando fun��o "divis�o" #
jr $ra # Retoma para "interacao" #

raiz: # Linha "raiz" #

raizquadrada # Chamando fun��o "raiz quadrada" #
jr $ra # Retoma para "interacao" #

sair: # Linha "sair" #

la $v0,10 # Finalizando o programa #
syscall