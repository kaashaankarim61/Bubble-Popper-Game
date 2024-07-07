[org 0x0100]
jmp start

;
No_of_Ballons_Poppped: dw 0 
end_pex_col: dw 0
end_pex_row: dw 0
start_pex_col: dw 0
start_pex_row: dw 0

;for printing NUmber
number: dw 4
ascii_n: db 0
Count_n: dw 0
pos: db 0
Total_n: dw 0
Row_n: db 0
Col_n: db 0


Score_Board: db 'Score Board'
msg4: db 'Balloon Popped : '


Index: dw 0

ascii_n_2: db 0
Count_n_2: dw 0
Total_n_2: dw 0
Row_n_2: db 0
Col_n_2: db 0


ascii_n_3: db 0
Count_n_3: dw 0
Total_n_3: dw 0
Row_n_3: db 0
Col_n_3: db 0

cu: dw 30
Int_Col_c_mul_8: db 0

DL__: db 0
DH__: db 4

Char_to_Show_Global: db '&'
system_time_seconds: db 0

;keyboard
key: db '+'
key_press: db '}'
key_ascii: db ';'

;Single Pexels
pex_r:dw 0
pex_c:dw 0
pex_Color:db 0

;bubble_Printing
S_Row_: dw 0
S_Col_: dw 0
E_Row_: dw 0
E_Col_: dw 0

Int_S_Row_: dw 0
Int_S_Col_: dw 0
Int_E_Row_: dw 0
Int_E_Col_: dw 0

Bubble_color_: db 0
Pex_Color_: db 0
Pex_Count: dw 0
Pex_Lines_: dw 0
Blocks: dw 0

;character_printing
Character: db 0
Int_Row_c: db 0
Int_Col_c: db 0

Bubble_off_1: db 0
Bubble_off_2: db 0
Bubble_off_3: db 0

;Position And offset

Intial_Pos1: dw 36  ; offset 1:-28 offset_2:- 
Intial_Pos2: dw 0
Intial_Pos3: dw 0
Difference: dw 0
Total_Bubbles: dw 5  ; offset 1:- 5 offset_2:-
offset_: dw 0
Skip_Space: dw 0


;Printing lines
Line_Row: dw 0
Line_Color: db 0


GAME_FLAG: db 0

;Time
Time: dw 0
Minute: dw 0

Score_: dw 0

Random: dw 0
Tick: db 0

Loop_Stop_After: dw 120
;Flags
key_flag:db 0

Character_Array_1: db 'a','q','y','b','j','l','z','f','d','a','m','x','w','i','t','f','u','s','p','b','v','n','c','g','e','r','k','o','h','d','a','q','y','b','j','l','z','f','d','a'


Print_the_time: 
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigit: 
mov dx, 0 ; zero upper half of dividend
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax, 0 ; is the quotient zero
jnz nextdigit ; if no divide it again
mov word[Count_n], cx

nextpos: 
pop bx ; remove a digit from the stack
mov byte[ascii_n], bl

mov DH, Byte[Row_n] ;row as per text mode
mov DL, Byte[Col_n] ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, Byte[ascii_n] ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int

sub word[Count_n], 1
add word[Col_n], 1
cmp word[Count_n], 0
jne nextpos
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2


Print_the_Score: 
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigit_2: 
mov dx, 0 ; zero upper half of dividend
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax, 0 ; is the quotient zero
jnz nextdigit_2 ; if no divide it again
mov word[Count_n_2], cx

nextpos_2: 
pop bx ; remove a digit from the stack
mov byte[ascii_n_2], bl

mov DH, Byte[Row_n_2] ;row as per text mode
mov DL, Byte[Col_n_2] ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, Byte[ascii_n_2] ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int

sub word[Count_n_2], 1
add word[Col_n_2], 1
cmp word[Count_n_2], 0
jne nextpos_2
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2




Print_the_Number_of_Balloons_Popped: 
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigit_3_: 
mov dx, 0 ; zero upper half of dividend
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax, 0 ; is the quotient zero
jnz nextdigit_3_ ; if no divide it again
mov word[Count_n_3], cx

nextpos_3_: 
pop bx ; remove a digit from the stack
mov byte[ascii_n_3], bl

mov DH, Byte[Row_n_3] ;row as per text mode
mov DL, Byte[Col_n_3] ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, Byte[ascii_n_3] ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int

sub word[Count_n_3], 1
add word[Col_n_3], 1
cmp word[Count_n_3], 0
jne nextpos_3_
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2


sleep: 
push cx
mov cx, 0xFFFF
delay1: loop delay1
mov cx, 0xFFFF
delay2: loop delay2
mov cx, 0xFFFF
delay3: loop delay3
mov cx, 0xFFFF
delay5: loop delay5
mov cx, 0xFFFF
delay6: loop delay6
pop cx
ret

