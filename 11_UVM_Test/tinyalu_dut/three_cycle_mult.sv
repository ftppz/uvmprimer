// Copyright 2013 Ray Salemi
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module three_cycle (
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    input  logic        clk,
    input  logic        reset_n,
    input  logic        start,
    output logic        done_mult,
    output logic [15:0] result_mult
);

    // Pipeline registers
    logic [7:0]  a_int, b_int;      // Input pipeline stage
    logic [15:0] mult1, mult2;      // Multiplier pipeline stages
    logic        done3, done2, done1, done_mult_int;  // Done signal pipeline

    // Sequential multiplier pipeline
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // Asynchronous reset (active low)
            done_mult_int <= '0;
            done3         <= '0;
            done2         <= '0;
            done1         <= '0;
            a_int         <= '0;
            b_int         <= '0;
            mult1         <= '0;
            mult2         <= '0;
            result_mult   <= '0;
        end
        else begin
            // Pipeline stages
            a_int       <= A;
            b_int       <= B;
            mult1       <= a_int * b_int;  // Stage 1: Multiplication
            mult2       <= mult1;          // Stage 2: Pipeline delay
            result_mult <= mult2;          // Stage 3: Output

            // Done signal pipeline
            done3       <= start && !done_mult_int;
            done2       <= done3 && !done_mult_int;
            done1      <= done2 && !done_mult_int;
            done_mult_int <= done1 && !done_mult_int;
        end
    end

    assign done_mult = done_mult_int;

endmodule