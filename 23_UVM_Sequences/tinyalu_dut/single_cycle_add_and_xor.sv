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

module single_cycle (
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    input  logic        clk,
    input  logic [2:0]  op,
    input  logic        reset_n,
    input  logic        start,
    output logic        done_aax,
    output logic [15:0] result_aax
);

    // Internal signals
    logic [7:0]  a_int, b_int;
    logic [15:0] mul_int1, mul_int2;
    logic        done_aax_int;

    // Main operation process (synchronous)
    always_ff @(posedge clk) begin
        if (!reset_n) begin
            // Synchronous reset
            result_aax <= 16'b0;
        end
        else begin
            if (start) begin
                case (op)
                    3'b001: result_aax <= {8'b0, A} + {8'b0, B};  // Addition
                    3'b010: result_aax <= {8'b0, A} & {8'b0, B};   // Bitwise AND
                    3'b011: result_aax <= {8'b0, A} ^ {8'b0, B};   // Bitwise XOR
                    default: ; // No operation for other op codes
                endcase
            end
        end
    end

    // Done signal generation (asynchronous reset)
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            done_aax_int <= 1'b0;
        end
        else begin
            done_aax_int <= (start && (op != 3'b000));
        end
    end

    assign done_aax = done_aax_int;

endmodule