sleep_small: 
push cx
mov cx, 0xFFFF
delay1_: loop delay1
pop cx
ret

scroll_Up:
mov AL, 1 ;= number of lines by which to scroll (00h = clear entire window).
mov BH, 0x64 ;= attribute used to write blank lines at bottom of window.
mov CH, 4; top left corner row
mov CL, 0; top left corner col
mov DH, 24; bottom right corner row
mov DL, 78; bottom right corner col
mov AH, 06h
INT 10h 
ret



Bubble_Randomization:
pusha
mov AH, 2Ch 
INT 21h
mov ax, 0
mov al, dh
mov cl, 5
div cl
mov Byte[Bubble_off_1], ah
mov ax, word[Time]
div cl
mov Byte[Bubble_off_2], ah
mov ax, word[Score_]
div cl
mov Byte[Bubble_off_3], ah

popa
ret

Print_The_Bubble_line_1:
push ax
push bx
push cx
push dx

mov word[Blocks], 0
mov word[Pex_Lines_],8

mov ax, [Intial_Pos1]; 
mov word[Int_S_Col_],ax
mov word[Int_S_Row_],192

mov word[Int_E_Col_],ax
add word[Int_E_Col_],12

mov ax, word[Int_S_Col_]
mov word[S_Col_],ax
mov word[S_Row_],192
mov ax, word[Int_E_Col_];
mov word[E_Col_], ax
 
Loop_bubble:
cmp word[Blocks], 0
je Inner_loop_bub_

mov word[Pex_Lines_],8

mov ax, 60
mov cx, word[Blocks]
mul cx
add ax, word[Int_S_Col_]
mov word[S_Col_], ax

mov ax, word[S_Col_]
add ax, 12
mov word[E_Col_], ax

mov word[S_Row_],192

mov ax, 0
mov cx, 0
mov dx, 0
mov bx, 0

Inner_loop_bub_:

    mov ah, 0x0C
	mov Byte[Bubble_color_], 0x35
	mov al, Byte[Bubble_color_];
	
	mov cx, word[Blocks]
	cmp Byte[Bubble_off_1],cl
	jne next_Bubble1
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_];
	
	next_Bubble1:
	mov cx, word[Blocks]
	cmp cl, Byte[Bubble_off_2]
	jne Dont_Off_the_Bubble
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_]
	
	
	Dont_Off_the_Bubble:
	mov bh, 0
	mov bl, 0
	mov cx, word[S_Col_];20
	mov dx, word[S_Row_];191
	int 0x10
	l1:
	inc cx
	int 10h
	cmp cx, Word[E_Col_];32
	jne l1
	
	add word[S_Row_],1
	sub word[S_Col_],1
	add word[E_Col_],1
	sub word[Pex_Lines_], 1
	
	cmp word[Pex_Lines_], 0
	jne Inner_loop_bub_

	add word[Blocks], 1
	mov ax, word[Total_Bubbles]
	cmp word[Blocks], ax
	jne Loop_bubble
	
	
pop dx
pop cx
pop bx
pop ax	
ret


Print_The_Bubble_line_2:
push ax
push bx
push cx
push dx
mov word[Blocks], 0
mov word[Pex_Lines_],8
mov ax, word[Intial_Pos1]
sub ax, 7
mov word[Intial_Pos2], ax
mov word[Int_S_Col_],ax
add ax, 26
mov word[Int_S_Row_],192
mov word[Int_E_Col_],ax

mov ax, word[Int_S_Col_]
mov word[S_Col_],ax
mov word[S_Row_],192
mov ax, word[Int_E_Col_]
mov word[E_Col_],ax



Loop_bubble2:

cmp word[Blocks], 0
je Inner_loop_bub_2
mov word[S_Row_],192
mov word[Pex_Lines_],8

mov ax, 60
mov cx, word[Blocks]
mul cx
add ax, word[Int_S_Col_]
mov word[S_Col_], ax

mov ax, word[S_Col_]
add ax, 26
mov word[E_Col_], ax


mov ax, 0
mov cx, 0
mov dx, 0
mov bx, 0

Inner_loop_bub_2:

    mov ah, 0x0C
	mov Byte[Bubble_color_], 0x35
	mov al, Byte[Bubble_color_];
	
	mov cx, word[Blocks]
	cmp Byte[Bubble_off_1],cl
	jne next_Bubble2
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_];
	
	next_Bubble2:
	mov cx, word[Blocks]
	cmp cl, Byte[Bubble_off_2]
	jne Dont_Off_the_Bubble_
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_]
	
	Dont_Off_the_Bubble_:
	mov bh, 0
	mov bl, 0
	mov cx, word[S_Col_];20
	mov dx, word[S_Row_];191
	int 0x10
	l2:
	inc cx
	int 10h
	cmp cx, Word[E_Col_];32
	jne l2
	
	add word[S_Row_],1
	sub word[Pex_Lines_], 1
	
	cmp word[Pex_Lines_], 0
	jne Inner_loop_bub_2

   

	add word[Blocks], 1
	mov ax, word[Total_Bubbles]
	cmp word[Blocks], ax
	jne Loop_bubble2

