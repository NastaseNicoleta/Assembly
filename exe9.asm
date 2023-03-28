;9. Se da un sir de litere mari si mici. Sa se afiseze literele mari pe ecran si sa se afiseze numarul acestor litere pe ecran.

assume cs:code, ds:data
data segment

s db 'BUGhfstOP$'
ls equ($-s)
d db ?
ld db ls dup(?)
contor db 0
newline db 10,13,'$'

data ends

code segment
start:

mov ax, data
mov ds, ax

mov si,0
mov di,0
mov cx, ls

repeta:
mov al, byte ptr s[si]
inc si
cmp al, 'A'
jl next
jge continua

continua:
cmp al, 'Z' 
jg next
jle continua2

continua2:
mov byte ptr d[di],al
inc di
inc contor

next:
loop repeta

mov bl, '$'
mov d[di], bl
mov ah, 09h
mov dx, offset d
int 21h

mov ah, 02h
mov dl, newline
int 21h

mov bl, contor
add bl, '0'
mov contor, bl
mov ah, 02h
mov dl, contor
int 21h

mov ax, 4c00h
int 21h

code ends
end start