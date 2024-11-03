.data
num1: .word 15
num2: .word 20
s: .word 0
p: .word 0
w: .word 0
c: .word 0 
.text
ld $t0,num1($zero)
ld $t1,num2($zero)
dadd $t3,$t0,$t1
sd $t3, res ($zero)
halt