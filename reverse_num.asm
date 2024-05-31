include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc
   
     
   
    mov cx,0
    
    Pushin:  
    
    mov ah,1       ;input
    int 21h
    mov bl,al
    
    cmp bl,13
    je newline   
    push bx
    inc cx
     jmp Pushin
    
    newline:
              mov ah,2
              mov dl,13
              int 21h
              mov dl,10
              int 21h
              
    
    
    popOut:
    pop dx
    mov ah,2
  
    int 21h
    loop popOut
   
   
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main