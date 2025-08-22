
#ifndef LLEC_CRT_H
#define LLEC_CRT_H


#ifdef __ASSEMBLY__

#define globl_bss_object(name, size_)   \
    .section ".bss", "aw"              ;\
    .globl name                        ;\
	.size name, size_;                 ;\
	.type name, @object;               ;\
name:                                  ;\
	.zero   size_

#define li32(r, value)  \
    lis r, value@ha    ;\
    ori r, r, value@l

#define li64(r, value)          \
    li      r,    value@higher ;\
    oris    r, r, value@highest;\
    sldi    r, r, 32           ;\
    oris    r, r, value@h      ;\
    ori     r, r, value@l       \

#else/*__ASSEMBLY__*/

extern unsigned long long __llec___stack;

#ifdef __DEBUG_ASSEMBLY__

extern unsigned long long __llec_r1 ;
extern unsigned long long __llec_r2 ;
extern unsigned long long __llec_r3 ;
extern unsigned long long __llec_r4 ;
extern unsigned long long __llec_r13;

extern unsigned long long __llec_lr;

#endif/*__DEBUG_ASSEMBLY__*/

#endif/*!__ASSEMBLY__*/


#endif/*LLEC_CRT_H*/
