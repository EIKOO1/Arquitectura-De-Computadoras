.data
string: .asciiz "ArquiTectuRa de ComPutaDoras"
LONGITUD: .word 0
.code  
;inicializo todos los registros que voy a usar
lbu $v1,LONGITUD($zero)
;verifico q  no sea 0
LOOP: lbu $v0,string($v1)
beqz $v0,FIN
;si entro aumento la LONGITUD
daddi $v1,$v1,1
j LOOP
FIN: sd $v1,LONGITUD($zero)
halt



