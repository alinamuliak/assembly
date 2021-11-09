include 'format/format.inc' 
format ELF64
section '.text' executable
public func

; void func (int32_t* input_array, size_t size);

func:
    ; RDI - поінтер на початок масиву
    ; RSI - size
    ; i - rax, j - rbx
    push rbx
    dec rsi

    mov rax, 0
    mov rbx, 0
    ; mov r9, 0
    jmp before_outer_loop

before_outer_loop:
    cmp rax, rsi
    jle outer_loop
    jmp end_of_func

outer_loop:
    mov rbx, 0
    jmp before_inner_loop

before_inner_loop:
    mov r9, rsi
    sub r9, rax
    cmp rbx, r9 ; *тут потім можна зробити оптимізований bubble sort до n - i - 1 елементу
    jl inner_loop
    
    ; якщо j >= n - 1, тоді йдемо до outer_loop
    inc rax
    jmp before_outer_loop

inner_loop:
    ; edx - j+1 -ий елемент
    mov edx, dword [rdi + 4*rbx + 4]
    cmp dword [rdi + 4*rbx], edx
    jg swap

    inc rbx
    ; inc rax
    jmp before_inner_loop

swap:
    mov edx, dword [rdi + 4*rbx + 4]
    mov ecx, dword [rdi + 4*rbx]
    mov dword [rdi + 4*rbx + 4], ecx
    mov dword [rdi + 4*rbx], edx

    inc rbx
    ; inc rax
    jmp before_inner_loop

end_of_func:
    pop rbx
    ret