call Print_The_Character_line
;call Tackle_Black_Pexels2

pop dx
pop cx
pop bx
pop ax
ret




Print_The_Bubble_line_3:
push ax
push bx
push cx
push dx
mov word[Blocks], 0
mov word[Pex_Lines_],8
mov ax, word[Intial_Pos1]  ; 20-6
sub ax, 6
mov word[Intial_Pos3], ax
mov word[Int_S_Col_], ax  ;14
mov word[Int_S_Row_],192
add ax, 24
mov word[Int_E_Col_], ax  ; 38


mov ax, word[Int_S_Col_]
mov word[S_Col_],ax
mov word[S_Row_],192
mov ax, word[Int_E_Col_]
mov word[E_Col_],ax



Loop_bubble3:

cmp word[Blocks], 0
je Inner_loop_bub_3

mov word[S_Row_],192
mov word[Pex_Lines_],8

mov ax, 60
mov cx, word[Blocks]
mul cx
add ax, word[Int_S_Col_]
mov word[S_Col_], ax

mov ax, word[S_Col_]
add ax, 24
mov word[E_Col_], ax


mov ax, 0
mov cx, 0
mov dx, 0
mov bx, 0

Inner_loop_bub_3:

    mov ah, 0x0C
	mov Byte[Bubble_color_], 0x35
	mov al, Byte[Bubble_color_];
	
	mov cx, word[Blocks]
	cmp Byte[Bubble_off_1],cl
	jne next_Bubble3
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_];
	
	next_Bubble3:
	mov cx, word[Blocks]
	cmp cl, Byte[Bubble_off_2]
	jne Dont_Off_the_Bubble__
	
    mov Byte[Bubble_color_], 0x64
	mov al, Byte[Bubble_color_]
	
	Dont_Off_the_Bubble__:
	mov bh, 0
	mov bl, 0
	mov cx, word[S_Col_];20
	mov dx, word[S_Row_];191
	int 0x10
	l3:
	inc cx
	int 10h
	cmp cx, Word[E_Col_];32
	jne l3
	
	add word[S_Row_],1
	sub word[Pex_Lines_], 1
	add word[S_Col_], 1
	sub word[E_Col_], 1
	
	cmp word[Pex_Lines_], 0
	jne Inner_loop_bub_3

	add word[Blocks], 1
	mov ax, word[Total_Bubbles]
	cmp word[Blocks], ax
	jne Loop_bubble3


pop dx
pop cx
pop bx
pop ax
ret

one_Second:
call sleep
call sleep
call sleep
ret


multiply_it_by_8:
push ax
push cx
mov ah, 0
mov al, BYte[Int_Col_c]
mov ch, 0
mov cl, 4
mul cx
mov BYte[Int_Col_c_mul_8], al
pop ax
pop cx
ret

Bubbly_Bubbly:
cmp word[Skip_Space], 1
je Printing_Empty_space

cmp word[offset_], 0
je Bubble_offset_0

Bubble_offset_1:
mov word[Intial_Pos1], 53
mov word[Total_Bubbles], 4
mov word[offset_], 0
jmp Now_Print_Bubbles


Bubble_offset_0:
mov word[Intial_Pos1], 28
mov word[Total_Bubbles], 5
mov word[offset_], 1
jmp Now_Print_Bubbles

Now_Print_Bubbles
call Print_The_Bubble_line_1
call scroll_Up
call sleep
call Print_The_Bubble_line_2
call scroll_Up
call sleep
call Print_The_Bubble_line_3
mov word[Skip_Space], 1


Printing_Empty_space:
call sleep
call sleep_small
call scroll_Up
call sleep
call sleep_small
call scroll_Up
call sleep
call sleep_small
call scroll_Up
call sleep
call sleep_small
mov word[Skip_Space],0 

Returning_from_bubbly:
Ret


Print_The_Character_line_for_offset_0:
pusha

cmp word[Index], 27
jb Not_equal

mov word[Index],0

Not_equal:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 7
mov Cx, 58
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_1_

call Print_The_Character_in_Bubble

mov_to_next_1_:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 15
mov Cx, 117
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_2_


call Print_The_Character_in_Bubble

mov_to_next_2_:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 22
mov Cx, 180
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_3_

call Print_The_Character_in_Bubble


mov_to_next_3_:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 29
mov Cx, 237
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_return_

call Print_The_Character_in_Bubble

