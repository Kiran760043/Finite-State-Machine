//////////////////////////////////////////////////////////////////////////////////
// Design Name: FSM to detect a sequence of 11011
// Engineer: kiran
// Machine: Moore Machine : non-overlapping with two always(process) statements
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module Moore(clk,rst,in,out);

    input  wire clk;
    input  wire rst;
    input  wire in;
    output wire out;

    localparam [3:0] S0 = 4'h0,
                     S1 = 4'h1,
                     S2 = 4'h2,
                     S3 = 4'h3,
                     S4 = 4'h4,
                     S5 = 4'h5;

     reg [3:0]state, nxt_state;

    always@(posedge clk)
        begin
            if(rst)
                state <= S0;
            else
                state <= nxt_state;
        end

    always@(state, in)
        begin
            nxt_state <= state;                     //default case
            case(state)
                S0 : begin
                        if(in == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S0;
                     end
                S1 : begin
                        if(in == 1)
                            nxt_state <= S2;
                        else
                            nxt_state <= S0;
                     end
                S2 : begin
                        if(in == 0)
                            nxt_state <= S3;
                        else
                            nxt_state <= S2;
                     end
                S3 : begin
                        if(in == 1)
                            nxt_state <= S4;
                        else
                            nxt_state <= S0;
                     end
                S4 : begin
                        if(in == 1)
                            nxt_state <= S5;
                        else
                            nxt_state <= S0;
                     end
                S5 : begin
                        if(in == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S0;
                     end


            endcase
        end

    assign out = (state == S5) ? 1 : 0;


    //////////////////////////////////////////////////////////// optional D-FF eliminate glicthes
    //     always@(posedge clk)                               // verfiy the simulation and schematic with 1 always statement with and without
    //        begin                                           // adding D-FF to eliminate gliches
    //            if(rst)
    //                New_out <= 0;
    //            else
    //                New_out <= out;
    //        end

endmodule
