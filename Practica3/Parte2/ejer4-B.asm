;B) Idem A pero ahora el programa termina luego de mostrar 5 veces el mensaje (es decir, luego de que
;presione 5 veces la tecla F10).
EOI equ 20H
IMR EQU 21H
INT0 equ 24h
F10 equ  10
org 40
  puntero dw  subrutina

org 3000H

subrutina: mov bx, offset msj
           mov al, offset aux - offset msj
           int 7
           inc cl
           mov al, EOI
           out EOI, al
          iret

org 1000H
  msj db "vamos las interrupciones!"
  aux db ?

org 2000h
cli
  mov al, 0FEh
  out IMR, al
  mov al, F10
  out INT0, al
  mov cl, 0
sti
loop: cmp cl, 5
jz fin
jnz loop 





fin: int 0
end