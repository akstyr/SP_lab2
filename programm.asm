section .data
	array dw 3,5,-9,2,-10,8,-7,2,1,6 ;sum=27

section .text
global _start

_start:
main:
	mov dx, word [array] ;x[i]
	mov ecx, 0 ;counter
	mov eax, 0 ;sum

_L: cmp ecx, 10 ;if [ecx=n] then  exit
	je _check_OF
	cmp dx, 0 ;if [x[i]<=0] then next else sum
	jle _next
	jg _sum

_sum:
	add ax, dx ;sum=sum+x[i]
	jmp _next

_next:
	inc ecx ;counter+1
	mov dx, word [array+ecx*2] ;x[i+1]=x[i]+(type x[i])*(i+1)
	jmp _L ;new iteration

_check_OF:
	cmp eax, 2147483647
	jo _of ;Overflow Flag=1
	mov r8w, 0
	jmp exit

_of: 
	mov r8w, 1
	jmp exit

exit:
	int 0x80