/*
Project 3: Synchronou counter with control signal to toggle up/down
Verigy with directed stimulus
*/

module up_down_counter(input up_down,
                       input reset,
                       input clk,
                       input load,
                       input [7:0] data,
                       output reg [7:0] count);
    initial begin
        count <= 8'h00;
    end
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            count <= 8'h00;
        end
        else if(load) begin
            count <= data;
        end
        else if(up_down) begin
            count <= count + 1;
        end
        else begin
            count <= count - 1;
        end
        
    end
  
endmodule

