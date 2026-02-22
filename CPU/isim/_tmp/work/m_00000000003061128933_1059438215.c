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
static const char *ng0 = "//vmware-host/Shared Folders/EE533/lab6_sp26/verilog/alu_control.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};



static void A45_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1532);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);

LAB5:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 564U);
    t4 = *((char **)t3);

LAB6:    t3 = ((char*)((ng1)));
    t5 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 2);
    if (t5 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t5 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t5 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t5 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t5 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 876);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(48, ng0);
    t6 = ((char*)((ng1)));
    t7 = (t0 + 876);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    goto LAB15;

LAB9:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng2)));
    t6 = (t0 + 876);
    xsi_vlogvar_assign_value(t6, t3, 0, 0, 4);
    goto LAB15;

LAB11:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 652U);
    t6 = *((char **)t3);
    t3 = (t0 + 876);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 4);
    goto LAB15;

}


extern void work_m_00000000003061128933_1059438215_init()
{
	static char *pe[] = {(void *)A45_0};
	xsi_register_didat("work_m_00000000003061128933_1059438215", "isim/_tmp/work/m_00000000003061128933_1059438215.didat");
	xsi_register_executes(pe);
}
