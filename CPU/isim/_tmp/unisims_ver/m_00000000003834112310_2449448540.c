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
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 1260U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 652U);
    t3 = *((char **)t2);
    t2 = (t0 + 1484);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    xsi_vlog_notGate(t7, t3);
    t8 = (t0 + 1484);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    t13 = (t12 + 4U);
    t14 = 1U;
    t15 = t14;
    t16 = (t7 + 4U);
    t17 = *((unsigned int *)t7);
    t14 = (t14 & t17);
    t18 = *((unsigned int *)t16);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t19 & 4294967294U);
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 | t14);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 4294967294U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 | t15);
    t23 = (t0 + 1484);
    xsi_driver_vfirst_trans(t23, 0, 0);
    t24 = (t0 + 1440);
    *((int *)t24) = 1;

LAB1:    return;
}


extern void unisims_ver_m_00000000003834112310_2449448540_init()
{
	static char *pe[] = {(void *)G29_0};
	xsi_register_didat("unisims_ver_m_00000000003834112310_2449448540", "isim/_tmp/unisims_ver/m_00000000003834112310_2449448540.didat");
	xsi_register_executes(pe);
}
