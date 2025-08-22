#include "llec_crt.h"


    .file   "lecc_crt0.S"


    .extern _initialize


    .text
    .globl ._start
	.type ._start, @function
._start:

#ifdef __DEBUG_ASSEMBLY__

    li64   (r14, __llec_r1 );
    std     r1 , 0(r14)

    li64   (r14, __llec_r2 );
    std     r2 , 0(r14)

    li64   (r14, __llec_r3 );
    std     r3 , 0(r14)

    li64   (r14, __llec_r4 );
    std     r4 , 0(r14)

    li64   (r14, __llec_r13);
    std     r13, 0(r14)

#endif/*__DEBUG_ASSEMBLY__*/


#ifndef __PPU64_HYBRID__

    li32   (r14, 0xBADDA1A0);
	cmpw 	r14, r2
	bne		._start_bne_0xBADDA1A0

    li64   (r15, _TOC__tocbase);
	ld 		r2 , 0(r15)

._start_bne_0xBADDA1A0:

#endif/*!__PPU64_HYBRID__*/


	ld		r14, .__llec___stack_toc@toc(r2)
    std 	r1 , 0(r14)


	mflr	r15

#ifdef __DEBUG_ASSEMBLY__

    li64   (r14, __llec_lr);
    std     r15, 0(r14)

#endif/*__DEBUG_ASSEMBLY__*/

	li      r14, 0
    stdu    r1 , -112(r1)
    std     r14, 0(r1)
    std     r15, 16(r1)

	bl _initialize

	ld   	r15, 16(r1)
	addi 	r1 , r1, 112
	mtlr	r15

    ori     r0, r0, 0x00

    blr                                         /* halt_baddata(); probably.                        */



#ifdef __DEBUG_ASSEMBLY__

globl_bss_object(__llec_r1 , 8);
globl_bss_object(__llec_r2 , 8);
globl_bss_object(__llec_r3 , 8);
globl_bss_object(__llec_r4 , 8);
globl_bss_object(__llec_r13, 8);

globl_bss_object(__llec_lr, 8);

#endif/*__DEBUG_ASSEMBLY__*/



globl_bss_object(__llec___stack, 8);
	.section ".toc", "aw"
.__llec___stack_toc:
	.quad	__llec___stack



#ifndef __PPU64_HYBRID__

	.section ".rodata", "a"
	.globl _TOC__tocbase
_TOC__tocbase:
.quad .TOC.@tocbase



    .section ".opd", "aw"
	.globl _start
_start:
	.long ._start
	.long 0xBADDA1A0
	.quad 0
	.quad 0

#else/*!__PPU64_HYBRID__*/

/*TODO: .*/

#endif/*__PPU64_HYBRID__*/
