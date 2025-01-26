module gf_mul (
    input  logic [7:0] a     ,
    input  logic [7:0] b     ,
    output logic [7:0] result
);
    logic   [7:0] a_reg, b_reg;
    logic   [7:0] result_reg ;
    logic   [7:0] next_a     ;
    logic   [7:0] next_result;
    integer       i          ;

    always_comb
        begin
            a_reg      = a;
            b_reg      = b;
            result_reg = 8'b0;
            for (i = 0; i < 8; i = i + 1)
                begin
                    next_result = (b_reg[0]) ? (result_reg ^ a_reg) : result_reg;
                    next_a      = (a_reg[7]) ? ((a_reg << 1) ^ 8'h1B) : (a_reg << 1);
                    b_reg       = b_reg >> 1;
                    a_reg       = next_a;
                    result_reg  = next_result;
                end
            result = result_reg;
        end
endmodule