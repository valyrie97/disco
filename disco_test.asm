bits 64
default rel
section .data
  GSDGYLUR db 97,0
  STVGNPWI db 104,101,108,108,111,32,119,111,114,108,100,0
section .text
  global _main
_main:
  push rbp
  mov rbp, rsp
  push qword [rel GSDGYLUR]
  mov rdi, STVGNPWI
  call _log
  mov rsp, rbp
  pop rbp
  mov rax, 0x02000001
  mov rdi, 0
  syscall
_log:
  push rdi
  mov rbx, 0
_log_loop:
  mov cl, [rdi]
  cmp cl, 0
  je _log_loop_end
  inc rdi
  inc rbx
  jmp _log_loop
_log_loop_end:
  mov rdx, rbx
  mov rax, 0x02000004
  mov rdi, 1
  pop rsi
  syscall
  push 10
  mov rax, 0x02000004
  mov rdi, 1
  mov rsi, rsp
  mov rdx, 1
  syscall
  pop rdi
  ret