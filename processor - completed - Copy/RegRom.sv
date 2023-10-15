module RegRom(
	input logic[31:0] a,b,
	input logic[4:0] k,m
	

);


logic [31:0] register_file;

always @* begin
      register_file[k] = a;
      register_file[m] = b;
   end

endmodule