mov_to_return_:
popa
ret

Print_The_Character_line:
call Character_Randomization
mov Byte[Int_Row_c], 24
mov Byte[Int_Col_c], 0

cmp word[offset_], 0
je Char_off_0
jne Char_off_1
Char_off_0:
call Print_The_Character_line_for_offset_0
ret



Char_off_1:
mov Byte[Int_Col_c], 4
mov Cx, 40
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_1

call Print_The_Character_in_Bubble


mov_to_next_1:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 11
mov Cx, 103
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_2
call Print_The_Character_in_Bubble

mov_to_next_2:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 19
mov Cx, 160
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_3

call Print_The_Character_in_Bubble

mov_to_next_3:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 26
mov Cx, 220
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne mov_to_next_4
call Print_The_Character_in_Bubble

mov_to_next_4:
mov bx, word[Index]
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
mov al, 0

mov Byte[Int_Col_c], 34
mov Cx, 280
mov dx, 195
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
jne Returning_from_charry
call Print_The_Character_in_Bubble


jmp Returning_from_charry

mov Byte[Int_Col_c], 0

Returning_from_charry:
Ret








;functions
clear_the_screen:
push ax
push bx
push cx
push dx
MOV AX,0013H
INT 10H 
mov ax, 0x0C64
mov bh, 0 
mov bl, 0
mov cx, 0; column
mov dx, 0;row
int 0x10
clear:
inc cx
int 10h
cmp cx, 320
jne clear
inc dx
mov cx, 0
cmp dx, 200
jne clear
pop dx
pop cx
pop bx 
pop ax
Ret



BLUE_screen:
push ax
push bx
push cx
push dx
MOV AX,0013H
INT 10H 
mov ax, 0x0C35
mov bh, 0 
mov bl, 0
mov cx, 0; column
mov dx, 0;row
int 0x10
clear_BLUE:
inc cx
int 10h
cmp cx, 320
jne clear_BLUE
inc dx
mov cx, 0
cmp dx, 200
jne clear_BLUE
pop dx
pop cx
pop bx 
pop ax
Ret


Print_the_single_Pexel:
push ax
push bx
push cx
push dx
MOV AX, word[pex_r] ;
mov cx, 320
mul cx
add Ax, word[pex_c]
MOV BX, AX ; BX := Y * 320 + X
MOV AX,0A000H ; ES := A000
MOV ES,AX ; start of VGA area
MOV AL, byte[pex_Color]
MOV [ES:BX],AL ; Store pixel byte
pop dx
pop cx
pop bx 
pop ax
Ret





Print_The_Score_Baar_:
push ax
push bx
push cx
push dx
MOV AX, 0 ;
MOV BX,AX ; BX := Y * 320 + X
MOV AX,0A000H ; ES := A000
MOV ES,AX ; start of VGA area
MOV AL, 0x40 ;
mov cx, 8000
loop2:
MOV [ES:BX],AL ; Store pixel byte
inc bx
loop loop2

mov word[Line_Row],0
mov Byte[Line_Color], 0x42
call Print_Line
mov word[Line_Row],24
mov Byte[Line_Color], 0x42
call Print_Line

mov al, 1 
mov bh, 0 ;page_number
mov bl, 00001111b ;color
mov cx, 5  ;size
mov dl, 30 ;col
mov dh, 1  ;row
push cs
pop es
mov bp, msg1
mov ah, 13h ;servixe
int 10h
jmp msg1end
msg1: db "Time:"
msg1end:


mov al, 1
mov bh, 0
mov bl, 00001111b
mov cx, 8
mov dl, 0
mov dh, 1
push cs
pop es
mov bp, msg2
mov ah, 13h
int 10h
jmp msg2end
msg2: db " Score: "
msg2end:
pop dx
pop cx
pop bx 
pop ax
Ret


Tackle_Black_Pexels:
push ax
push bx
push cx
push dx
mov CX, 0
mov dx, 8
Color_changing:
Mov AH ,0Dh
INT 10h 
cmp al, 0x00
je Change_The_Color
jne Dont_Change_The_Color
Change_The_Color:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x40
call Print_the_single_Pexel
Dont_Change_The_Color:
inc cx
cmp cx, 320
jne Color_changing
increment:
mov cx, 0
inc dx
cmp dx, 17
jne Color_changing
pop dx
pop cx
pop bx 
pop ax
Ret



Tackle_Black_Pexels___:
push ax
push bx
push cx
push dx
mov CX, 0
mov dx, 8
Color_changing___:
Mov AH ,0Dh
INT 10h 
cmp al, 0x00
je Change_The_Color___
jne Dont_Change_The_Color___
Change_The_Color___:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x35
call Print_the_single_Pexel
Dont_Change_The_Color___:
inc cx
cmp cx, 320
jne Color_changing___
increment___:
mov cx, 0
inc dx
cmp dx, 200
jne Color_changing___
pop dx
pop cx
pop bx 
pop ax
Ret


