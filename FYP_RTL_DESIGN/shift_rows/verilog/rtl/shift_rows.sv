module shiftrows(
    input logic  [127:0] in,  
    output logic  [127:0] out 
);

    // Split the input state into 16 bytes for clarity
    logic  [7:0] s [0:15];
    logic  [7:0] sr [0:15];

    assign {s[0 ], s[1 ], s[2 ], s[3 ], 
            s[4 ], s[5 ], s[6 ], s[7 ], 
            s[8 ], s[9 ], s[10], s[11], 
            s[12], s[13], s[14], s[15]} = in;

    assign {sr[0 ], sr[1 ], sr[2 ], sr[3 ], 
            sr[4 ], sr[5 ], sr[6 ], sr[7 ], 
            sr[8 ], sr[9 ], sr[10], sr[11], 
            sr[12], sr[13], sr[14], sr[15]} 
            =  
            {s[0 ], s[5 ], s[10], s[15],          
             s[4 ], s[9 ], s[14], s[3 ],
             s[8 ], s[13], s[2 ], s[7 ],
             s[12], s[1 ], s[6 ], s[11]};
               

    // Combine the output bytes back into a 128-bit vector
    assign out = {sr[0 ], sr[1 ], sr[2 ], sr[3 ], 
                  sr[4 ], sr[5 ], sr[6 ], sr[7 ], 
                  sr[8 ], sr[9 ], sr[10], sr[11], 
                  sr[12], sr[13], sr[14], sr[15]};

endmodule
