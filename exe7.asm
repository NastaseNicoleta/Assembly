;7. Se sa citeasca un sir de cifre a. Sa se salveze in sirul c doar cifrele impare. Sa se afiseze sirul c pe ecran.

assume cs:code, ds:data
data segment

a db 30,?,10 dup (?)
la db ?
b db 30 dup(?)
newline db 10, 13, '$'
doi db 2

data ends

code segment
start:

mov ax, data 
mov ds, ax 

mov ah, 0Ah
mov dx, offset a 
int 21h

mov ah, 02h
mov dl, newline
int 21h

mov di, 0
mov si, 2
mov cl, a[1]
mov ch, 0

repeta:
mov al, byte ptr a[si]
mov bl, al 
sub al, '0'
cbw
idiv doi 
cmp ah, 0
je next
jne adauga

adauga: 
mov byte ptr b[di], bl 
inc di 

next:
inc si
loop repeta 

;afisare sir 
mov bl, '$'
mov byte ptr b[di], bl
mov ah, 09h
mov dx, offset b
int 21h

mov ax, 4c00h
int 21h

code ends
end start