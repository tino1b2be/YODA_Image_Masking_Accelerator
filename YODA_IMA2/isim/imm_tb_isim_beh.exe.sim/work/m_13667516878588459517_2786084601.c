/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/tino1b2be/Documents/YODA_Image_Masking_Accelerator/YODA_IMA2/imm.v";
static int ng1[] = {177, 0};
static int ng2[] = {110, 0};

static void NetReassign_56_2(char *);
static void NetReassign_57_3(char *);


static void Always_40_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 4760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 5824);
    *((int *)t2) = 1;
    t3 = (t0 + 4792);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 12, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 9, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 9, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 8, 0LL);
    goto LAB2;

}

static void Always_49_1(char *t0)
{
    char t10[8];
    char t12[8];
    char t31[8];
    char t32[8];
    char t36[8];
    char t44[8];
    char t76[8];
    char t94[8];
    char t98[8];
    char t106[8];
    char t138[8];
    char t157[8];
    char t158[8];
    char t162[8];
    char t170[8];
    char t213[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    int t68;
    int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
    char *t95;
    char *t96;
    char *t97;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    char *t120;
    char *t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    int t130;
    int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t150;
    char *t151;
    char *t152;
    char *t153;
    char *t154;
    char *t155;
    char *t156;
    char *t159;
    char *t160;
    char *t161;
    char *t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    char *t169;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    char *t174;
    char *t175;
    char *t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    char *t184;
    char *t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    int t194;
    int t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    unsigned int t201;
    char *t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    char *t208;
    char *t209;
    char *t210;
    char *t211;
    char *t212;
    unsigned int t214;
    unsigned int t215;
    unsigned int t216;
    char *t217;
    char *t218;
    unsigned int t219;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    unsigned int t223;
    unsigned int t224;
    unsigned int t225;
    char *t226;

LAB0:    t1 = (t0 + 5008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 5840);
    *((int *)t2) = 1;
    t3 = (t0 + 5040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(49, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 3368);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 9, t6, 9, t9, 9);
    t11 = (t0 + 3688);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 7);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3528);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 8, t4, 8, t7, 8);
    t8 = (t0 + 3848);
    xsi_vlogvar_assign_value(t8, t10, 0, 0, 8);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2408);
    xsi_set_assignedflag(t2);
    t3 = (t0 + 7792);
    *((int *)t3) = 1;
    NetReassign_56_2(t0);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2568);
    xsi_set_assignedflag(t2);
    t3 = (t0 + 7796);
    *((int *)t3) = 1;
    NetReassign_57_3(t0);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t10, 0, 8);
    t8 = (t4 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB7;

LAB6:    t9 = (t7 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t4) < *((unsigned int *)t7))
        goto LAB9;

LAB8:    *((unsigned int *)t10) = 1;

LAB9:    memset(t12, 0, 8);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t10);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t13) != 0)
        goto LAB13;

LAB14:    t20 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB15;

LAB16:    memcpy(t44, t12, 8);

LAB17:    memset(t76, 0, 8);
    t77 = (t44 + 4);
    t78 = *((unsigned int *)t77);
    t79 = (~(t78));
    t80 = *((unsigned int *)t44);
    t81 = (t80 & t79);
    t82 = (t81 & 1U);
    if (t82 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t77) != 0)
        goto LAB32;

LAB33:    t84 = (t76 + 4);
    t85 = *((unsigned int *)t76);
    t86 = *((unsigned int *)t84);
    t87 = (t85 || t86);
    if (t87 > 0)
        goto LAB34;

LAB35:    memcpy(t106, t76, 8);

LAB36:    memset(t138, 0, 8);
    t139 = (t106 + 4);
    t140 = *((unsigned int *)t139);
    t141 = (~(t140));
    t142 = *((unsigned int *)t106);
    t143 = (t142 & t141);
    t144 = (t143 & 1U);
    if (t144 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t139) != 0)
        goto LAB51;

LAB52:    t146 = (t138 + 4);
    t147 = *((unsigned int *)t138);
    t148 = *((unsigned int *)t146);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB53;

