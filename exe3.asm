;3. Se da un sir de litere mari si mici. Sa se afiseze literele mici pe ecran si sa se afiseze numarul acestor litere pe ecran.

assume cs:code, ds:data
data segment

s db 'AbCdEfGhIjK$'
ls equ($-s)
d db ?
ld db ls dup(?)
literemici db 'abcdefghijklmnopqrstuvwyxz$'
lliteremici equ $-literemici)
contor db 0
copie dw 0
newline db 10, 13, '$'

data ends

code segment 
start:

mov ax, data
mov ds, ax

mov cx, ls 
mov copie, cx 
mov si, 0
mov di, 0

repeta:

mov cl, lliteremici
mov ch,0
mov bp, 0

repeta_literemici:
mov al, byte ptr s[si]
mov bl, byte ptr literemici[bp]
inc bp 
cmp al, bl 
je adaugare
jne next

adaugare:
mov byte ptr d[di], al
inc di 
inc contor 

next:
inc si 
loop repeta_literemici

;afisare sir
mov ah, 09h
mov dx, offset d 
int 21h

mov ah,02h
mov dl,newline         ;pune enter
int 21h

;afisare contor
mov dl, contor 
add dl,'0'
mov ah,02h
int 21h

mov ax, 4C00h
int 21h
code ends
end start

