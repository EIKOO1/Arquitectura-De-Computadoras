.data
base: .word 5
exponente: .word 4
result: .word 0
.code
ld $a0, base($zero)
ld $a1, exponente($zero)
jal potencia
sd $v0, result($zero)
halt
potencia:daddi $v0, $zero, 1
lazo:bnez $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar:jr $ra                         