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
    dec rsi             ; зменшуємо rsi, щоб цикл виконувся до індексу size-1

    xor rax, rax
    xor rbx, rbx
    jmp before_outer_loop

before_outer_loop:
    cmp rax, rsi        ; перевіряємо умову i <= size - 1
    jle outer_loop
    jmp end_of_func     ; якщо i = size - 1 - зовнішній цикл закінчується, завершуємо програму

outer_loop:
    xor rbx, rbx          ; j = 0
    jmp before_inner_loop

before_inner_loop:
    mov r9, rsi
    sub r9, rax
    cmp rbx, r9         ; перевіряємо умову j < n-i-1
    jl inner_loop
    
    inc rax             ; якщо j >= n-i-1, тоді i++, йдемо до outer_loop
    jmp before_outer_loop

inner_loop:
    mov edx, dword [rdi + 4*rbx + 4]    ; edx - j+1 -ий елемент
    cmp dword [rdi + 4*rbx], edx        ; перевіряємо чи input_array[j] > input_array[j+1]
    jg swap                             ; якщо виконується, то міняємо елементи місцями

    inc rbx                             ; j++
    jmp before_inner_loop

swap:
    mov edx, dword [rdi + 4*rbx + 4]
    mov ecx, dword [rdi + 4*rbx]
    mov dword [rdi + 4*rbx + 4], ecx
    mov dword [rdi + 4*rbx], edx

    inc rbx
    jmp before_inner_loop

end_of_func:
    pop rbx
    ret
