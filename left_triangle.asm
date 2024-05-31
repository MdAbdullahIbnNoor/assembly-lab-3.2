include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc  
    
    mov cx,4
    
    l1:
    mov bx,cx
    
    l2:
    mov ah,2
    mov dl,'*'
    int 21h
    loop l2
    
    printn " "
    
    mov cx,bx
    loop l1
    
    mov ah,4ch
    int 21h
    main endp
end main