Tackle_Black_Pexels2:
push ax
push bx
push cx
push dx
mov CX, 0
mov dx, 192
Color_changing2:
Mov AH ,0Dh
INT 10h 
cmp al, 0x00
je Change_The_Color2
jne Dont_Change_The_Color2
Change_The_Color2:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x35
call Print_the_single_Pexel
Dont_Change_The_Color2:
inc cx
cmp cx, 320
jne Color_changing2
increment2:
mov cx, 0
inc dx
cmp dx, 200
jne Color_changing2
pop dx
pop cx
pop bx 
pop ax
Ret

Print_Line:
push ax
push bx
push cx
push dx
MOV AX, word[Line_Row] ;
mov cx, 320
mul cx
MOV BX, AX ; BX := Y * 320 + X
MOV AX,0A000H ; ES := A000
MOV ES,AX ; start of VGA area
MOV AL, byte[Line_Color]
mov cx, 320
looping:
MOV [ES:BX],AL ; Store pixel byte
inc bx
loop looping
pop dx
pop cx
pop bx 
pop ax
Ret

 
 
Print_The_Character_in_Bubble:
push ax
push bx
push cx
push dx
mov DH, Byte[Int_Row_c] ;  row as per text mode
mov DL, Byte[Int_Col_c] ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, Byte[Character] ;ascii
mov BH,0 ; page
mov BL, 0x0F ; attribute
mov Dx, 0x34
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int
pop dx
pop cx
pop bx 
pop ax
Ret
 
Timer:
add word[Time], 1
cmp word[Time], 60
jne Return_time
add word[Minute],1
mov word[Time], 0
;cursor setting
mov DH, 1 ;  row as per text mode
mov DL, 0x26 ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int
;character at cursor
mov AL, ' ' ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int
Return_time:
Ret


Show_Time
push ax
call Timer
mov Byte[Row_n], 1
mov Byte[Col_n], 0x25
mov ax, Word[Time]
push ax
call Print_the_time
pop ax
Ret
 
Show_Minute:
mov Byte[Row_n], 1
mov Byte[Col_n], 0x23
mov ax, Word[Minute]
push ax
call Print_the_time
Ret

 
Character_Randomization:
push ax
push bx
push cx
push dx

cmp word[Index], 26
jb Ahead
mov word[Index], 0



Ahead:
mov bx, 0
mov bx, word[Index],
mov al, Byte[Character_Array_1 + bx]
mov Byte[Character], al
inc word[Index]
Returning_the_character:
pop dx
pop cx
pop bx 
pop ax
Ret 
 
 
print_colon:
mov DH, 1 ;  row as per text mode
mov DL, 0x24 ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, ':' ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int
Ret

  
  
  
kbisr: push ax
 push es
 mov ax, 0x0A000
 mov es, ax ; point es to video memory
 in al, 0x60 ; read a char from keyboard port
 
 
 cmp al, 0x10 ; is the key left shift
 jne nextcmp_1_ ; no, try next comparison
 mov byte[key_ascii],'q'
 ;call Show_key_press
 jmp nomatch ; leave interrupt routine
 
 
nextcmp_1_: 
 cmp al, 0x11 ; is the key right shift
 jne nextcmp_2_  ; no, leave interrupt routine
mov byte[key_ascii],'w'
 ;call Show_key_press
 
 
nextcmp_2_:
cmp al, 0x12 ; is the key right shift
 jne nextcmp_3_  ; no, leave interrupt routine
mov byte[key_ascii],'e'
 ;call Show_key_press

nextcmp_3_:
cmp al, 0x13 ; is the key right shift
 jne nextcmp_4_  ; no, leave interrupt routine
mov byte[key_ascii],'r'
 ;call Show_key_press
 
nextcmp_4_:
cmp al, 0x14 ; is the key right shift
 jne nextcmp_5_  ; no, leave interrupt routine
mov byte[key_ascii],'t'
 ;call Show_key_press
 
nextcmp_5_:
cmp al, 0x15 ; is the key right shift
 jne nextcmp_6_  ; no, leave interrupt routine
mov byte[key_ascii],'y'
 ;call Show_key_press
 
nextcmp_6_:
cmp al, 0x16 ; is the key right shift
 jne nextcmp_7_  ; no, leave interrupt routine
mov byte[key_ascii],'u'
 ;call Show_key_press
 
nextcmp_7_:
cmp al, 0x17 ; is the key right shift
 jne nextcmp_8_  ; no, leave interrupt routine
mov byte[key_ascii],'i'
 ;call Show_key_press
 
 
