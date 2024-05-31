include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc
    
    mov cx,10
    
    mov ah,2
    mov dl,48 
    
    Top:
    int 21h
    printn " "
    inc dl
    loop Top 
    
   
   
   
   
   
    mov ah,4ch
    int 21h
    main endp
end main