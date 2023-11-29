
module Binary_to_BCD(
   input logic [31:0] bin,
   output logic [7:0] bcd
	
   );
   
integer i;
	
always @(bin) begin
    bcd=0;		 	
    for (i=0;i<32;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
        if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
        bcd = {bcd[6:0],bin[31-i]};				//Shift one bit, and shift in the proper bit from input 
    end
end
endmodule
