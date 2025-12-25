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
  fulladder add1(a[0], b[0], cin, out[0], mid_carry[0]);
  fulladder add2(a[1], b[1], mid_carry[0], out[1], mid_carry[1]);
  fulladder add3(a[2], b[2], mid_carry[1], out[2], mid_carry[2]);
  fulladder add4(a[3], b[3], mid_carry[2], out[3], carry);
endmodule

module fulladder(input a,b,cin,
             output out, cout);
  wire w1, w2, w3, w4, w5, w6;
  xor g1(w1, a, b);
  xor g2(out, w1, cin);
  and g3(w2, a, b);
  and g4(w3, b, cin);
  and g5(w4, cin, a);
  or g6(w5, w2, w3);
  or g7(cout, w4, w5);
endmodule
