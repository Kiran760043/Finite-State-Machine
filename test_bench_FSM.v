///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: FSM to detect a sequence of 11011
// Engineer: kiran
// Machine: Moore Machine and Mealy Machine :: change the instance name based on the design
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_bench_FSM();

    //inputs for DUT
        reg clk;
        reg rst;
        reg in;
    //outputs from DUT
        wire out;
        
        Moore DUT(.clk(clk),.rst(rst),.in(in),.out(out));     //change the instance name to Moore or Mealy based on the design simulation
        
        initial 
            begin
                $display($time," << Simulation Results >> ");
                $monitor($time,"clk=%d, rst=%d, in=%d, out=%d", clk,rst,in,out);
            end
            
        initial  
            begin
                clk = 1;
                forever #5 clk = ~ clk;  
            end 
            
        initial
            begin
                rst = 1;
                in  = 0;
                #10 rst = 1;
                #10 in  = 0;
                #10 rst = 0;
                #10 in  = 0;
                #5 in  = 0;
                #10 in  = 1;
                #10 in  = 1;
                #10 in  = 0;
                #10 in  = 1;
                #10 in  = 1;
                #10 in  = 0;
                #10 in  = 0;
                #10 in  = 1;
                #10 in  = 1;
                #10 in  = 0;
                #10 in  = 1;
                #10 in  = 1;
                #10 in  = 0;
                #10 in  = 1;
                #10 in  = 1;
                #10 in  = 0;
                #10 in  = 0;
                #10 in  = 0;
                #10 in  = 0;
                $finish;
            end
endmodule

