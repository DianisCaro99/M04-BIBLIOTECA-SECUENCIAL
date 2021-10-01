/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details./*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
`timescale 1 ns/ 1 ns
module TB_SYSTEM();
// constants                                           
// ============================================
// Parameter ( may differ for physical synthesis)
// ============================================
	// general purpose registers
	reg eachvec;
	parameter TCK = 20; // clock period in ns
	parameter CLK_FREQ = 1000000000 / TCK; // Frequenzy in HZ
	parameter DATAWIDTH_BUS = 8;
	integer ii=0;
	// test vector input registers
// ============================================
// INTERNAL WIRE AND REG DECLARATIONS
// ============================================
	// wires (OUTPUTS)
	wire [DATAWIDTH_BUS-1:0] TB_SYSTEM_data_OutBUS;
	// reg (INPUTS)
	reg TB_SYSTEM_CLOCK_50;
	reg TB_SYSTEM_RESET_InHigh;
	reg TB_SYSTEM_clear_InLow; 
	reg	TB_SYSTEM_load_InLow;
	reg [1:0] TB_SYSTEM_shiftselection_In;
	reg [DATAWIDTH_BUS-1:0] TB_SYSTEM_data_InBUS;	
	
	reg[7:0] random1;
	// assign statements (if any)                          
	BB_SYSTEM BB_SYSTEM_u0 (
	// port map - connection between master ports and signals/registers   
		.BB_SYSTEM_data_OutBUS(TB_SYSTEM_data_OutBUS),
		.BB_SYSTEM_CLOCK_50(TB_SYSTEM_CLOCK_50),
		.BB_SYSTEM_RESET_InHigh(TB_SYSTEM_RESET_InHigh),
		.BB_SYSTEM_clear_InLow(TB_SYSTEM_clear_InLow),
		.BB_SYSTEM_load_InLow(TB_SYSTEM_load_InLow),
		.BB_SYSTEM_shiftselection_In(TB_SYSTEM_shiftselection_In),
		.BB_SYSTEM_data_InBUS(TB_SYSTEM_data_InBUS)
	);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
	TB_SYSTEM_CLOCK_50 <= 0;
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
	#(TCK/2) TB_SYSTEM_CLOCK_50 <= ~ TB_SYSTEM_CLOCK_50;
initial begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin     
	random1 <= $random;
	#0 		TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b00000000;
//RESET
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b1; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b00000000;
//LOAD
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b0; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//COUNT_1
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b10; TB_SYSTEM_data_InBUS <= 8'b00000000;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b00000000;
//CLEAR	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b0; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//LOAD
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b0; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//COUNT_2
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b10; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//COUNT_2
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b10; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;	
//COUNT_2
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b10; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//COUNT_2
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b10; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
//COUNT_1
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b01; TB_SYSTEM_data_InBUS <= 8'b10100101;	
	#10000000 	TB_SYSTEM_RESET_InHigh <= 1'b0; TB_SYSTEM_clear_InLow <= 1'b1; TB_SYSTEM_load_InLow <= 1'b1; TB_SYSTEM_shiftselection_In <= 2'b11; TB_SYSTEM_data_InBUS <= 8'b10100101;
	
   for (ii=0; ii<5; ii=ii+1)
		begin
			#10000000
			TB_SYSTEM_load_InLow <= 1'b1;
			TB_SYSTEM_shiftselection_In <= 2'b11;
			random1 <= $random;
			TB_SYSTEM_data_InBUS <= random1;
			#10000000
			TB_SYSTEM_load_InLow <= 1'b0;
			TB_SYSTEM_shiftselection_In <= 2'b11;
			#10000000
			TB_SYSTEM_load_InLow <= 1'b1;
			TB_SYSTEM_shiftselection_In <= 2'b11;
			#10000000
			TB_SYSTEM_load_InLow <= 1'b1;
			TB_SYSTEM_shiftselection_In <= 2'b01;
			#10000000
			TB_SYSTEM_load_InLow <= 1'b1;
			TB_SYSTEM_shiftselection_In <= 2'b01;			
			#10000000
			TB_SYSTEM_load_InLow <= 1'b1;
			TB_SYSTEM_shiftselection_In <= 2'b11;
         $display("%1d - Time: %2d TB_SYSTEM_clear_InLow: %2d, TB_SYSTEM_load_InLow: %2d, TB_SYSTEM_shiftselection_In: %2d, TB_SYSTEM_data_InBUS: %2d, TB_SYSTEM_data_OutBUS: %2d", ii, $time, TB_SYSTEM_clear_InLow, TB_SYSTEM_clear_InLow, TB_SYSTEM_load_InLow, TB_SYSTEM_shiftselection_In, TB_SYSTEM_data_InBUS,TB_SYSTEM_data_OutBUS) ;        end
	//#(TCK*10000) $finish;	
@eachvec;
$finish;                                              
// --> end                                             
end                                                    
endmodule


//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_data_OutBUS,
//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_clear_InLow, 
	BB_SYSTEM_load_InLow,
	BB_SYSTEM_shiftselection_In,
	BB_SYSTEM_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_BUS = 8;
//=======================================================
//  PORT declarations
//=======================================================
output		[DATAWIDTH_BUS-1:0]	BB_SYSTEM_data_OutBUS;
input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_clear_InLow;
input		BB_SYSTEM_load_InLow;
input		[1:0] BB_SYSTEM_shiftselection_In;
input		[DATAWIDTH_BUS-1:0]	BB_SYSTEM_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire	STATEMACHINE_clear_cwire;
wire	STATEMACHINE_load_cwire;
wire	[1:0] STATEMACHINE_shiftselection_cwire;
wire BB_SYSTEM_clear_InLow_cwire;
wire BB_SYSTEM_load_InLow_cwire;
wire [1:0] BB_SYSTEM_shiftselection_In_cwire;

//=======================================================
//  Structural coding
//=======================================================
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_clear_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_clear_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_load_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_load_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_shiftselection_In_cwire[0]),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_shiftselection_In[0])
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_shiftselection_In_cwire[1]),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(BB_SYSTEM_shiftselection_In[1])
);

	SC_STATEMACHINE SC_STATEMACHINE_u0 (
// port map - connection between master ports and signals/registers   
	.SC_STATEMACHINE_clear_OutLow(STATEMACHINE_clear_cwire), 
	.SC_STATEMACHINE_load_OutLow(STATEMACHINE_load_cwire), 
	.SC_STATEMACHINE_shiftselection_Out(STATEMACHINE_shiftselection_cwire),
	.SC_STATEMACHINE_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_clear_InLow(BB_SYSTEM_clear_InLow_cwire), 
	.SC_STATEMACHINE_load_InLow(BB_SYSTEM_load_InLow_cwire), 
	.SC_STATEMACHINE_shiftselection_In(BB_SYSTEM_shiftselection_In_cwire)
);

SC_RegSHIFTER #(.RegSHIFTER_DATAWIDTH(DATAWIDTH_BUS)) SC_RegSHIFTER_u0 (
// port map - connection between master ports and signals/registers   
	.SC_RegSHIFTER_data_OutBUS(BB_SYSTEM_data_OutBUS),
	.SC_RegSHIFTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RegSHIFTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RegSHIFTER_clear_InLow(STATEMACHINE_clear_cwire),	
	.SC_RegSHIFTER_load_InLow(STATEMACHINE_load_cwire),
	.SC_RegSHIFTER_shiftselection_In(STATEMACHINE_shiftselection_cwire),
	.SC_RegSHIFTER_data_InBUS(BB_SYSTEM_data_InBUS)
);

endmodule