LAB54:    memcpy(t170, t138, 8);

LAB55:    t202 = (t170 + 4);
    t203 = *((unsigned int *)t202);
    t204 = (~(t203));
    t205 = *((unsigned int *)t170);
    t206 = (t205 & t204);
    t207 = (t206 != 0);
    if (t207 > 0)
        goto LAB68;

LAB69:    xsi_set_current_line(71, ng0);

LAB75:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2728);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 12);

LAB70:    goto LAB2;

LAB7:    t11 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t12) = 1;
    goto LAB14;

LAB13:    t19 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB15:    t24 = (t0 + 3048);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t0 + 3368);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng1)));
    memset(t31, 0, 8);
    xsi_vlog_unsigned_add(t31, 32, t29, 9, t30, 32);
    memset(t32, 0, 8);
    t33 = (t26 + 4);
    if (*((unsigned int *)t33) != 0)
        goto LAB19;

LAB18:    t34 = (t31 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t26) < *((unsigned int *)t31))
        goto LAB20;

LAB21:    memset(t36, 0, 8);
    t37 = (t32 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t32);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t37) != 0)
        goto LAB25;

LAB26:    t45 = *((unsigned int *)t12);
    t46 = *((unsigned int *)t36);
    t47 = (t45 & t46);
    *((unsigned int *)t44) = t47;
    t48 = (t12 + 4);
    t49 = (t36 + 4);
    t50 = (t44 + 4);
    t51 = *((unsigned int *)t48);
    t52 = *((unsigned int *)t49);
    t53 = (t51 | t52);
    *((unsigned int *)t50) = t53;
    t54 = *((unsigned int *)t50);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB17;

LAB19:    t35 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB21;

LAB20:    *((unsigned int *)t32) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t36) = 1;
    goto LAB26;

LAB25:    t43 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB26;

LAB27:    t56 = *((unsigned int *)t44);
    t57 = *((unsigned int *)t50);
    *((unsigned int *)t44) = (t56 | t57);
    t58 = (t12 + 4);
    t59 = (t36 + 4);
    t60 = *((unsigned int *)t12);
    t61 = (~(t60));
    t62 = *((unsigned int *)t58);
    t63 = (~(t62));
    t64 = *((unsigned int *)t36);
    t65 = (~(t64));
    t66 = *((unsigned int *)t59);
    t67 = (~(t66));
    t68 = (t61 & t63);
    t69 = (t65 & t67);
    t70 = (~(t68));
    t71 = (~(t69));
    t72 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t72 & t70);
    t73 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t73 & t71);
    t74 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t74 & t70);
    t75 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t75 & t71);
    goto LAB29;

LAB30:    *((unsigned int *)t76) = 1;
    goto LAB33;

LAB32:    t83 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t83) = 1;
    goto LAB33;

LAB34:    t88 = (t0 + 3208);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    t91 = (t0 + 3528);
    t92 = (t91 + 56U);
    t93 = *((char **)t92);
    memset(t94, 0, 8);
    t95 = (t90 + 4);
    if (*((unsigned int *)t95) != 0)
        goto LAB38;

LAB37:    t96 = (t93 + 4);
    if (*((unsigned int *)t96) != 0)
        goto LAB38;

LAB41:    if (*((unsigned int *)t90) < *((unsigned int *)t93))
        goto LAB40;

LAB39:    *((unsigned int *)t94) = 1;

LAB40:    memset(t98, 0, 8);
    t99 = (t94 + 4);
    t100 = *((unsigned int *)t99);
    t101 = (~(t100));
    t102 = *((unsigned int *)t94);
    t103 = (t102 & t101);
    t104 = (t103 & 1U);
    if (t104 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t99) != 0)
        goto LAB44;

LAB45:    t107 = *((unsigned int *)t76);
    t108 = *((unsigned int *)t98);
    t109 = (t107 & t108);
    *((unsigned int *)t106) = t109;
    t110 = (t76 + 4);
    t111 = (t98 + 4);
    t112 = (t106 + 4);
    t113 = *((unsigned int *)t110);
    t114 = *((unsigned int *)t111);
    t115 = (t113 | t114);
    *((unsigned int *)t112) = t115;
    t116 = *((unsigned int *)t112);
    t117 = (t116 != 0);
    if (t117 == 1)
        goto LAB46;

