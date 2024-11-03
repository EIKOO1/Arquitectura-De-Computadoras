.data
cadena: .asciiz "ABCdef1"
cadena2: .ascii "ABCdef11"
cadena3: .asciiz "ABCdef1111111"
num: .word 5
.code
daddi $t1,$zero,6
lbu $t2,cadena($zero)
lb $t3,cadena($t1) 
halt