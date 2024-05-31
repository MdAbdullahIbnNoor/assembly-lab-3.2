include "emu8086.inc"
.model small
.stack 100h
.data
m1 db 10,13,'Enter First Number:$'    
m2 db 10,13,'Enter Second Number:$'
m3 db 10,13,'Simple Calculator',10,13,'1.Addition:',10,13,'2.Subtraction:',10,13,'3.Multiplication:',10,13,'4.Division:',10,13,'$'
m4 db 10,13,'Choice Operation:$'
newline db 10,13,'$'
a db 0
b db 0
choice db ?
rem db ?
.code
main proc  
    
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,m1
     int 21h
             
     mov ah,1
     int 21h
     sub al,48
     mov a,al
     
     mov ah,9
     lea dx,m2
     int 21h
             
     mov ah,1
     int 21h
     sub al,48
     mov b,al  
     
     mov ah,9
     lea dx,m3
     int 21h
     
     lea dx,m4
     int 21h
            
     mov ah,1
     int 21h
     sub al,48
     mov choice,al  
     
     cmp choice,1
     je Addition
       
     cmp choice,2
     je Subtraction
     
     cmp choice,3
     je Multiplication
     
     cmp choice,4
     je Division 
 
Addition:
     
     mov al,a
    add al,b
    
    mov ah,0
    mov bl,10
    div bl ; al = quotient, ah = remainder
    mov rem,ah
    printn " "
    print "Addition is: " 
    mov ah,2 
    mov dl,al
    add dl,48
    
    int 21h
     
    mov ah,2
    mov dl,rem
    add dl,48
    int 21h

    jmp exit
     
Subtraction:
     mov al,a
    sub al,b
  
    printn " "          
    print "Subtraction is: " 
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
             
    mov ah,2 
    mov dl,al
    add dl,48
   
    int 21h    
    mov ah,2
    mov dl,rem
    add dl,48

    int 21h

    jmp exit 

Multiplication:
     
      mov al,a
    mov bl,b
    mul b ; AL = lower byte of the result, AH = upper byte of the result
    
    mov ah,0
    mov bl,10
    div bl
    mov rem,ah
    printn " " 
    print "Multiplication is: "
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    jmp exit
 

Division: 
       mov al,a
    mov ah,0
    mov bl,b
    div bl ; AL = quotient, AH = remainder
    mov rem,ah                                         
    printn " "                                          
    print "Division is: "  
    
   
    print 'Qoutient:'
    mov dl,al
    add dl,48
    mov ah,2
    int 21h    
    
    mov ah,2
    mov dl ,' '
    int 21h
    
    print 'Reminder:'
    
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h

    jmp exit
  
     
     
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main