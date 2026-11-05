#include <avr/io.h>

.section .text
.global main

main:
    clr r29
    clr r16
    clr r9

    ldi r29, 0x34   ; R29 is an upper register
    ldi r16, 0x34   ; R9 is not: load an upper one ...
    mov r9, r16     ; ... and copy it
done:
    rjmp done

.end