.data
cadena: .asciiz "adbdcdedfdgdhdid" ;cadena a analizar
car: .ascii "d" ; carácter buscado
cant: .word 0 ; cantidad de veces que se repite el carácter car en cadena.
.code
;primero inicializo y cargo lo q voy a usar
ld $s0,car($zero)
daddi $s3,$s3,0; para desplazarme por la cadena
daddi $s2,$s2,0 ;para la cantidad de veces que aparece

LOOP: lbu $s1,cadena($s3) ;pongo en s1 lo que este en la cadena con desplazamiento s3

; comparo que no sea 0
beqz $s1,FIN
;comparo q sea el caracter q busco
bne $s1,$s0,SIGUIENTE
daddi $s2,$s2,1

;salto al siguiente elemento
SIGUIENTE: daddi $s3,$s3,1
j LOOP

FIN: sd $s2,cant($zero)
halt