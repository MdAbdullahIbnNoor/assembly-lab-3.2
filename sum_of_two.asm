include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1
    int 21h
    
    mov bl,al
    int 21h
    
    mov bh,al  
    
    add bl,bh  
    
    printn " "
    
    
    
    mov ah,2
    sub bl,48
    mov dl,bl
    int 21h
    
    
    
    
    
    
    mov ah,4ch
    int 21h
    
    main endp
end main