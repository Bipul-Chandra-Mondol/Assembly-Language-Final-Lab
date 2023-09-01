.model small
.stack 100h
.data
a db 'Enter the dividend: $'    
b db 10,13, 'Enter the divisor: $'
c db 10,13,'result: $'  

num1 db ?
num2 db ? 
result db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,a
    int 21h
    
    mov ah,01h
    int 21h
    mov num1,al
    sub num1,48

            
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,01h
    int 21h
    mov num2,al
    sub num2,48 
    
    
    mov al,num1
    xor ah,ah 
    div num2 
    mov result,al
    add result,48
    
    
    mov ah,09h
    lea dx,c
    int 21h
    
    mov ah,02h
    mov dl,result
    int 21h   
    
    main endp
end main