nextcmp_8_:
cmp al, 0x18 ; is the key right shift
 jne nextcmp_9_  ; no, leave interrupt routine
mov byte[key_ascii],'o'
 ;call Show_key_press
 
 
nextcmp_9_:
cmp al, 0x19 ; is the key right shift
 jne nextcmp_10_  ; no, leave interrupt routine
mov byte[key_ascii],'p'
 ;call Show_key_press

nextcmp_10_:
cmp al, 0x1E ; is the key right shift
 jne nextcmp_11_  ; no, leave interrupt routine
mov byte[key_ascii],'a'
 ;call Show_key_press

nextcmp_11_:
cmp al, 0x1F ; is the key right shift
 jne nextcmp_12_  ; no, leave interrupt routine
mov byte[key_ascii],'s'
 ;call Show_key_press

nextcmp_12_:
cmp al, 0x20 ; is the key right shift
 jne nextcmp_13_  ; no, leave interrupt routine
mov byte[key_ascii],'d'
 ;call Show_key_press
 
 
nextcmp_13_:
cmp al, 0x21 ; is the key right shift
 jne nextcmp_14_  ; no, leave interrupt routine
mov byte[key_ascii],'f'
 ;call Show_key_press
 
 
nextcmp_14_:
cmp al, 0x22 ; is the key right shift
 jne nextcmp_15_  ; no, leave interrupt routine
mov byte[key_ascii],'g'
 ;call Show_key_press
 
 
nextcmp_15_:
cmp al, 0x23 ; is the key right shift
 jne nextcmp_16_  ; no, leave interrupt routine
mov byte[key_ascii],'h'
 ;call Show_key_press
 
 
nextcmp_16_:
cmp al, 0x24 ; is the key right shift
 jne nextcmp_17_  ; no, leave interrupt routine
mov byte[key_ascii],'j'
 ;call Show_key_press
 
 
 
nextcmp_17_:
cmp al, 0x25 ; is the key right shift
 jne nextcmp_18_  ; no, leave interrupt routine
mov byte[key_ascii],'k'
 ;;call Show_key_press
 
 
nextcmp_18_:
cmp al, 0x26 ; is the key right shift
 jne nextcmp_19_  ; no, leave interrupt routine
mov byte[key_ascii],'l'
 ;call Show_key_press
 
 
 
nextcmp_19_:
cmp al, 0x2C ; is the key right shift
 jne nextcmp_20_  ; no, leave interrupt routine
mov byte[key_ascii],'z'
 ;call Show_key_press
 
 
nextcmp_20_:
cmp al, 0x2D ; is the key right shift
 jne nextcmp_21_  ; no, leave interrupt routine
mov byte[key_ascii],'x'
 ;call Show_key_press
 
 
nextcmp_21_:
cmp al, 0x2E ; is the key right shift
 jne nextcmp_22_  ; no, leave interrupt routine
mov byte[key_ascii],'c'
 ;call Show_key_press
 
 
nextcmp_22_:
cmp al, 0x2F ; is the key right shift
 jne nextcmp_23_  ; no, leave interrupt routine
mov byte[key_ascii],'v'
 ;call Show_key_press
 
 
nextcmp_23_:
cmp al, 0x30 ; is the key right shift
 jne nextcmp_24_  ; no, leave interrupt routine
mov byte[key_ascii],'b'
 ;call Show_key_press
 
 
nextcmp_24_:
cmp al, 0x31 ; is the key right shift
 jne nextcmp_25_  ; no, leave interrupt routine
mov byte[key_ascii],'n'
 ;call Show_key_press
 
 
nextcmp_25_:
cmp al, 0x32 ; is the key right shift
 jne nomatch ; no, leave interrupt routine
mov byte[key_ascii],'m'
 ;call Show_key_press
 
 
nomatch: mov al, 0x20
 out 0x20, al ; send EOI to PIC
 pop es
 pop ax
 iret
  

Show_key_press:
push ax
push bx
push cx
push dx
mov DH, 0 ;  row as per text mode
mov DL, 0 ;  as per text mode
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AL, Byte[key_ascii] ;ascii
mov BH,0 ; page
mov BL,0x0F ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int
pop dx
pop cx
pop bx 
pop ax
Ret

  
  
Search_the_input_key_from_Screen:
push ax
push cx
push dx
push bx

;call Tackle_Blue_Pexels

;mov DH, 0x5 ;  row as per text mode
;mov DL, 0x4 ;  as per text mode
;mov bl, 0 ;not useful
;mov bh, 0 ; page
;mov AH , 2 ;service
;INT 10h ;int

mov Byte[DH__], 0x4
mov Byte[DL__], 0x0

Searching:
mov DH, Byte[DH__] ;  row as per text mode
mov DL, Byte[DL__];  as per text mode
;call Tackle_Blue_Pexels
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int

