module adder_4bit (input [3:0] a, b,
                 input cin,
                   output reg [3:0] out,
                   output reg carry);

  always @ (a or b or cin) begin
    {carry, out} = a + b + cin;

  end
    
  endmodule
    
module adder(input a,b,cin,
             output reg out, cout);
  always @ (a or b or cin) begin
    out <= (a*b) + (b*cin) + (cin*a);
    cout <= a ^ b ^ cin;
  end
endmodule
