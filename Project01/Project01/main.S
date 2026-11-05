#include <avr/io.h>

.section .text
.global main

main:
    clr r26         ; clear r26
    clr XH          ; clear r27

    clr r16         ; clear r16
    CLR r17         ; clear r17

    ldi XL, 0x00    ; X = 0x4000: low byte into r26
    ldi XH, 0x40    ; high byte into r27
    ldi r16, 0x11
    st  X+, r16     ; SRAM[0x4000] = 0x11, then X = 0x4001
    ldi r16, 0x22
    st  X+, r16     ; SRAM[0x4001] = 0x22, then X = 0x4002
    ld  r17, -X     ; X = 0x4001 first, then r17 = SRAM[0x4001]
done:
    rjmp done

.end