mov AH, 08h
mov BH ,0
INT 10h 

cmp Byte[key_ascii],al
je POP_IT
jne INC_COL


INC_COL:
inc Byte[DL__]
cmp Byte[DL__], 45
jne Searching


INC_ROW:
inc Byte[DH__]
mov BYTe[DL__], 0
cmp Byte[DH__], 25
jne Searching
je Return_POP

;call Tackle_Blue_Pexels_2

POP_IT:
;mov Byte[Char_to_Show_Global], al
;mov cx, 0x10
;push cx
;call Show_A_Character_on_Screen_For_testing
call Make_the_Bubble_Red_1
call sleep_small
call sleep_small
call Make_the_Bubble_BLUE_1
call sleep_small
call sleep_small
call Make_the_Bubble_Red_1
call CLEAR_the_Bubble_BLUE_1
add word[Score_], 10
add word[No_of_Ballons_Poppped],1
mov Byte[Char_to_Show_Global],'%'
mov Byte[key_ascii],']'


Return_POP: 
pop bx
pop dx
pop cx
pop ax
ret


Make_the_Bubble_Red_1:
push ax
push bx
push cx
push dx

cmp Byte[DL__], 4   ; row
je make_it_2
jne cmp_next1

cmp_next1:
cmp Byte[DL__], 7   ; row
jne make_it_1

make_it_2:
call Make_the_Bubble_Red_2
pop dx
pop cx
pop bx 
pop ax
ret 

make_it_1:
mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
mov cx, 7
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x35


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__:
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
je Change_The_Color__
;cmp al, 0x64
;je Change_The_Color__
cmp al, 0x00
je Change_The_Color__
jne Dont_Change_The_Color__
Change_The_Color__:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x40
call Print_the_single_Pexel
Dont_Change_The_Color__:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__
increment__:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__
pop dx
pop cx
pop bx 
pop ax
Ret



Make_the_Bubble_Red_2:
push ax
push bx
push cx
push dx

mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
sub ax, 1
mov cx, 6
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x34


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__2:
Mov AH ,0Dh
INT 10h 
cmp al, 0x35
;je Change_The_Color__2
;cmp al, 0x64
je Change_The_Color__2
cmp al, 0x00
je Change_The_Color__2
jne Dont_Change_The_Color__2
Change_The_Color__2:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x40
call Print_the_single_Pexel
Dont_Change_The_Color__2:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__2
increment__2:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__2
pop dx
pop cx
pop bx 
pop ax
Ret





Make_the_Bubble_BLUE_1:
push ax
push bx
push cx
push dx

cmp Byte[DL__], 4   ; row
je make_it_3
jne cmp_next2

cmp_next2:
cmp Byte[DL__], 7   ; row
jne make_it_4

make_it_3:
call Make_the_Bubble_BLUE_2
pop dx
pop cx
pop bx 
pop ax
ret 

make_it_4:
mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
mov cx, 7
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x35


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__3:
Mov AH ,0Dh
INT 10h 
cmp al, 0x40
je Change_The_Color__3
;cmp al, 0x64
;je Change_The_Color__
cmp al, 0x00
je Change_The_Color__3
jne Dont_Change_The_Color__3
Change_The_Color__3:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x35
call Print_the_single_Pexel
Dont_Change_The_Color__3:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__3
increment__3:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__3
pop dx
pop cx
pop bx 
pop ax
Ret



Make_the_Bubble_BLUE_2:
push ax
push bx
push cx
push dx

mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
sub ax, 1
mov cx, 6
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x34


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__4:
Mov AH ,0Dh
INT 10h 
cmp al, 0x40
;je Change_The_Color__2
;cmp al, 0x64
je Change_The_Color__4
cmp al, 0x00
je Change_The_Color__4
jne Dont_Change_The_Color__4
Change_The_Color__4:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x35
call Print_the_single_Pexel
Dont_Change_The_Color__4:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__4
increment__4:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__4
pop dx
pop cx
pop bx 
pop ax
Ret







CLEAR_the_Bubble_BLUE_1:
push ax
push bx
push cx
push dx

cmp Byte[DL__], 4   ; row
je make_it_3_INV
jne cmp_next2_INV

cmp_next2_INV:
cmp Byte[DL__], 7   ; row
jne make_it_4_INV

make_it_3_INV:
call CLEAR_the_Bubble_BLUE_2
pop dx
pop cx
pop bx 
pop ax
ret 

make_it_4_INV:
mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
mov cx, 7
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x35


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__3_INV:
Mov AH ,0Dh
INT 10h 
cmp al, 0x40
je Change_The_Color__3_INV
cmp al, 0x35
je Change_The_Color__3_INV
cmp al, 0x0F
je Change_The_Color__3_INV
;cmp al, 0x64
;je Change_The_Color__
cmp al, 0x00
je Change_The_Color__3_INV
jne Dont_Change_The_Color__3_INV
Change_The_Color__3_INV:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x64
call Print_the_single_Pexel
Dont_Change_The_Color__3_INV:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__3_INV
increment__3_INV:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__3_INV
pop dx
pop cx
pop bx 
pop ax
Ret



