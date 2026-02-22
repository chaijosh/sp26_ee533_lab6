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



static void A31_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 1440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1620);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t3 = (t0 + 740U);
    t4 = *((char **)t3);
    t3 = (t4 + 4U);
    t5 = *((unsigned int *)t3);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 != 0);
    if (t9 > 0)
        goto LAB5;

LAB6:    t2 = (t0 + 564U);
    t3 = *((char **)t2);
    t2 = (t0 + 964);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);

LAB7:    goto LAB2;

LAB5:    t10 = (t0 + 652U);
    t11 = *((char **)t10);
    t10 = (t0 + 964);
    xsi_vlogvar_assign_value(t10, t11, 0, 0, 1);
    goto LAB7;

}


extern void unisims_ver_m_00000000000209790484_0107986864_init()
{
	static char *pe[] = {(void *)A31_0};
	xsi_register_didat("unisims_ver_m_00000000000209790484_0107986864", "isim/_tmp/unisims_ver/m_00000000000209790484_0107986864.didat");
	xsi_register_executes(pe);
}
