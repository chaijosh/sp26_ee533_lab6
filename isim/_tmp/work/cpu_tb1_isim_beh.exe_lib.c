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

#include "xsi.h"

struct XSI_INFO xsi_info;


int isim_run(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    work_m_00000000000866782574_2073120511_init();
    xilinxcorelib_ver_m_00000000003806943309_2228719516_init();
    work_m_00000000004089654968_0587888802_init();
    xilinxcorelib_ver_m_00000000003806943309_0573589173_init();
    work_m_00000000004290218603_1559393817_init();
    work_m_00000000003614159004_1212937958_init();
    work_m_00000000002107862874_2204818671_init();


    xsi_register_tops("work_m_00000000002107862874_2204818671");
    xsi_register_tops("work_m_00000000000866782574_2073120511");


    return xsi_run_simulation(argc, argv);

}
