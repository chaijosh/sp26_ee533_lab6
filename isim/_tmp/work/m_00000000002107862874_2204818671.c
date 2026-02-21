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
static const char *ng0 = "//vmware-host/Shared Folders/EE533/lab6_github/cpu_tb1.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Starting Testbench for basic CPU operations...";
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static const char *ng5 = "Reset released at time %0t";
static const char *ng6 = "Initializing source registers...";
static unsigned int ng7[] = {10U, 0U, 0U, 0U};
static int ng8[] = {1, 0};
static unsigned int ng9[] = {20U, 0U, 0U, 0U};
static int ng10[] = {2, 0};
static unsigned int ng11[] = {100U, 0U, 0U, 0U};
static int ng12[] = {4, 0};
static unsigned int ng13[] = {33U, 0U, 0U, 0U};
static int ng14[] = {5, 0};
static unsigned int ng15[] = {500U, 0U, 0U, 0U};
static int ng16[] = {7, 0};
static unsigned int ng17[] = {600U, 0U, 0U, 0U};
static int ng18[] = {8, 0};
static const char *ng19 = "Initializing registers for LW/SW tests...";
static unsigned int ng20[] = {2U, 0U, 0U, 0U};
static int ng21[] = {10, 0};
static unsigned int ng22[] = {5U, 0U, 0U, 0U};
static int ng23[] = {11, 0};
static const char *ng24 = "\n--- Verification Phase ---";
static const char *ng25 = "Checking final register values at time %0t";
static const char *ng26 = "R3 (ADD result): Expected=30, Actual=%0d";
static int ng27[] = {3, 0};
static unsigned int ng28[] = {30U, 0U, 0U, 0U};
static const char *ng29 = "--> TEST FAILED for ADD R3";
static const char *ng30 = "R6 (SUB result): Expected=67, Actual=%0d";
static int ng31[] = {6, 0};
static unsigned int ng32[] = {67U, 0U, 0U, 0U};
static const char *ng33 = "--> TEST FAILED for SUB R6";
static const char *ng34 = "R9 (ADD result): Expected=1100, Actual=%0d";
static int ng35[] = {9, 0};
static unsigned int ng36[] = {1100U, 0U, 0U, 0U};
static const char *ng37 = "--> TEST FAILED for ADD R9";
static const char *ng38 = "(SW result): Expected=%0d, Actual=%0d";
static int ng39[] = {12, 0};
static const char *ng40 = "--> TEST FAILED for LW/SW";
static const char *ng41 = "\nTestbench finished.";



static void I17_0(char *t0)
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

LAB0:    t1 = (t0 + 1344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);

LAB4:    xsi_set_current_line(18, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 776);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(19, ng0);

LAB5:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1260);
    xsi_process_wait(t2, 100000000LL);
    *((char **)t1) = &&LAB6;

LAB1:    return;
LAB6:    xsi_set_current_line(19, ng0);
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

static void I23_1(char *t0)
{
    char t4[16];
    char t6[8];
    char t7[8];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    int t19;
    char *t20;
    unsigned int t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    int t26;
    int t27;
    char *t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 1472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);

LAB4:    xsi_set_current_line(24, ng0);
    xsi_vlogfile_write(1, 0, ng2, 1, t0);
    xsi_set_current_line(27, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 868);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1388);
    xsi_process_wait(t2, 400000000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(29, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 868);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(30, ng0);
    t2 = xsi_vlog_time(t4, 1000000.000000000, 1000.000000000000);
    xsi_vlogfile_write(1, 0, ng5, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1388);
    xsi_process_wait(t2, 200000000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(38, ng0);
    xsi_vlogfile_write(1, 0, ng6, 1, t0);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2868);
    t5 = *((char **)t3);
    t8 = (t0 + 2888);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 2908);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng8)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 2928);
    t5 = *((char **)t3);
    t8 = (t0 + 2948);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 2968);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng10)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 2988);
    t5 = *((char **)t3);
    t8 = (t0 + 3008);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3028);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng12)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 3048);
    t5 = *((char **)t3);
    t8 = (t0 + 3068);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3088);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng14)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 3108);
    t5 = *((char **)t3);
    t8 = (t0 + 3128);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3148);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng16)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 3168);
    t5 = *((char **)t3);
    t8 = (t0 + 3188);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3208);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng18)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(49, ng0);
    xsi_vlogfile_write(1, 0, ng19, 1, t0);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 3228);
    t5 = *((char **)t3);
    t8 = (t0 + 3248);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3268);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng21)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng22)));
    t3 = (t0 + 3288);
    t5 = *((char **)t3);
    t8 = (t0 + 3308);
    t9 = *((char **)t8);
    t10 = ((((char*)(t9))) + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 3328);
    t13 = *((char **)t12);
    t14 = ((((char*)(t13))) + 36U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng23)));
    xsi_vlog_generic_convert_array_indices(t6, t7, t11, t15, 2, 1, t16, 32, 1);
    t17 = (t6 + 4U);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t7 + 4U);
    t21 = *((unsigned int *)t20);
    t22 = (!(t21));
    t23 = (t19 && t22);
    if (t23 == 1)
        goto LAB21;

