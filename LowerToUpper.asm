.model small
.stack 100h
.data
a db 'Enter a character: $'
b db 10,13,'Lower case to uper case is: $'

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
    cmp bl,'a'
    jb not_lower ;jump if character < 'a'
    cmp bl,'z'
    ja not_lower ;jump if character > 'z'
    
    sub bl,32  ;convert lowe case to uper
    
not_lower:
    ;Display "Lower case to Upper case is:" prompt
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