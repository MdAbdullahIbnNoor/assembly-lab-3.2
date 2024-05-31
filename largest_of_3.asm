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
    
    int 21h
    mov cl,al
    
    cmp bl,bh
    jg l1
   
    
    cmp bh,cl
    jg l3 
    
      
    printn " "
    mov ah,2
    mov dl,cl
    int 21h
    
     jmp exit
    
    l1:
    cmp bl,cl
    jg l2
    printn " "
      mov ah,2
    mov dl,cl
    int 21h
    
   
    
    l2:
    printn " "
    mov ah,2
    mov dl,bl
    int 21h 
    jmp exit
    l3:
    
    printn " "
    mov ah,2
    mov dl,bh
    int 21h 
    jmp exit
    
     exit:
    mov ah,4ch
    int 21h
    main endp
end main