LAB22:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1388);
    xsi_process_wait(t2, 4000000000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB7:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB8;

LAB9:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB10;

LAB11:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB12;

LAB13:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB14;

LAB15:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB16;

LAB17:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB18;

LAB19:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB20;

LAB21:    t24 = *((unsigned int *)t6);
    t25 = *((unsigned int *)t7);
    t26 = (t24 - t25);
    t27 = (t26 + 1);
    xsi_vlogvar_assign_value(((char*)(t5)), t2, 0, *((unsigned int *)t7), t27);
    goto LAB22;

LAB23:    xsi_set_current_line(58, ng0);
    xsi_vlogfile_write(1, 0, ng24, 1, t0);
    xsi_set_current_line(59, ng0);
    t2 = xsi_vlog_time(t4, 1000000.000000000, 1000.000000000000);
    xsi_vlogfile_write(1, 0, ng25, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3348);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3368);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3388);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng27)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    xsi_vlogfile_write(1, 0, ng26, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3408);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3428);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3448);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng27)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    t20 = ((char*)((ng28)));
    xsi_vlog_unsigned_case_noteq(t28, 64, t4, 64, t20, 64);
    t29 = (t28 + 4U);
    t18 = *((unsigned int *)t29);
    t21 = (~(t18));
    t24 = *((unsigned int *)t28);
    t25 = (t24 & t21);
    t30 = (t25 != 0);
    if (t30 > 0)
        goto LAB24;

LAB25:
LAB26:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 3468);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3488);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3508);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng31)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    xsi_vlogfile_write(1, 0, ng30, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3528);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3548);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3568);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng31)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    t20 = ((char*)((ng32)));
    xsi_vlog_unsigned_case_noteq(t28, 64, t4, 64, t20, 64);
    t29 = (t28 + 4U);
    t18 = *((unsigned int *)t29);
    t21 = (~(t18));
    t24 = *((unsigned int *)t28);
    t25 = (t24 & t21);
    t30 = (t25 != 0);
    if (t30 > 0)
        goto LAB27;

LAB28:
LAB29:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3588);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3608);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3628);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng35)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    xsi_vlogfile_write(1, 0, ng34, 2, t0, (char)118, t4, 64);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 3648);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3668);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3688);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng35)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    t20 = ((char*)((ng36)));
    xsi_vlog_unsigned_case_noteq(t28, 64, t4, 64, t20, 64);
    t29 = (t28 + 4U);
    t18 = *((unsigned int *)t29);
    t21 = (~(t18));
    t24 = *((unsigned int *)t28);
    t25 = (t24 & t21);
    t30 = (t25 != 0);
    if (t30 > 0)
        goto LAB30;

LAB31:
LAB32:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3708);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3728);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3748);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng21)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    t20 = (t0 + 3768);
    t29 = *((char **)t20);
    t31 = ((((char*)(t29))) + 32U);
    t32 = *((char **)t31);
    t33 = (t0 + 3788);
    t34 = *((char **)t33);
    t35 = ((((char*)(t34))) + 40U);
    t36 = *((char **)t35);
    t37 = (t0 + 3808);
    t38 = *((char **)t37);
    t39 = ((((char*)(t38))) + 36U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng39)));
    xsi_vlog_generic_get_array_select_value(t28, 64, t32, t36, t40, 2, 1, t41, 32, 1);
    xsi_vlogfile_write(1, 0, ng38, 3, t0, (char)118, t4, 64, (char)118, t28, 64);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3828);
    t3 = *((char **)t2);
    t5 = ((((char*)(t3))) + 32U);
    t8 = *((char **)t5);
    t9 = (t0 + 3848);
    t10 = *((char **)t9);
    t11 = ((((char*)(t10))) + 40U);
    t12 = *((char **)t11);
    t13 = (t0 + 3868);
    t14 = *((char **)t13);
    t15 = ((((char*)(t14))) + 36U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng39)));
    xsi_vlog_generic_get_array_select_value(t4, 64, t8, t12, t16, 2, 1, t17, 32, 1);
    t20 = ((char*)((ng20)));
    xsi_vlog_unsigned_case_noteq(t28, 64, t4, 64, t20, 64);
    t29 = (t28 + 4U);
    t18 = *((unsigned int *)t29);
    t21 = (~(t18));
    t24 = *((unsigned int *)t28);
    t25 = (t24 & t21);
    t30 = (t25 != 0);
    if (t30 > 0)
        goto LAB33;

LAB34:
LAB35:    xsi_set_current_line(79, ng0);
    xsi_vlogfile_write(1, 0, ng41, 1, t0);
    goto LAB1;

LAB24:    xsi_set_current_line(64, ng0);
    xsi_vlogfile_write(1, 0, ng29, 1, t0);
    goto LAB26;

LAB27:    xsi_set_current_line(68, ng0);
    xsi_vlogfile_write(1, 0, ng33, 1, t0);
    goto LAB29;

LAB30:    xsi_set_current_line(72, ng0);
    xsi_vlogfile_write(1, 0, ng37, 1, t0);
    goto LAB32;

LAB33:    xsi_set_current_line(77, ng0);
    xsi_vlogfile_write(1, 0, ng40, 1, t0);
    goto LAB35;

}


extern void work_m_00000000002107862874_2204818671_init()
{
	static char *pe[] = {(void *)I17_0,(void *)I23_1};
	xsi_register_didat("work_m_00000000002107862874_2204818671", "isim/_tmp/work/m_00000000002107862874_2204818671.didat");
	xsi_register_executes(pe);
}
