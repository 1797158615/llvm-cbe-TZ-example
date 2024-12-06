#ifndef TA_H_H
#define TA_H_H

/* Provide Declarations */
#include <stdint.h>
#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define  __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define  __ATTRIBUTELIST__(x)  
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_array_8_uint8_t;

/* Function definitions */

/* Types Definitions */
struct l_array_8_uint8_t {
  uint8_t array[8];
};

/* Global Variable Declarations */
const static struct l_array_8_uint8_t _OC_str_OC_4;

/* Function Declarations */
uint32_t inc(uint32_t _1, uint32_t _2) __ATTRIBUTELIST__((noinline, nothrow));
void inc_value(void* _7, void* _8) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(void* _17, ...);


/* Global Variable Definitions and Initialization */
static const struct l_array_8_uint8_t _OC_str_OC_4 = { "i+j=%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */
#define TA_H_UUID \
	{ 0x1f9a2da8, 0x9ae9, 0x9268, \
		{ 0x33, 0xc0, 0xfc, 0x9e, 0x89, 0x03, 0x86, 0xc7} }

#endif