.model small
.stack 100h
.data
a db 'Enter First digit/character: $'
b db 10,13,'Enter Second digit/character: $'  
c db 10,13,'Largest number: $'
.code
main proc
    mov ax, @data        ; Load the data segment address into AX
    mov ds, ax           ; Set DS to point to the data segment

    ; Display the prompt "Firast digit/character"
    lea dx, a            ; Load the address of a
    mov ah, 09h           ; AH=9 indicates a print string function
    int 21h              ; Call interrupt 21h (DOS) to display the prompt
    
    ; Read the first digit/character from the user
    mov ah, 01h          ;  a character input function
    int 21h              ; Call interrupt 21h to read a character from the user
    mov bl, al           ; Store the ASCII value of the first digit in BL
    
    ;display the pront:"Enter second digit/character"
    lea dx,b
    mov ah,09h
    int 21h

    ; Read the second digit/character from the user
    mov ah,01h          
    int 21h              
    mov bh, al           

    ; Compare the two digits using their ASCII values
    cmp bl, bh      ; Compare the values in BL (first digit) and BH (second digit)
    jg l1           ; Jump to label l1 if the first digit is greater than the second digit
    jmp l2          ; Jump to label l2 if the first digit is not greater

l2:
    ; Display the prompt "Largest number"
    lea dx, c            ; Load the address of the message into DX
    mov ah, 09h          ; AH=9 indicates a print string function
    int 21h              ; Call interrupt 21h (DOS) to display the message

    ; Display the largest number (second digit/number)
    mov ah, 02h          ; AH=02h indicates a character output function
    mov dl, bh           ; Load the ASCII value of the second digit into DL
    int 21h              ; Call interrupt 21h to display the second digit
    ; Jump to the exit label to terminate the program
    jmp exit

l1:
    ; Display the prompt "Largest number"
    lea dx, c            ; Load the address of the message into DX
    mov ah, 09h            ; AH=9 indicates a print string function
    int 21h              ; Call interrupt 21h (DOS) to display the message

    ; Display the largest number (first digit)
    mov ah, 02h           ; AH=2 indicates a character output function
    mov dl, bl           ; Load the ASCII value of the first digit into DL
    int 21h              ; Call interrupt 21h to display the first digit
    ; Jump to the exit label to terminate the program
    jmp exit

exit:
    ; Terminate the program by returning control to DOS
    mov ah, 4ch           ; AH=4Ch indicates an exit function
    int 21h               ; Call interrupt 21h (DOS) to exit the program

main endp
end main
    