CLEAR_the_Bubble_BLUE_2:
push ax
push bx
push cx
push dx

mov ax, 0
mov al, Byte[DH__]
sub ax, 1
mov cx, 8
mul cx
mov dx, ax

mov word[start_pex_row],dx
mov word[end_pex_row], ax
add word[end_pex_row], 0x18

mov ah, 0
mov al, Byte[DL__] 
sub ax, 1
mov cx, 6
mul cx
sub cx, 4
mov cx, ax

mov word[start_pex_col],cx
mov word[end_pex_col], ax
add word[end_pex_col], 0x34


mov cx, word[start_pex_col] ;(4-1)*6 - 4
mov dx, word[start_pex_row]  ;4*8
Color_changing__4_INV:
Mov AH ,0Dh
INT 10h 
cmp al, 0x40
je Change_The_Color__4_INV
cmp al, 0x35
je Change_The_Color__4_INV
cmp al, 0x0F
je Change_The_Color__4_INV
jne Dont_Change_The_Color__4_INV
Change_The_Color__4_INV:
mov word[pex_r], dx
mov word[pex_c], cx
mov Byte[pex_Color], 0x64
call Print_the_single_Pexel
Dont_Change_The_Color__4_INV:
add cx, 1
cmp cx, word[end_pex_col] ; 56
jne Color_changing__4_INV
increment__4_INV:
mov cx, word[start_pex_col] ; 14
add dx, 1
cmp dx, word[end_pex_row] 
jne Color_changing__4_INV
pop dx
pop cx
pop bx 
pop ax
Ret





Show_A_Character_on_Screen_For_testing:
push bp
mov bp, sp
push ax
push bx
push cx
push dx
mov Dx, [bp + 4]
mov bl, 0 ;not useful
mov bh, 0 ; page
mov AH , 2 ;service
INT 10h ;int
mov AL, ' ';Byte[Char_to_Show_Global] ;ascii
mov BH,0 ; page
mov BL,0x64 ; attribute
mov CX,1 ; times
mov ah, 9h ;servie
INT 10h ;int
pop dx
pop cx
pop bx
pop ax
pop bp
ret 2


Show_Score:
mov ax, word[Score_]
push ax
mov word[Row_n_2], 1
mov word[Col_n_2], 8
call Print_the_Score
ret

start:
 mov word[Random], 4
 call clear_the_screen
 Call Print_The_Score_Baar_
 call print_colon
 mov ax, 0
 mov bx, 0
 mov cx, 0
 mov dx, 0
 
Game_Loop:
RUN_THE_GAME:
add word[Random], 1
cmp word[Index], 27
jb No_Obstacle
mov word[Index], 0
No_Obstacle:
call Show_Time
call Show_Minute
call Tackle_Black_Pexels
call Bubble_Randomization
call Tackle_Black_Pexels
call Bubbly_Bubbly
call Search_the_input_key_from_Screen
call Show_Score
call Tackle_Black_Pexels
xor ax, ax
mov es, ax ; point es to IVT base
cli ; disable interrupts
mov word [es:9*4], kbisr ; store offset at n*4
mov [es:9*4+2], cs ; store segment at n*4+2
sti


RUN_THE_LOOP_GAME:
sub word[Loop_Stop_After],1
cmp word[Loop_Stop_After],0
je Terminate
jne Game_Loop


Terminate: 
call BLUE_screen
call sleep
call sleep

mov al, 1
mov bh, 0
mov bl, 00001111b
mov cx, 8
mov dl, 13
mov dh, 10
push cs
pop es
mov bp, msg2
mov ah, 13h
int 10h

mov ax, word[Score_]
push ax
mov word[Row_n_2], 10
mov word[Col_n_2], 20
call Print_the_Score

mov al, 1
mov bh, 0
mov bl, 00001111b
mov cx, 11
mov dl, 13
mov dh,8
push cs
pop es
mov bp, Score_Board
mov ah, 13h
int 10h


mov al, 1
mov bh, 0
mov bl, 00001111b
mov cx, 17
mov dl, 10
mov dh, 12
push cs
pop es
mov bp, msg4
mov ah, 13h
int 10h


mov ax, word[No_of_Ballons_Poppped]
push ax
mov word[Row_n_3], 12
mov word[Col_n_3], 27
call Print_the_Number_of_Balloons_Popped
call Tackle_Black_Pexels___
mov ax, 0
int 16h
mov ax, 0x4c00
int 0x21





 


