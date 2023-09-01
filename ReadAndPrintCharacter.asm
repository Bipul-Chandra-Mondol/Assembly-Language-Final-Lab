.model small
.stack 100h
.data
msg db "Hello,Bipul"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h  ;09h function is used to print string
    lea dx,msg  ;load effective address of msg
    int 21h     ;call interrapt 21h
    
    ;exit the program
    mov ah,4ch   ;4ch edit the program
    int 21h
    main endp
end main