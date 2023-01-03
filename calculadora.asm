### PROJETO - CALCULADORA/ASSEMBLY ###
### EQUIPE: EFRAIM; JOÃO GUILHERME; NICHOLAS; TANYSE; THIAGO. ###

.data

### Introduzindo strings para melhor compreensão na execução do código ###

introd: .asciiz "\nAdição\n"
introd1: .asciiz "\nSubtração\n"
introd2: .asciiz "\nMultiplicação\n"
introd3: .asciiz "\nDivisão\n"
introd4: .asciiz "\nRaiz quadrada\n"
var0: .asciiz "\nCALCULADORA\n0-Sair\n1-Adição\n2-Subtração\n3-Multiplicação\n4-Divisão\n5-Raiz Quadrada\nEscolha uma opção: "
var1: .asciiz "Digite um valor: "
var2: .asciiz "Digite outro valor: "
var3: .asciiz "Resultado: "

### Criasciiz ndo a função soma ###

.macro soma

la $a0,introd # Lendo a string "Adição" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um número #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usuário digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrado $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usuário ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

add $t2,$t0,$t1 # Realizando a soma dos valores imputados pelo usuário e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a função de soma #

### Criando a função subtração ###

.macro subtracao

la $a0,introd1 # Lendo a string "Subtração" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um número #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usuário digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrador $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usuário ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

sub $t2,$t0,$t1 # Realizando a subtração dos valores imputados pelo usuário e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a função de subtração #

### Criando a função multiplicação ###

.macro multiplicacao

la $a0,introd2 # Lendo a string "Multiplicação" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um número #
li $v0, 4 # Imprimindo a string #
syscall

li $v0,5 # Aguardando o usuário digitar um valor inteiro #
syscall
move $t0,$v0 # Movendo o inteiro para o registrador $t0 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usuário ###

la $a0,var2
li $v0,4
syscall

li $v0,5
syscall
move $t1,$v0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

mul $t2,$t0,$t1 # Realizando a multiplicação dos valores imputados pelo usuário e que foram movidos para os registradores #
move $a0,$t2 # Agora movendo do registrador $t2 para $a0 #
li $v0,1 # Imprimindo o valor inteiro guardado em $a0 #
syscall

.end_macro #Finalizando a função de multiplicação #

### Criando a função divisão ###

.macro divisão

la $a0,introd3 # Lendo a string "Divisão" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um número #
li $v0,4 # Imprimindo a string #
syscall

li $v0,6 # Aguardando o usuário digitar um valor real #
syscall
mov.s $f1,$f0 # Movendo o valor real para o registrador $f1 #

### Repetindo o mesmo processo agora com o segundo valor a ser imputado pelo usuário ###

la $a0,var2
li $v0,4
syscall

li $v0,6
syscall
mov.s $f3,$f0

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

div.s $f5,$f1,$f3 # Realizando a divisão dos valores imputados pelo usuário e que foram movidos para os registradores #
mov.s $f12,$f5 # Agora movendo do registrador $f5 para $f12 #
li $v0,2 # Imprimindo o valor real guardado em $f12 #
syscall

.end_macro #Finalizando a função de divisão #

### Criando a função raizquadrada ###

.macro raizquadrada

la $a0,introd4 # Lendo a string "Raiz quadrada" #
li $v0,4 # Imprimindo a string #
syscall

la $a0, var1 # Lendo a string para receber um número #
li $v0,4 # Imprimindo a string #
syscall

li $v0,6 # Aguardando o usuário digitar um valor real #
syscall
mov.s $f1,$f0 # Movendo o valor real para o registrador $f1 #

la $a0, var3 # Lendo a string "Resultado" #
li $v0, 4 # Imprimindo a string #
syscall

sqrt.s $f5,$f1 # Realizando a raiz quadrada do valor imputado pelo usuário e que foi movido para o registrador #
mov.s $f12,$f5 # Agora movendo do registrador $f5 para $f12 #
li $v0,2 # Imprimindo o valor real guardado em $f12 #
syscall

.end_macro #Finalizando a função de raizquadrada #

.text

## Criando a função global main ###

.globl main

### Criando o laço de repetição ###

laco: # Chamada da função #

main: # Chamada da função #

la $a0,var0 # Lendo a string contendo as opções de operações #
li $v0,4 # Imprimindo a string #
syscall


li $v0,5 # Aguardando o usuário selecionar a opção #
syscall
move $t3,$v0 # Movendo a resposta para o registrado $t3 #

### Iniciando o laço ###

jal interacao 
j laco

interacao: # Chamada da função #

beq $t3,0,sair # Caso selecione a opção '0', o programa irá pular para a linha "sair" #
beq $t3,1,somar # Caso selecione a opção '1', o programa irá pular para a linha "somar" #
beq $t3,2,subtrair # Caso selecione a opção '2', o programa irá pular para a linha "subtrair" #
beq $t3,3,multiplicar # Caso selecione a opção '3', o programa irá pular para a linha "multiplicar" #
beq $t3,4,dividir # Caso selecione a opção '4', o programa irá pular para a linha "dividir" #
beq $t3,5,raiz # Caso selecione a opção '5', o programa irá pular para a linha "raiz" #

somar: # Linha "somar" #

soma # Chamando função "soma" #
jr $ra # Retoma para "interacao" #

subtrair: # Linha "subtrair" #

subtracao # Chamando função "subtração" #
jr $ra # Retoma para "interacao" #

multiplicar: # Linha "multiplicar" #

multiplicacao # Chamando função "multiplicação" #
jr $ra # Retoma para "interacao" #

dividir: # Linha "dividir" #

divisão # Chamando função "divisão" #
jr $ra # Retoma para "interacao" #

raiz: # Linha "raiz" #

raizquadrada # Chamando função "raiz quadrada" #
jr $ra # Retoma para "interacao" #

sair: # Linha "sair" #

la $v0,10 # Finalizando o programa #
syscall