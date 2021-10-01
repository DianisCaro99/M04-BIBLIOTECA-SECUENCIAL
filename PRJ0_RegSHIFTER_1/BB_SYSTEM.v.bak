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
//# GNU General Public License for more details.
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
