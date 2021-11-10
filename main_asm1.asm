include 'format/format.inc' 
format ELF64

section '.text' executable

 public main
 extrn printf
 extrn func
 extrn exit

 main:
    push    rbp                 ; stack should be aligned to 16
    mov eax, 1
    mov edi, msg_arrA
    mov rbx, 2

    cvtss2sd xmm0, dword [fltA]
    cvtss2sd xmm1, dword [fltA + 4]
    cvtss2sd xmm2, dword [fltA + 8]
    cvtss2sd xmm3, dword [fltA + 12]
    cvtss2sd xmm4, dword [fltA + 16]
    call    printf               ; print fltA

    mov edi, msg_arrB
    cvtss2sd xmm0, dword [fltB]
    cvtss2sd xmm1, dword [fltB + 4]
    cvtss2sd xmm2, dword [fltB + 8]
    cvtss2sd xmm3, dword [fltB + 12]
    cvtss2sd xmm4, dword [fltB + 16]
    call    printf              ; print fltB

    mov rdi, fltA
    mov rsi, fltB
    mov rdx, fltX
    mov rcx, qword [arr_size]
    call func    
    
    mov edi, msg_arrX
    cvtss2sd xmm0, dword [fltX]
    cvtss2sd xmm1, dword [fltX + 4]
    cvtss2sd xmm2, dword [fltX + 8]
    cvtss2sd xmm3, dword [fltX + 12]
    cvtss2sd xmm4, dword [fltX + 16]
    call printf

    xor     eax, eax    ; exit code
    pop     rbp
    ret

section '.data' writeable
; define variables
fltA    dd  2.0, 6.0, -20.25, 1.0, 0.0
fltB    dd  1.0, -3.0, 30.50, 5.77, 8.0
fltX    dd  0.0, 0.0, 0.0, 0.0, 0.0
arr_size    dq  5

msg_arrA db "Array A: [%.2f, %.2f, %.2f, %.2f, %.2f]",0xA,0
msg_arrB db "Array B: [%.2f, %.2f, %.2f, %.2f, %.2f]",0xA,0
msg_arrX db "Array X: [%.2f, %.2f, %.2f, %.2f, %.2f]",0xA,0
