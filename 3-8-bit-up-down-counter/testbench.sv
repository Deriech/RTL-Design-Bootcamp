module DUT;
  reg up_down, reset, clk, load;
  reg [7:0] data;
  wire [7:0] count;
  up_down_counter counter_tb(up_down, reset, clk, load, data, count);
  initial begin
    clk <= 0;
    forever #5 clk <= !clk;
  end
    
  initial begin
    $dumpfile("8-bit-up-down-counter.vcd");
    $dumpvars(0, DUT);
    $monitor ("up_down=0x%0h reset=0x%0h clk=0x%0h load=0x%0h data=0x%0h count=0x%0h", up_down, reset, clk, load, data, count);
    
    up_down <= 0;
    reset <= 0;
    load <= 0;
    #20;
    up_down <= 1;
    #30;
    reset <= 1;
    #10;
    reset <= 0;
    load <= 1;
    data <= 8'h14;
    #10;
    load <= 0;
    #30;
    up_down <= 0;
    #30;

    $finish();
  end
endmodule
