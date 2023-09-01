.model small            
.stack 100h
.data
a db 'Enter First digit: $'
b db 10,13,'Enter Second Digit: $'
c db 10,13,'Result: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;Display Prompt Enter First digit"
    mov ah,09h
    lea dx,a
    int 21h
    
    ;take first input from user
    mov ah,01h
    int 21h
    mov bl,al
    sub bl,48
    
    ;Display prompt "Enter Second Digit"
    mov ah,09h
    lea dx,b
    int 21h
    
    ;take Second input from user
    mov ah,01h
    int 21h
    mov bh,al
    sub bh,48
    
    ;do sum of two numbers
    add bl,bh  ;bl=bl+bh
    add bl,48
    
    ;Display prompt Result
    mov ah,09h
    lea dx,c
    int 21h
    
    ;print result
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main