.data
v: .word 5,2,6
.text
daddi $t4,$zero,3
daddi $t2,$t2,0
loop:  ld  $t1,v($t2)     
dadd $t3,$t3,$t1
daddi $t2,$t2,8
daddi $t4,$t4,-1
bnez $t4,loop


sd $t3,v($zero)
halt
