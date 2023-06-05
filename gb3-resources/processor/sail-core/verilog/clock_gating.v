module clockgating(clk, enable, gated_clk);
    input clk;
    input enable;
    output reg gated_clk;

    reg internal_clk;
    reg enable1;

    initial begin
        internal_clk = 1'b0;
		enable1 = 1'b0;
        gated_clk = 1'b0;
	end

    always @(negedge clk) begin
        enable1 <= enable;
    end

    always @(posedge clk) begin
        if (enable1)
            internal_clk <= 1'b1;  
        else
            internal_clk <= 1'b0;  
    end

    assign gated_clk = clk & internal_clk;  

endmodule