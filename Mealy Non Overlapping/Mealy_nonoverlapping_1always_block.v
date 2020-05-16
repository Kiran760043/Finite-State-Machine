//////////////////////////////////////////////////////////////////////////////////
// Design Name: FSM to detect a sequence of 11011
// Engineer: kiran
// Machine: Mealy Machine : non-overlapping with 1 always block
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module Mealy(clk,rst,in,out);

    input  wire clk;
    input  wire rst;
    input  wire in;
    output reg  out;
    
    localparam [3:0] S0 = 4'h0, 
                     S1 = 4'h1,
                     S2 = 4'h2, 
                     S3 = 4'h3, 
                     S4 = 4'h4;
     
     reg [3:0]state;
                     
    always@(posedge clk)
        begin
            if(rst) begin
                state <= S0;
                out   <=  0;
            end else begin
                case(state)
                    S0 : begin
                            if(in == 1) begin
                                out   <=  0;
                                state <= S1;
                            end else begin
                                out   <=  0;
                                state <= S0;
                            end
                         end
                    S1 : begin
                            if(in == 1) begin
                                out   <=  0;
                                state <= S2;
                            end else begin
                                out   <=  0;
                                state <= S0;
                            end
                         end
                    S2 : begin
                            if(in == 0) begin
                                out   <=  0;
                                state <= S3;       
                            end else begin
                                out   <=  0;
                                state <= S2;
                            end
                         end
                    S3 : begin
                            if(in == 1) begin
                                out   <=  0;
                                state <= S4;
                            end else begin
                                out   <=  0;
                                state <= S0;
                            end
                         end
                    S4 : begin
                            if(in == 1) begin
                                out   <=  1;
                                state <= S0;
                            end else begin    
                                out   <=  0;
                                state <= S0;
                            end
                         end
                endcase
             end
        end
        

    

        
endmodule

