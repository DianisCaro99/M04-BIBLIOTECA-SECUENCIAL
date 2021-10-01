do BB_SYSTEM_run_msim_rtl_verilog.do
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave  -divider RegSHIFTER
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_clear_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/TB_SYSTEM_shiftselection_In
add wave  -radix Unsigned /TB_SYSTEM/TB_SYSTEM_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/TB_SYSTEM_data_OutBUS

add wave  -divider SC_DEBOUNCE1_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_Out

add wave  -divider SC_DEBOUNCE1_u1
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_Out

add wave  -divider SC_DEBOUNCE1_u2
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out

add wave  -divider SC_DEBOUNCE1_u3
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u3/SC_DEBOUNCE1_button_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u3/SC_DEBOUNCE1_button_Out

add wave  -divider STATEMACHINE_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_clear_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_load_InLow
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_shiftselection_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_clear_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_load_OutLow
add wave -noupdate -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_shiftselection_Out
add wave -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_STATEMACHINE_u0/STATE_Register

add wave  -divider SC_RegSHIFTER_u0
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_clear_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_load_InLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_shiftselection_In
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_data_InBUS
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/SC_RegSHIFTER_u0/SC_RegSHIFTER_data_OutBUS

restart
run 500ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
