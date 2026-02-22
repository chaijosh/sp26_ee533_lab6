/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0x734844ce */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static int ng0[] = {48, 0};



static void C16_0(char *t0)
{
    char t3[16];
    char t5[16];
    char t8[8];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    char *t7;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 1260U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 564U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng0)));
    t6 = (t0 + 564U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t6 = (t8 + 4U);
    t9 = (t7 + 4U);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 15);
    t12 = (t11 & 1);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 15);
    t15 = (t14 & 1);
    *((unsigned int *)t6) = t15;
    xsi_vlog_mul_concat(t5, 48, 1, t2, 1U, t8, 1);
    xsi_vlogtype_concat(t3, 64, 64, 2U, t5, 48, t4, 16);
    t16 = (t0 + 1484);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    xsi_vlog_bit_copy(t20, 0, t3, 0, 64);
    xsi_driver_vfirst_trans(t16, 0, 63);
    t21 = (t0 + 1440);
    *((int *)t21) = 1;

LAB1:    return;
}


extern void work_m_00000000003691655707_3415651129_init()
{
	static char *pe[] = {(void *)C16_0};
	xsi_register_didat("work_m_00000000003691655707_3415651129", "isim/_tmp/work/m_00000000003691655707_3415651129.didat");
	xsi_register_executes(pe);
}
