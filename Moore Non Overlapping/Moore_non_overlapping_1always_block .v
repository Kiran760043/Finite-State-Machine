//////////////////////////////////////////////////////////////////////////////////
// Design Name: FSM to detect a sequence of 11011
// Engineer: kiran
// Machine: Moore Machine : non-overlapping with one always(process) statement
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module Moore(clk,rst,in,out);

    input  wire clk;
    input  wire rst;
    input  wire in;
    output reg out;

    localparam [3:0] S0 = 4'h0,
                     S1 = 4'h1,
                     S2 = 4'h2,
                     S3 = 4'h3,
                     S4 = 4'h4,
                     S5 = 4'h5;

     reg [3:0]state;

    always@(posedge clk)
        begin
            if(rst) begin
                state <= S0;
                out   <= 0;
            end else begin
                case(state)
                    S0 : begin
                            out <= 0;
                            if(in == 1)
                                state <= S1;
                            else
                                state <= S0;
                         end
                    S1 : begin
                            out <= 0;
                            if(in == 1)
                                state <= S2;
                            else
                                state <= S0;
                         end
                    S2 : begin
                            out <= 0;
                            if(in == 0)
                                state <= S3;
                            else
                                state <= S2;
                         end
                    S3 : begin
                            out <= 0;
                            if(in == 1)
                                state <= S4;
                            else
                                state <= S0;
                         end
                    S4 : begin
                            out <= 0;
                            if(in == 1)
                                state <= S5;
                            else
                                state <= S0;
                         end
                    S5 : begin
                            out <= 1;
                            if(in == 1)
                                state <= S1;
                            else
                                state <= S0;
                         end
                   default: state <= S0;
                endcase
              end
        end




endmodule
