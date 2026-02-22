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



static void G29_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 1524U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 652U);
    t3 = *((char **)t2);
    t2 = (t0 + 740U);
    t4 = *((char **)t2);
    t2 = (t0 + 828U);
    t5 = *((char **)t2);
    t2 = (t0 + 916U);
    t6 = *((char **)t2);
    t2 = (t0 + 1748);
    t7 = (t2 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    xsi_vlog_AndGate(t10, 4U, t3, t4, t5, t6);
    t11 = (t0 + 1748);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    t16 = (t15 + 4U);
    t17 = 1U;
    t18 = t17;
    t19 = (t10 + 4U);
    t20 = *((unsigned int *)t10);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 & 4294967294U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 | t17);
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 4294967294U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 | t18);
    t26 = (t0 + 1748);
    xsi_driver_vfirst_trans(t26, 0, 0);
    t27 = (t0 + 1704);
    *((int *)t27) = 1;

LAB1:    return;
}


extern void unisims_ver_m_00000000000847167281_1668249201_init()
{
	static char *pe[] = {(void *)G29_0};
	xsi_register_didat("unisims_ver_m_00000000000847167281_1668249201", "isim/_tmp/unisims_ver/m_00000000000847167281_1668249201.didat");
	xsi_register_executes(pe);
}
