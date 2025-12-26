module DUT;
  reg [3:0] a, b;
  reg cin;
  wire carry;
  wire [3:0] out;
  integer i;
  adder_4bit_lookahead adder_tb(.a(a),
                      .b(b),
                      .cin(cin),
                      .out(out),
                      .carry(carry));
  initial begin
    $dumpfile("adder_4bit_lookahead.vcd");
    $dumpvars(0, DUT);
    $monitor ("a=0x%0h b=0x%0h cin=0x%0h carry=0x%0h out=0x%0h", a, b, cin, carry, out);
    a <= 0;
    b <= 0;
    cin <= 0;
    
    for (i = 0; i < 10; i++) begin
      #10 a <= $random;
      b <= $random;
      cin <= $random;
    end
    $finish();
  end
endmodule
