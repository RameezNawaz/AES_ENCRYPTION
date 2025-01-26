module add_round_key (
    input  logic [127:0] in,   // Input state (128-bit)
    input  logic [127:0] key,  // Round key (128-bit)
    output logic [127:0] out   // Output state after XOR
);

    // XOR each byte of the input state with the corresponding byte of the round key
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
             out[8*i +: 8] = in[8*i +: 8] ^ key[8*i +: 8];  //[8*i+7 : i*8]
        end
    endgenerate

endmodule

