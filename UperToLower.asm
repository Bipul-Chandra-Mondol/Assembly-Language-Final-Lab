.model small
.stack 100h
.data
a db 'Enter a character: $'
b db 10,13,'Uper case to lower case is: $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,a
    int 21h
    
    ;take a character input from user
    mov ah,01h
    int 21h
    mov bl,al
    
    ;convert uper case letter to lowercase
    cmp bl,'A'
    jb not_uper ;jump if character < 'A'
    cmp bl,'Z'
    ja not_uper ;jump if character > 'Z'
    
    add bl,32  ;convert upercase to lower case
    
not_uper:
    ;Display "Uper case to lower case is:" prompt
    mov ah,09h
    lea dx,b
    int 21h
    
    ;print the output character
    mov ah,02h
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main