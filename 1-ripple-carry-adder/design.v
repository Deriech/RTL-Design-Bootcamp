/*
Project 1: 4-bit Ripple Carry Adder
RTL design of a basic ripple carry adder using
structutal modeling. Verify using testbench and
waveform analysis
*/
module adder_4bit (input [3:0] a, b,
                   input cin,
                   output [3:0] out,
                   output carry);
  wire mid_carry[2:0];
  adder add1(a[0], b[0], cin, out[0], mid_carry[0]);
  adder add2(a[1], b[1], mid_carry[0], out[1], mid_carry[1]);
  adder add3(a[2], b[2], mid_carry[1], out[2], mid_carry[2]);
  adder add4(a[3], b[3], mid_carry[2], out[3], carry);
endmodule

module adder(input a,b,cin,
             output reg out, cout);
  always @ (a or b or cin) begin
    {cout, out} = a + b + cin;
  end
endmodule
