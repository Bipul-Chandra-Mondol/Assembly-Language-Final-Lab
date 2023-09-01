.model small
.stack 100h
.data
a db 'Enter First digit/character: $'
b db 10,13,'Enter Second digit/character: $'
c db 10,13,'The Smalest is: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;Display Promot "Enter First digit/character:"
    lea dx,a
    mov ah,09h
    int 21h
    
    ;Read the first digit/character from user
    mov ah,01h
    int 21h
    mov bl,al
    
    ;Display Promot "Enter second digit/character:"
    lea dx,b
    mov ah,09h
    int 21h
    
    ;Read the second digit/character from user
    mov ah,01h
    int 21h
    mov bh,al
    
    ;compare two digits using ASCII values
    cmp bl,bh  ;compare two values
    jl l1      ;jump label l1 if first character is smaller(bl)
    jmp l2     ;jump label l2 if first charecer is not smaller
    
l2:
    ;Display Pront "The Smalest is:"
    lea dx,c
    mov ah,09h
    int 21h
    
    ;Display the smallest charecter
    mov ah,02h
    mov dl,bh
    int 21h
    jmp exit
l1:
    ;display Pront "The Smalest is:"
    lea ax,c
    mov ah,09h
    int 21h
    
    ; Display the smallest character
    mov ah,02h
    mov dl,bl
    int 21h
    jmp exit
    
exit:
    ;Terminate the program by returning control to DOS
    mov ah,4ch
    int 21h
    main endp
end main
 