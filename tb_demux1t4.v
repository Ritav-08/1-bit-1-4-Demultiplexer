`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2026 09:28:01
// Design Name: 
// Module Name: tb_demux1t4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_demux1t4();
reg din;
reg en;
reg [1:0]sel;
wire [3:0]dout;

demux1t4 DeMux(.din(din), .en(en), .sel(sel), .dout(dout));

initial begin //enable signal
#2 en = 0;
#10 en = 1;
end

initial begin //selection and input data 
#5 {din, sel} = 3'bxxx;
#5 {din, sel} = 3'b000;
#5 {din, sel} = 3'b001;
#5 {din, sel} = 3'b010;
#5 {din, sel} = 3'b011;
#5 {din, sel} = 3'b100;
#5 {din, sel} = 3'b101;
#5 {din, sel} = 3'b110;
#5 {din, sel} = 3'b111;
#5 {din, sel} = 3'bx00;
#5 {din, sel} = 3'b1x1;
#5 {din, sel} = 3'b00x;
#5 {din, sel} = 3'b1xx;
end

initial begin //monitor and capture
$monitor("At time: ", $time, ", en: %b, Input: %b, Select: %b, Output line: %b", en, din, sel, dout);
$dumpfile("demux1t4.vcd");
$dumpvars(0, tb_demux1t4);
#100 $finish;
end

endmodule