LAB47:
LAB48:    goto LAB36;

LAB38:    t97 = (t94 + 4);
    *((unsigned int *)t94) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB40;

LAB42:    *((unsigned int *)t98) = 1;
    goto LAB45;

LAB44:    t105 = (t98 + 4);
    *((unsigned int *)t98) = 1;
    *((unsigned int *)t105) = 1;
    goto LAB45;

LAB46:    t118 = *((unsigned int *)t106);
    t119 = *((unsigned int *)t112);
    *((unsigned int *)t106) = (t118 | t119);
    t120 = (t76 + 4);
    t121 = (t98 + 4);
    t122 = *((unsigned int *)t76);
    t123 = (~(t122));
    t124 = *((unsigned int *)t120);
    t125 = (~(t124));
    t126 = *((unsigned int *)t98);
    t127 = (~(t126));
    t128 = *((unsigned int *)t121);
    t129 = (~(t128));
    t130 = (t123 & t125);
    t131 = (t127 & t129);
    t132 = (~(t130));
    t133 = (~(t131));
    t134 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t134 & t132);
    t135 = *((unsigned int *)t112);
    *((unsigned int *)t112) = (t135 & t133);
    t136 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t136 & t132);
    t137 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t137 & t133);
    goto LAB48;

LAB49:    *((unsigned int *)t138) = 1;
    goto LAB52;

LAB51:    t145 = (t138 + 4);
    *((unsigned int *)t138) = 1;
    *((unsigned int *)t145) = 1;
    goto LAB52;

LAB53:    t150 = (t0 + 3208);
    t151 = (t150 + 56U);
    t152 = *((char **)t151);
    t153 = (t0 + 3528);
    t154 = (t153 + 56U);
    t155 = *((char **)t154);
    t156 = ((char*)((ng2)));
    memset(t157, 0, 8);
    xsi_vlog_unsigned_add(t157, 32, t155, 8, t156, 32);
    memset(t158, 0, 8);
    t159 = (t152 + 4);
    if (*((unsigned int *)t159) != 0)
        goto LAB57;

LAB56:    t160 = (t157 + 4);
    if (*((unsigned int *)t160) != 0)
        goto LAB57;

LAB60:    if (*((unsigned int *)t152) < *((unsigned int *)t157))
        goto LAB58;

LAB59:    memset(t162, 0, 8);
    t163 = (t158 + 4);
    t164 = *((unsigned int *)t163);
    t165 = (~(t164));
    t166 = *((unsigned int *)t158);
    t167 = (t166 & t165);
    t168 = (t167 & 1U);
    if (t168 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t163) != 0)
        goto LAB63;

