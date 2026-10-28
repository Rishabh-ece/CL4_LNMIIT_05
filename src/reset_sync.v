module reset_sync #(
  parameter RST_SYNC = 1
) (
  input  wire clk,
  input  wire rst_n,
  output wire internal_rst_n
);

  reg rst_s1;
  reg rst_s2;

  always @(posedge clk) begin
    rst_s1 <= rst_n;
    rst_s2 <= rst_s1;
  end

  assign internal_rst_n = (RST_SYNC == 1)
                        ? rst_s2 : rst_n;

endmodule
