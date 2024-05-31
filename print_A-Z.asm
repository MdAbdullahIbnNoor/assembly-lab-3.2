include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc 
    
    
    mov cx,26
    
    
    mov ah,2
    mov dl,'a'
    
    l1:
    int 21h
    printn " "
    
    inc dl
    loop l1
    
    mov ah,4ch
    int 21h
    main endp
end main