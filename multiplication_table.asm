include "emu8086.inc"

.model small 
.stack 100h
.data   
msg db  "Enter Any Number :$"
.code
main proc 
      mov ax,@data
   mov ds,ax
   
   mov ah,9   ;print msg
   lea dx,msg
   int 21h 
    
    mov ah,1    ;input taking
    int 21h
    
    mov ch,10    ;stop table after reaching posiition
    mov cl,0
    
   
    sub al,48
    mov bh,al  
    mov bl,1 ;0 input na nei jeno
 TableLoop: 
    
    mov ah,2
    mov dl,10 ;show table result in same in line by line
    int 21h
    
    mov ah,2
    mov dl,13  ;show table result in new line after each step
    int 21h
    
    mov ah,2
    mov dl,bh
    add dl,48  
    int 21h
    
    mov ah,2
    mov dl,'*'
    int 21h    
    
    mov al,bl
    mul bh
    
    AAM  ;ascii adjust ax after multiply 
    
    PUSH ax
    
    mov ah,0 
    mov al,bl
    
    AAA   ;ascii adjust after addition
    
    mov cl,ah
    mov bl,al
    
    mov ah,2
    mov dl,cl
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    
 OutputTable:
    
    mov ah,2
    mov dl,'='
    int 21h
    
    POP ax     
    
    mov dh,al
    mov dl,ah
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,dh 
    add dl,48
    mov ah,2
    int 21h  
    
    INC bl
    DEC ch
    CMP ch,0 
    JNE TableLoop
    
    exit:
    
    mov ah,4ch
    int 21h 
    
    
main endp

ret