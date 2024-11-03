.data
v: .word 5,2,6
.text
daddi $t2,$t2,0
ld  $t1,v($t2)
dadd $t3,$t3,$t1
daddi $t2,$t2,8
ld $t1,v($t2)
dadd $t3,$t3,$t1
sd $t3,v($zero)
halt
