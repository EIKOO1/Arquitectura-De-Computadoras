.data
vector: .word 1,-1,2,-2,3,-3,4,-4,5,-5
pos: .word 0
max: .word -1
.code
ld $t5,max($zero)
daddi $t2,$zero,0 ;para desplazarme por el vector
daddi $t3,$zero,10 ; cantidad de elementos
daddi $t4,$t4,0 ;cant positivos

loop: ld $t1,vector($t2) ; posiciono en el vector

;veo si es maximo

slt $t6, $t5,$t1

;si es mayor guarda un 1 en t6

beqz $t6,verPositivo ; si t6 es 0 es porque no es mayor
;sino actualizo
dadd $t5,$zero,$t1

;ahora miro si es positivo o negativo

verPositivo: slti $t6,$t1,0
bnez $t6,siguiente

;deja t6 en 1 si es negativo
;sino es positivo y lo sumo
daddi $t4,$t4,1
;avanzo al siguiente elemento
siguiente: daddi $t2,$t2,8
daddi $t3,$t3,-1
bnez $t3,loop
;guardo en las variables
sd $t4,pos($zero)
sd $t5,max($zero)
halt

