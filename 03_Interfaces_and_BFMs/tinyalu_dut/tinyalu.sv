module tinyalu (
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    input  logic        clk,
    input  logic [2:0]  op,
    input  logic        reset_n,
    input  logic        start,
    output logic        done,
    output logic [15:0] result
);

  // Internal signal declarations
  logic done_aax;
  logic done_mult;
  logic [15:0] result_aax;
  logic [15:0] result_mult;
  logic start_single; // Start signal for single cycle ops
  logic start_mult;   // Start signal for multiply
  logic done_internal;

  // Component Declarations
  single_cycle add_and_xor (
      .A(A),
      .B(B),
      .clk(clk),
      .op(op),
      .reset_n(reset_n),
      .start(start_single),
      .done_aax(done_aax),
      .result_aax(result_aax)
  );

  three_cycle mult (
      .A(A),
      .B(B),
      .clk(clk),
      .reset_n(reset_n),
      .start(start_mult),
      .done_mult(done_mult),
      .result_mult(result_mult)
  );

  // Start signal demultiplexer
  always_comb begin
    case (op[2])
      1'b0: begin
        start_single = start;
        start_mult   = 1'b0;
      end
      1'b1: begin
        start_single = 1'b0;
        start_mult   = start;
      end
      default: begin
        start_single = 1'b0;
        start_mult   = 1'b0;
      end
    endcase
  end

  // Result multiplexer
  always_comb begin
    case (op[2])
      1'b0: result = result_aax;
      1'b1: result = result_mult;
      default: result = 'X;
    endcase
  end

  // Done signal multiplexer
  always_comb begin
    case (op[2])
      1'b0: done_internal = done_aax;
      1'b1: done_internal = done_mult;
      default: done_internal = 1'bX;
    endcase
  end

  // Output assignment
  assign done = done_internal;

endmodule
