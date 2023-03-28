;10. Se citeste un sir de caractere de la tastatura. Se da un constanta K reprezentand o litera.
;Sa se determine numarul de aparitii a lui K in sirul citit. 
;Sa se afiseze acest numar pe ecran.

assume cs:code, ds:data
data segment

s db 30,?,10 dup(?)
ls db ?
K db 'n'
contor db 0
newline db 10,13,'$'

data ends

code segment
start:

mov ax, data
mov ds, ax

mov ah, 0Ah
mov dx, offset s 
int 21h

mov ah, 02h
mov dl, newline
int 21h

;determinarea lungimii sirului
mov si, 2
mov al, s[1]

mov ls, al

mov cl, ls
mov ch, 0

repeta:
	mov al, byte ptr s[si]
	cmp al, K
	je crestere
	jne next

crestere:
	inc contor
next:
	inc si

loop repeta
	

mov ah, 02h
mov dl, newline
int 21h

mov ah, 02h
mov dl, contor
add dl,'0'
int 21h

mov ax, 4c00h
int 21h

code ends 
end start

