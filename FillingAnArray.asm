;Taylor Landes
;Visual Studio was giving me issues during this assignment and I have been unable to test anything with it

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
intArray sdword 50 DUP(?)
count DWORD 0
.code
main PROC
call Randomize
mov esi,OFFSET intArray
mov ecx,LENGTHOF intArray
mov ebx,10
mov eax,20
call FillRandom
mov ebx,5
mov eax,50
call FillRandom

FillRandom proc
;Input parameters:
;ESI
pushad
sub eax,ebx	calculate interval size
inc eax
L1:push eax	save the interval size
call RandomRange	generates value (0 to EAX-1)
add eax,ebx	add it to the base
mov [esi],eax
pop eax
add esi,4
loop L1

popad
ret
FillRandom endp
end main