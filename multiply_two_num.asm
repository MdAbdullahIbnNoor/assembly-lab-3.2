include "emu8086.inc"
.model small
.stack 100h
.data
a db ?
b db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al 
    
    printn " "
     
    mov ah,1
    int 21h
    sub al,48 
    
    mul a ;al=al*a 
     
    aam
    mov bx,ax 
    
    printn " "
     
    
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    
    mov ah,4ch
    int 21h
    main endp
end main