module mix_column (
	input logic  [127:0] in ,
	output logic [127:0] out
	
);
 logic  [7:0] s [0:15];
 logic  [7:0] c [0:15];
 logic [7:0] const_mat [0:15];
 logic [7:0] mul [0:15];


    assign {s[0 ], s[1 ], s[2 ], s[3 ], 
            s[4 ], s[5 ], s[6 ], s[7 ], 
            s[8 ], s[9 ], s[10], s[11], 
            s[12], s[13], s[14], s[15]} = in;

    assign {c[0 ], c[4 ], c[8 ], c[12], 
            c[1 ], c[5 ], c[9 ], c[13], 
            c[2 ], c[6 ], c[10], c[14], 
            c[3 ], c[7 ], c[11], c[15]} = const_mat;

   always_comb
   begin
   	const_mat={8'h02,8'h01,8'h01,8'h03,
   	           8'h03,8'h02,8'h01,8'h01,
   	           8'h01,8'h03,8'h02,8'h01,
   	           8'h01,8'h01,8'h03,8'h02} ;
   	          
   end
   genvar i;
  generate
  	for (j = 0; j < 4; j++) 
  	begin:col
  		
   		for ( i = 0; i < 4; i++) 
   		begin : rows

          gf_mul i_gf_mul (.a(c[j]), .b(s[i]), .result(mul[i]));
          gf_mul i_gf_mul (.a(c[j+1]), .b(s[i+4]), .result(mul[i+1]));
          gf_mul i_gf_mul (.a(c[j+2]), .b(s[i+8]), .result(mul[i+2]));
          gf_mul i_gf_mul (.a(c[j+3]), .b(s[i+12]), .result(mul[i+3]));

   	     end
  	end
  endgenerate

  always_comb
  begin
  	for ( k = 0; k < 4; k++)
  	 begin
  		mat_mul[k] = 
  	end
  end
   	
   		mat_mul[0] =  mul[0 ] ^ mul[4 ] ^ mul[8 ] ^ mul[12];
   		mat_mul[1] =  mul[1 ] ^ mul[5 ] ^ mul[9 ] ^ mul[13];
   		mat_mul[2] =  mul[2 ] ^ mul[6 ] ^ mul[10] ^ mul[14];
   		mat_mul[3] =  mul[3 ] ^ mul[7 ] ^ mul[11] ^ mul[15];
   		mat_mul[4] =  mul[4 ] ^ mul[8 ] ^ mul[12] ^ mul[16];
   		mat_mul[5] =  mul[5 ] ^ mul[9 ] ^ mul[13] ^ mul[17];
   		mat_mul[6] =  mul[6 ] ^ mul[10] ^ mul[14] ^ mul[18];
   		mat_mul[7] =  mul[7 ] ^ mul[11] ^ mul[15] ^ mul[19];
   		mat_mul[8] =  mul[8 ] ^ mul[12] ^ mul[16] ^ mul[20];
   		mat_mul[9] =  mul[9 ] ^ mul[13] ^ mul[17] ^ mul[21];
   		mat_mul[10] = mul[10] ^ mul[14] ^ mul[18] ^ mul[22];
   		mat_mul[11] = mul[11] ^ mul[15] ^ mul[19] ^ mul[23];
   		mat_mul[12] = mul[12] ^ mul[16] ^ mul[20] ^ mul[24];
   		mat_mul[13] = mul[13] ^ mul[17] ^ mul[21] ^ mul[25];
   		mat_mul[14] = mul[14] ^ mul[18] ^ mul[22] ^ mul[26];
   		mat_mul[15] = mul[15] ^ mul[19] ^ mul[23] ^ mul[27];
	

   		
   	
                


endmodule 