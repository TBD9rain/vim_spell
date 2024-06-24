//  head info

`timescale 1ns/100ps

module testbench_name;

//=======================
//  PARAMETER DEFINITIONS
//=======================

parameter   CLK_PERIOD = 10;

//======================
//  VARIABLE DEFINITIONS
//======================

reg                 clk     ;
reg                 rst_n   ;

//  display enable
reg                 disp_en = 1'b1;

//======================
//  MODULE INSTANTIATION
//======================



//====================
//  SIMULATION CONTROL
//====================

//  clock generator
initial begin:  clk_sim
    # 10
    clk = 1'b1;
    forever begin:  clock_gen_dead_loop
        #(CLK_PERIOD / 2) clk = ~clk;
    end
end

initial begin:  init_stimulus
    # 10;
    rst_n   = 1'b0;

    # ({$random} % 100)
    //  stimulus editing
    rst_n   = 1'b1;

    # 50000
    $finish(2);
end

//==================
//  DUT OUTPUT CHECK
//==================



//============================
//  TASK & FUNCTION DEFINITION
//============================



endmodule
