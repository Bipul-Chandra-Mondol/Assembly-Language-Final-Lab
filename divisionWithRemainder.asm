.model small
.stack 100h
.data
a db 'Enter Dividant: $'
b db 10,13,'Enter divisor: $'
c db 10,13,'Result: $'
d db 10,13,'Remainder: $'

num1 db ?
num2 db ?
result db ?
remainder db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,a
    int 21h
    
    ;take inpt diidant
    mov ah,01h
    int 21h
    mov num1,al
    sub num1,48
    
    ;display prompt
     mov ah,09h
    lea dx,b
    int 21h
    
    ;take inpt divisor
    mov ah,01h
    int 21h
    mov num2,al
    sub num2,48
    
    ;do division
    mov al,num1
    xor ah ,ah   ;clear ax register
    div num2     ;al=al/num2
    mov result,al
    mov remainder,ah
    
    add result,48
    add remainder,48
    
    ;display prompt
    mov ah,09h
    lea dx,c
    int 21h
    
    ;print result
    mov ah,02h
    mov dl,result
    int 21h
    
    ;display prompt
    mov ah,09h
    lea dx,d
    int 21h
    
    ;display remainder
    mov ah,02h
    mov dl,remainder
    int 21h
    
    ;exit program
    mov ah,4ch
    int 21h
    main endp
end main