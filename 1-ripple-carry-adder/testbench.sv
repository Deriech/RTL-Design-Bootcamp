module DUT;
  reg [3:0] a, b;
  reg cin;
  wire carry;
  wire [3:0] out;
  integer i;
  adder_4bit adder_tb(.a(a),
                      .b(b),
                      .cin(cin),
                      .out(out),
                      .carry(carry));
  initial begin
    $dumpfile("4_bit_adder.vcd");
    $dumpvars(0, DUT);
    a <= 0;
    b <= 0;
    cin <= 0;
    
    $monitor ("a=0x%0h b=0x%0h cin=0x%0h carry=0x%0h out=0x%0h", a, b, cin, carry, out);
    for (i = 0; i < 5; i++) begin
      #10 a <= $random;
      b <= $random;
      cin <= $random;
    end
    $finish();
  end
endmodule