LAB64:    t171 = *((unsigned int *)t138);
    t172 = *((unsigned int *)t162);
    t173 = (t171 & t172);
    *((unsigned int *)t170) = t173;
    t174 = (t138 + 4);
    t175 = (t162 + 4);
    t176 = (t170 + 4);
    t177 = *((unsigned int *)t174);
    t178 = *((unsigned int *)t175);
    t179 = (t177 | t178);
    *((unsigned int *)t176) = t179;
    t180 = *((unsigned int *)t176);
    t181 = (t180 != 0);
    if (t181 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB55;

LAB57:    t161 = (t158 + 4);
    *((unsigned int *)t158) = 1;
    *((unsigned int *)t161) = 1;
    goto LAB59;

LAB58:    *((unsigned int *)t158) = 1;
    goto LAB59;

LAB61:    *((unsigned int *)t162) = 1;
    goto LAB64;

LAB63:    t169 = (t162 + 4);
    *((unsigned int *)t162) = 1;
    *((unsigned int *)t169) = 1;
    goto LAB64;

LAB65:    t182 = *((unsigned int *)t170);
    t183 = *((unsigned int *)t176);
    *((unsigned int *)t170) = (t182 | t183);
    t184 = (t138 + 4);
    t185 = (t162 + 4);
    t186 = *((unsigned int *)t138);
    t187 = (~(t186));
    t188 = *((unsigned int *)t184);
    t189 = (~(t188));
    t190 = *((unsigned int *)t162);
    t191 = (~(t190));
    t192 = *((unsigned int *)t185);
    t193 = (~(t192));
    t194 = (t187 & t189);
    t195 = (t191 & t193);
    t196 = (~(t194));
    t197 = (~(t195));
    t198 = *((unsigned int *)t176);
    *((unsigned int *)t176) = (t198 & t196);
    t199 = *((unsigned int *)t176);
    *((unsigned int *)t176) = (t199 & t197);
    t200 = *((unsigned int *)t170);
    *((unsigned int *)t170) = (t200 & t196);
    t201 = *((unsigned int *)t170);
    *((unsigned int *)t170) = (t201 & t197);
    goto LAB67;

LAB68:    xsi_set_current_line(63, ng0);

LAB71:    xsi_set_current_line(66, ng0);
    t208 = (t0 + 2888);
    t209 = (t208 + 56U);
    t210 = *((char **)t209);
    t211 = (t0 + 2008U);
    t212 = *((char **)t211);
    t214 = *((unsigned int *)t210);
    t215 = *((unsigned int *)t212);
    t216 = (t214 ^ t215);
    *((unsigned int *)t213) = t216;
    t211 = (t210 + 4);
    t217 = (t212 + 4);
    t218 = (t213 + 4);
    t219 = *((unsigned int *)t211);
    t220 = *((unsigned int *)t217);
    t221 = (t219 | t220);
    *((unsigned int *)t218) = t221;
    t222 = *((unsigned int *)t218);
    t223 = (t222 != 0);
    if (t223 == 1)
        goto LAB72;

LAB73:
LAB74:    t226 = (t0 + 2728);
    xsi_vlogvar_assign_value(t226, t213, 0, 0, 12);
    goto LAB70;

LAB72:    t224 = *((unsigned int *)t213);
    t225 = *((unsigned int *)t218);
    *((unsigned int *)t213) = (t224 | t225);
    goto LAB74;

}

static void NetReassign_56_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 5256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t3 = 0;
    t2 = (t0 + 3048);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 7792);
    if (*((int *)t6) > 0)
        goto LAB4;

LAB5:    if (t3 > 0)
        goto LAB6;

LAB7:    t9 = (t0 + 5856);
    *((int *)t9) = 0;

LAB8:
LAB1:    return;
LAB4:    t7 = (t0 + 2408);
    xsi_vlogvar_assignassignvalue(t7, t5, 0, 0, 0, 9, ((int*)(t6)));
    t3 = 1;
    goto LAB5;

LAB6:    t8 = (t0 + 5856);
    *((int *)t8) = 1;
    goto LAB8;

}

static void NetReassign_57_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 5504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t3 = 0;
    t2 = (t0 + 3208);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 7796);
    if (*((int *)t6) > 0)
        goto LAB4;

LAB5:    if (t3 > 0)
        goto LAB6;

LAB7:    t9 = (t0 + 5872);
    *((int *)t9) = 0;

LAB8:
LAB1:    return;
LAB4:    t7 = (t0 + 2568);
    xsi_vlogvar_assignassignvalue(t7, t5, 0, 0, 0, 8, ((int*)(t6)));
    t3 = 1;
    goto LAB5;

LAB6:    t8 = (t0 + 5872);
    *((int *)t8) = 1;
    goto LAB8;

}


extern void work_m_13667516878588459517_2786084601_init()
{
	static char *pe[] = {(void *)Always_40_0,(void *)Always_49_1,(void *)NetReassign_56_2,(void *)NetReassign_57_3};
	xsi_register_didat("work_m_13667516878588459517_2786084601", "isim/imm_tb_isim_beh.exe.sim/work/m_13667516878588459517_2786084601.didat");
	xsi_register_executes(pe);
}
