.model small
.stack 100h
.data
  msg1 db 10,13,"Enter the string :$ "     
  msg2 db 10,13,'The string is palindrome $'
  msg3 db 10,13,'The string is not palindrome $'
  str1 db 50 DUP(0)  
  
data ends  
.code
main proc 
    mov ax,data
    mov ds,ax 
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    lea si,str1
    lea di,str1   
    
    mov ah,1
    
next:
    
    int 21h 
    cmp al,13 
      je Terminate 
    mov [di],al
    inc di
    jmp next
  
       
    
    Terminate:  
    mov al,'$'
    mov [di],al  
    
    DoThis:
    dec di
    mov al,[si]
    cmp [di],al
    jne notPalindrome   
    inc si
    cmp si,di
    jl DoThis
    
    Palindrome:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    
    
    
    
    notPalindrome:
    mov ah,9
    lea dx,msg3
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main