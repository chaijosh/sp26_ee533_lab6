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
static const char *ng0 = "//vmware-host/Shared Folders/EE533/lab6_sp26/verilog/cmt_test1.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Starting Testbench for basic CPU operations...";
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static const char *ng5 = "Reset released at time %0t";
static const char *ng6 = "Initializing source registers...";
static int ng7[] = {128, 0};
static unsigned int ng8[] = {0U, 0U, 0U, 0U};
static int ng9[] = {1, 0};



static void I40_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 1436U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);

LAB4:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 776);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1352);
    xsi_process_wait(t2, 100000000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 776);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t4 + 4U);
    t8 = (t6 + 4U);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    *((unsigned int *)t4) = t10;
    *((unsigned int *)t7) = 0;
    if (*((unsigned int *)t8) != 0)
        goto LAB8;

LAB7:    t15 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t15 & 1U);
    t16 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t16 & 1U);
    t17 = (t0 + 776);
    xsi_vlogvar_assign_value(t17, t4, 0, 0, 1);
    goto LAB5;

LAB8:    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t8);
    *((unsigned int *)t4) = (t11 | t12);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    *((unsigned int *)t7) = (t13 | t14);
    goto LAB7;

LAB9:    goto LAB1;

}

static void I45_1(char *t0)
{
    char t4[16];
    char t7[8];
    char t17[8];
    char t18[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    int t32;
    char *t33;
    unsigned int t34;
    int t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    int t39;
    int t40;

LAB0:    t1 = (t0 + 1564U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);

LAB4:    xsi_set_current_line(46, ng0);
    xsi_vlogfile_write(1, 0, ng2, 1, t0);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 868);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1480);
    xsi_process_wait(t2, 1000000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 868);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = xsi_vlog_time(t4, 1000000.000000000, 1000.000000000000);
    xsi_vlogfile_write(1, 0, ng5, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1480);
    xsi_process_wait(t2, 200000000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(60, ng0);
    xsi_vlogfile_write(1, 0, ng6, 1, t0);
    xsi_set_current_line(70, ng0);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 960);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB7:    t2 = (t0 + 960);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng7)));
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t5, 32, t6, 32);
    t8 = (t7 + 4U);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1480);
    xsi_process_wait(t2, 4000000000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB8:    xsi_set_current_line(70, ng0);

LAB10:    xsi_set_current_line(71, ng0);
    t14 = ((char*)((ng8)));
    t15 = (t0 + 2916);
    t16 = *((char **)t15);
    t19 = (t0 + 2936);
    t20 = *((char **)t19);
    t21 = ((((char*)(t20))) + 40U);
    t22 = *((char **)t21);
    t23 = (t0 + 2956);
    t24 = *((char **)t23);
    t25 = ((((char*)(t24))) + 36U);
    t26 = *((char **)t25);
    t27 = (t0 + 960);
    t28 = (t27 + 32U);
    t29 = *((char **)t28);
    xsi_vlog_generic_convert_array_indices(t17, t18, t22, t26, 2, 1, t29, 32, 1);
    t30 = (t17 + 4U);
    t31 = *((unsigned int *)t30);
    t32 = (!(t31));
    t33 = (t18 + 4U);
    t34 = *((unsigned int *)t33);
    t35 = (!(t34));
    t36 = (t32 && t35);
    if (t36 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 960);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng9)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t5, 32, t6, 32);
    t8 = (t0 + 960);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 32);
    goto LAB7;

LAB11:    t37 = *((unsigned int *)t17);
    t38 = *((unsigned int *)t18);
    t39 = (t37 - t38);
    t40 = (t39 + 1);
    xsi_vlogvar_assign_value(((char*)(t16)), t14, 0, *((unsigned int *)t18), t40);
    goto LAB12;

LAB13:    goto LAB1;

}


extern void work_m_00000000001966672155_0734845877_init()
{
	static char *pe[] = {(void *)I40_0,(void *)I45_1};
	xsi_register_didat("work_m_00000000001966672155_0734845877", "isim/_tmp/work/m_00000000001966672155_0734845877.didat");
	xsi_register_executes(pe);
}
