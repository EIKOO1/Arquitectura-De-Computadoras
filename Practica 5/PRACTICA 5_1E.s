#Escriba un programa que utilice potencia. En el programa principal se solicitará el ingreso de la base y
#del exponente (ambos enteros) y se deberá utilizar la subrutina potencia para calcular el resultado
#pedido. Muestre el resultado numérico de la operación en pantalla.
.data
CONTROL: .word 0x10000
DATA: .word 0x10008
MENSAJE: .asciiz "INGRESE LA BASE Y EL EXPONENTE "
res: .word  0
.code
ld $s0,CONTROL($zero)
ld $s1,DATA($zero)
#LEO LA BASE Y EL EXPONENTE
daddi $t0,$zero,MENSAJE
daddi $t1,$zero,4
sd $t0,0($s1)
sd $t1,0($s0)
daddi $t1,$zero,8
sd $t1,0($s0)
ld $a0,0($s1) #GUARDO EL NUMERO
sd $t1,0($s0)
daddi $t1,$zero,8
ld $a1,0($s1) #GUARDO EL NUMERO
jal potencia 
daddi $t1,$zero,1
sd $v0,0($s1) #MANDO A DATA
sd $t1,0($s0)   
halt

potencia: daddi $v0, $zero, 1
lazo: beqz $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra
