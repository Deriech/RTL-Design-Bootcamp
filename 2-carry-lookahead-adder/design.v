/*
Project 2: 4-bit Carry Lookahead Adder
Implements fast addition using carry lookahead
Verification involves random testcases and 
delay checks
*/

module adder_4bit_lookahead (input [3:0] a, b,
                   input cin,
                   output [3:0] out,
                   output carry);
    wire [3:0] Ci, Pi, Gi;

    assign Pi = a ^ b;
    assign Gi = a & b;

    assign Ci[0] = cin;
    assign Ci[1] = Gi[0] + (Pi[0] & Ci[0]);

    assign Ci[2] = Gi[1] + (Pi[1] & Gi[0]) + 
                           (Pi[1] & Pi[0] & Ci[0]);

    assign Ci[3] = Gi[2] + (Pi[2] & Gi[1]) + 
                           (Pi[2] & Pi[1] & Gi[0]) + 
                           (Pi[2] & Pi[1] & Pi[0] & Ci[0]);

    assign carry = Gi[3] + (Pi[3] & Gi[2]) + 
                           (Pi[3] & Pi[2] & Gi[1]) + 
                           (Pi[3] & Pi[2] & Pi[1] & Gi[0]) + 
                           (Pi[3] & Pi[2] & Pi[1] & Pi[0] & Ci[0]);

    assign out = Pi ^ Ci;

endmodule