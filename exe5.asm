;5. Sa se implementeze un program de autentificare. Programul are definit in segmentul de date un sir de caractere numit 'parola'. 
;Programul va cere utilizatorului sa introduca parola de la tastatura si va verifica daca aceasta este identica cu sirul 'parola' 
;din segmentul de date si va afisa un mesaj corespunzator. 
;Programul tot cere utilizatorului parola, pana cand acesta o ghiceste.

assume cs:code, ds:data
data segment

p db 'parola'
lp equ($-p)
s db 10, 'Introduceti parola:$'
s2 db 10, 'Parola gresita!$'
s3 db 10, 'Reintroduceti parola:$'
s4 db 10, 'Ati introdus parola corecta!$'
d db 30,?,30 dup(?)
ld db(?)
newline db 10,13,'$'

data ends

code segment 
start:

mov ax, data 
mov ds, ax 

mov ah, 09h
mov dx, offset s 
int 21h

;citim sirul de la tastatura
citire:
mov ah, 0Ah
mov dx, offset d 
int 21h

mov ah,02h
mov dl,newline      
int 21h

mov di,2
mov al,byte ptr d[1]
mov ld,al
mov si,0

cmp ld, ls
je next
jne citiree

citiree:
mov ah, 09h
mov dx, offset s2 
int 21h

mov ah,02h
mov dl,newline      
int 21h

mov ah, 09h
mov dx, offset s3 
int 21h

jmp citire 

next: 
mov cx,ls
repeta:
mov al, byte ptr p[si]
mov bl, byte ptr d[di]
cmp al, bl
je ok
jne nextt

nextt:
mov ah, 09h
mov dx, offset s2 
int 21h

mov ah,02h
mov dl,newline      
int 21h

mov ah, 09h
mov dx, offset s3 
int 21h

jmp citire

ok:
inc si
inc di

loop repeta

afisare:
mov ah, 09h
mov dx, offset s4
int 21h

mov ax,4c00h
int 21h
code ends
end start