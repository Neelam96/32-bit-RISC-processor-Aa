#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
// object initialization 

#define simple_proc__cal_Next_program_cnt_inner_inarg_prep_macro__ __declare_static_bit_vector(opcode,8);\
bit_vector_cast_to_bit_vector(0, &(opcode), &((*__popcode)));\
__declare_static_bit_vector(rd1,32);\
bit_vector_cast_to_bit_vector(0, &(rd1), &((*__prd1)));\
__declare_static_bit_vector(rd2,32);\
bit_vector_cast_to_bit_vector(0, &(rd2), &((*__prd2)));\
__declare_static_bit_vector(program_cnt,8);\
bit_vector_cast_to_bit_vector(0, &(program_cnt), &((*__pprogram_cnt)));\
__declare_static_bit_vector(is_rs1_neg,1);\
bit_vector_cast_to_bit_vector(0, &(is_rs1_neg), &((*__pis_rs1_neg)));\
__declare_static_bit_vector(n_program_cnt,8);\
__declare_static_bit_vector(is_Branch,1);\
__declare_static_bit_vector(normalFlow,1);\
__declare_static_bit_vector(addr1,8);\
__declare_static_bit_vector(addr2,8);\

#define simple_proc__cal_Next_program_cnt_assign_stmt_129_c_macro_ __declare_static_bit_vector(EQ_u8_u1_119,1);\
__declare_static_bit_vector(NOT_u1_u1_121,1);\
__declare_static_bit_vector(AND_u1_u1_122,1);\
__declare_static_bit_vector(EQ_u8_u1_125,1);\
__declare_static_bit_vector(AND_u1_u1_127,1);\
__declare_static_bit_vector(OR_u1_u1_128,1);\
bit_vector_equal(0, &(opcode), &(BZ), &(EQ_u8_u1_119));\
bit_vector_not( &(is_rs1_neg), &(NOT_u1_u1_121));\
bit_vector_and(&(EQ_u8_u1_119), &(NOT_u1_u1_121), &(AND_u1_u1_122));\
bit_vector_equal(0, &(opcode), &(BN), &(EQ_u8_u1_125));\
bit_vector_and(&(EQ_u8_u1_125), &(is_rs1_neg), &(AND_u1_u1_127));\
bit_vector_or(&(AND_u1_u1_122), &(AND_u1_u1_127), &(OR_u1_u1_128));\
bit_vector_cast_to_bit_vector(0, &(is_Branch), &(OR_u1_u1_128));\
;

#define simple_proc__cal_Next_program_cnt_assign_stmt_141_c_macro_ __declare_static_bit_vector(EQ_u8_u1_134,1);\
__declare_static_bit_vector(OR_u1_u1_135,1);\
__declare_static_bit_vector(EQ_u8_u1_138,1);\
__declare_static_bit_vector(OR_u1_u1_139,1);\
__declare_static_bit_vector(NOT_u1_u1_140,1);\
bit_vector_equal(0, &(opcode), &(CALL), &(EQ_u8_u1_134));\
bit_vector_or(&(is_Branch), &(EQ_u8_u1_134), &(OR_u1_u1_135));\
bit_vector_equal(0, &(opcode), &(JMP), &(EQ_u8_u1_138));\
bit_vector_or(&(OR_u1_u1_135), &(EQ_u8_u1_138), &(OR_u1_u1_139));\
bit_vector_not( &(OR_u1_u1_139), &(NOT_u1_u1_140));\
bit_vector_cast_to_bit_vector(0, &(normalFlow), &(NOT_u1_u1_140));\
;

#define simple_proc__cal_Next_program_cnt_assign_stmt_145_c_macro_ __declare_static_bit_vector(slice_144,8);\
bit_vector_slice(&(rd1), &(slice_144), 0);\
bit_vector_cast_to_bit_vector(0, &(addr1), &(slice_144));\
;

#define simple_proc__cal_Next_program_cnt_assign_stmt_149_c_macro_ __declare_static_bit_vector(slice_148,8);\
bit_vector_slice(&(rd2), &(slice_148), 0);\
bit_vector_cast_to_bit_vector(0, &(addr2), &(slice_148));\
;

#define simple_proc__cal_Next_program_cnt_assign_stmt_180_c_macro_ __declare_static_bit_vector(EQ_u8_u1_153,1);\
__declare_static_bit_vector(konst_155,8);\
bit_vector_clear(&konst_155);\
__declare_static_bit_vector(MUX_156,8);\
__declare_static_bit_vector(EQ_u8_u1_159,1);\
__declare_static_bit_vector(konst_161,8);\
bit_vector_clear(&konst_161);\
__declare_static_bit_vector(MUX_162,8);\
__declare_static_bit_vector(OR_u8_u8_163,8);\
__declare_static_bit_vector(EQ_u1_u1_166,1);\
__declare_static_bit_vector(konst_168,8);\
bit_vector_clear(&konst_168);\
__declare_static_bit_vector(MUX_169,8);\
__declare_static_bit_vector(EQ_u1_u1_172,1);\
__declare_static_bit_vector(konst_174,8);\
bit_vector_clear(&konst_174);\
konst_174.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u8_u8_175,8);\
__declare_static_bit_vector(konst_176,8);\
bit_vector_clear(&konst_176);\
__declare_static_bit_vector(MUX_177,8);\
__declare_static_bit_vector(OR_u8_u8_178,8);\
__declare_static_bit_vector(OR_u8_u8_179,8);\
bit_vector_equal(0, &(opcode), &(CALL), &(EQ_u8_u1_153));\
if (has_undefined_bit(&EQ_u8_u1_153)) {fprintf(stderr, "Error: variable EQ_u8_u1_153 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_153));assert(0);} \
bit_vector_clear(&konst_155);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_153)){\
bit_vector_cast_to_bit_vector(0, &(MUX_156), &(addr1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_156), &(konst_155));\
}\
bit_vector_equal(0, &(opcode), &(JMP), &(EQ_u8_u1_159));\
if (has_undefined_bit(&EQ_u8_u1_159)) {fprintf(stderr, "Error: variable EQ_u8_u1_159 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_159));assert(0);} \
bit_vector_clear(&konst_161);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_159)){\
bit_vector_cast_to_bit_vector(0, &(MUX_162), &(addr1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_162), &(konst_161));\
}\
bit_vector_or(&(MUX_156), &(MUX_162), &(OR_u8_u8_163));\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_166));\
if (has_undefined_bit(&EQ_u1_u1_166)) {fprintf(stderr, "Error: variable EQ_u1_u1_166 has undefined value (%s) at test point.\n", to_string(&EQ_u1_u1_166));assert(0);} \
bit_vector_clear(&konst_168);\
if(bit_vector_to_uint64(0, &EQ_u1_u1_166)){\
bit_vector_cast_to_bit_vector(0, &(MUX_169), &(addr2));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_169), &(konst_168));\
}\
bit_vector_equal(0, &(normalFlow), &(one_1), &(EQ_u1_u1_172));\
if (has_undefined_bit(&EQ_u1_u1_172)) {fprintf(stderr, "Error: variable EQ_u1_u1_172 has undefined value (%s) at test point.\n", to_string(&EQ_u1_u1_172));assert(0);} \
bit_vector_clear(&konst_174);\
konst_174.val.byte_array[0] = 1;\
bit_vector_plus( &(program_cnt), &(konst_174), &(ADD_u8_u8_175));\
bit_vector_clear(&konst_176);\
if(bit_vector_to_uint64(0, &EQ_u1_u1_172)){\
bit_vector_cast_to_bit_vector(0, &(MUX_177), &(ADD_u8_u8_175));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_177), &(konst_176));\
}\
bit_vector_or(&(MUX_169), &(MUX_177), &(OR_u8_u8_178));\
bit_vector_or(&(OR_u8_u8_163), &(OR_u8_u8_178), &(OR_u8_u8_179));\
bit_vector_cast_to_bit_vector(0, &(n_program_cnt), &(OR_u8_u8_179));\
;

#define simple_proc__cal_Next_program_cnt_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pn_program_cnt)), &(n_program_cnt));\
;

#define simple_proc__global_storage_initializer__inner_inarg_prep_macro__ 
#define simple_proc__global_storage_initializer__inner_outarg_prep_macro__ ;

#define simple_proc__global_storage_initializer__outer_arg_decl_macro__ ;

#define simple_proc__global_storage_initializer__outer_op_xfer_macro__ ;

#define simple_proc__memory_daemon_inner_inarg_prep_macro__ __declare_static_bit_vector(data_in_mem,64);\
__declare_static_bit_vector(data_in,32);\

#define simple_proc__memory_daemon_assign_stmt_188_c_macro_ __declare_static_bit_vector(RPIPE_mem_in_187,64);\
read_bit_vector_from_pipe("mem_in",&(RPIPE_mem_in_187));\
bit_vector_cast_to_bit_vector(0, &(data_in_mem), &(RPIPE_mem_in_187));\
;

#define simple_proc__memory_daemon_assign_stmt_192_c_macro_ __declare_static_bit_vector(slice_191,32);\
bit_vector_slice(&(data_in_mem), &(slice_191), 0);\
bit_vector_cast_to_bit_vector(0, &(data_in), &(slice_191));\
;

#define simple_proc__memory_daemon_assign_stmt_197_c_macro_ __declare_static_bit_vector(konst_195,32);\
bit_vector_clear(&konst_195);\
konst_195.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u32_u32_196,32);\
bit_vector_clear(&konst_195);\
konst_195.val.byte_array[0] = 1;\
bit_vector_plus( &(data_in), &(konst_195), &(ADD_u32_u32_196));\
write_bit_vector_to_pipe("mem_out",&(ADD_u32_u32_196));\
;

#define simple_proc__memory_daemon_inner_outarg_prep_macro__ ;

#define simple_proc__memory_daemon_outer_arg_decl_macro__ ;

#define simple_proc__memory_daemon_outer_op_xfer_macro__ ;

#define simple_proc__processor_inner_inarg_prep_macro__ 
#define simple_proc__processor_branch_block_stmt_299_c_export_decl_macro_ __declare_static_bit_vector(program_cnt,8);\
__declare_static_bit_vector(instruction,32);\
__declare_static_bit_vector(opcode,8);\
__declare_static_bit_vector(rs1_imm,8);\
__declare_static_bit_vector(rs2,8);\
__declare_static_bit_vector(rd,8);\
__declare_static_bit_vector(rd1,32);\
__declare_static_bit_vector(rd2,32);\
__declare_static_bit_vector(is_rs1_neg,1);\
__declare_static_bit_vector(opcode_369_delayed_7_0,8);\
__declare_static_bit_vector(program_cnt_372_delayed_7_0,8);\
__declare_static_bit_vector(n_program_cnt,8);\
__declare_static_bit_vector(type_cast_400_400_delayed_7_0,32);\
__declare_static_bit_vector(EQ_u8_u1_407_407_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_387_387_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_395_395_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_470_470_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_416_416_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_424_424_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_433_433_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_443_443_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_451_451_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_460_460_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_479_479_delayed_7_0,1);\
__declare_static_bit_vector(EQ_u8_u1_489_489_delayed_7_0,1);\
__declare_static_bit_vector(exec_result,32);\
__declare_static_bit_vector(memWrite,1);\
__declare_static_bit_vector(regWrite,1);\
__declare_static_bit_vector(memAddr,8);\
__declare_static_bit_vector(is_uart_addr,1);\
__declare_static_bit_vector(is_uart_addr_584_delayed_6_0,1);\
__declare_static_bit_vector(memWrite_586_delayed_1_0,1);\
__declare_static_bit_vector(CONCAT_u1_u9_588_588_delayed_6_0,9);\
__declare_static_bit_vector(memReadData,32);\
__declare_static_bit_vector(data_from_uart,32);\
__declare_static_bit_vector(write_to_uart,1);\
__declare_static_bit_vector(program_cnt_1,8);\
__declare_static_bit_vector(EQ_u8_u1_617_617_delayed_8_0,1);\
__declare_static_bit_vector(memReadData_618_delayed_6_0,32);\
__declare_static_bit_vector(EQ_u8_u1_621_621_delayed_8_0,1);\
__declare_static_bit_vector(type_cast_623_623_delayed_8_0,32);\
__declare_static_bit_vector(EQ_u1_u1_626_626_delayed_8_0,1);\
__declare_static_bit_vector(regWriteData,32);\
__declare_static_bit_vector(rs1_imm_635_delayed_9_0,8);\
__declare_static_bit_vector(rs2_637_delayed_9_0,8);\
__declare_static_bit_vector(regWrite_638_delayed_9_0,1);\
__declare_static_bit_vector(rd_639_delayed_9_0,8);\
__declare_static_bit_vector(read_while_write1,32);\
__declare_static_bit_vector(read_while_write2,32);\
__declare_static_bit_vector(write_to_uart_644_delayed_8_0,1);\


#define simple_proc__processor_merge_stmt_301_c_preamble_macro_ uint8_t merge_stmt_301_entry_flag;\
merge_stmt_301_entry_flag = do_while_entry_flag;\
goto merge_stmt_301_run;\
merge_stmt_301_run: ;\

#define simple_proc__processor_phi_stmt_302_c_macro_ __declare_static_bit_vector(konst_304,8);\
bit_vector_clear(&konst_304);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(program_cnt), &(n_program_cnt));\
}\
else {\
__declare_static_bit_vector(konst_304,8);\
bit_vector_clear(&konst_304);\
bit_vector_clear(&konst_304);\
bit_vector_cast_to_bit_vector(0, &(program_cnt), &(konst_304));\
}\
;
;

#define simple_proc__processor_merge_stmt_301_c_postamble_macro_ merge_stmt_301_entry_flag = 0;

#define simple_proc__processor_assign_stmt_315_c_macro_ __declare_static_bit_vector(CONCAT_u1_u9_310,9);\
__declare_static_bit_vector(CONCAT_u23_u55_313,55);\
bit_vector_clear(&CONCAT_u23_u55_313);\
__declare_static_bit_vector(CONCAT_u9_u64_314,64);\
bit_vector_concatenate( &(read_signal), &(program_cnt), &(CONCAT_u1_u9_310));\
bit_vector_concatenate( &(zero_23), &(zero_32), &(CONCAT_u23_u55_313));\
bit_vector_concatenate( &(CONCAT_u1_u9_310), &(CONCAT_u23_u55_313), &(CONCAT_u9_u64_314));\
write_bit_vector_to_pipe("mem_in",&(CONCAT_u9_u64_314));\
;

#define simple_proc__processor_assign_stmt_318_c_macro_ __declare_static_bit_vector(RPIPE_mem_out_317,32);\
read_bit_vector_from_pipe("mem_out",&(RPIPE_mem_out_317));\
bit_vector_cast_to_bit_vector(0, &(instruction), &(RPIPE_mem_out_317));\
;

#define simple_proc__processor_assign_stmt_322_c_macro_ __declare_static_bit_vector(slice_321,8);\
bit_vector_slice(&(instruction), &(slice_321), 24);\
bit_vector_cast_to_bit_vector(0, &(opcode), &(slice_321));\
;

#define simple_proc__processor_assign_stmt_326_c_macro_ __declare_static_bit_vector(slice_325,8);\
bit_vector_slice(&(instruction), &(slice_325), 16);\
bit_vector_cast_to_bit_vector(0, &(rs1_imm), &(slice_325));\
;

#define simple_proc__processor_assign_stmt_330_c_macro_ __declare_static_bit_vector(slice_329,8);\
bit_vector_slice(&(instruction), &(slice_329), 8);\
bit_vector_cast_to_bit_vector(0, &(rs2), &(slice_329));\
;

#define simple_proc__processor_assign_stmt_334_c_macro_ __declare_static_bit_vector(slice_333,8);\
bit_vector_slice(&(instruction), &(slice_333), 0);\
bit_vector_cast_to_bit_vector(0, &(rd), &(slice_333));\
;

#define simple_proc__processor_call_stmt_344_c_macro_ _simple_proc_registerFileModule_( &(one_1),  &(rs1_imm),  &(one_1),  &(rs2),  &(zero_1),  &(rd),  &(zero_32), &(rd1), &(rd2));\
;

#define simple_proc__processor_assign_stmt_348_c_macro_ __declare_static_bit_vector(slice_347,1);\
bit_vector_slice(&(rd1), &(slice_347), 31);\
bit_vector_cast_to_bit_vector(0, &(is_rs1_neg), &(slice_347));\
;

#define simple_proc__processor_assign_stmt_351_c_macro_ bit_vector_cast_to_bit_vector(0, &(opcode_369_delayed_7_0), &(opcode));\
;

#define simple_proc__processor_assign_stmt_354_c_macro_ bit_vector_cast_to_bit_vector(0, &(program_cnt_372_delayed_7_0), &(program_cnt));\
;

#define simple_proc__processor_call_stmt_361_c_macro_ _simple_proc_cal_Next_program_cnt_( &(opcode_369_delayed_7_0),  &(rd1),  &(rd2),  &(program_cnt_372_delayed_7_0),  &(is_rs1_neg), &(n_program_cnt));\
;

#define simple_proc__processor_stmt_366_c_macro_ uint32_t simple_proc__processor_stmt_366_c_macro___print_counter= get_file_print_lock(simple_proc___report_log_file__);if(simple_proc___report_log_file__ != NULL) fprintf(simple_proc___report_log_file__,"[%u]processor>\t%s\n",simple_proc__processor_stmt_366_c_macro___print_counter,"status");if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor>\t\t%s\t\t",simple_proc__processor_stmt_366_c_macro___print_counter,"instruction");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(instruction)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor>\t\t%s\t\t",simple_proc__processor_stmt_366_c_macro___print_counter,"rd1");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(rd1)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor>\t\t%s\t\t",simple_proc__processor_stmt_366_c_macro___print_counter,"rd2");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(rd2)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor>\t\t%s\t\t",simple_proc__processor_stmt_366_c_macro___print_counter,"n_program_cnt");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(n_program_cnt)));}release_file_print_lock(simple_proc___report_log_file__);;

#define simple_proc__processor_assign_stmt_370_c_macro_ __declare_static_bit_vector(type_cast_369,32);\
bit_vector_bitcast_to_bit_vector( &(type_cast_369), &(rs1_imm));\
bit_vector_cast_to_bit_vector(0, &(type_cast_400_400_delayed_7_0), &(type_cast_369));\
;

#define simple_proc__processor_assign_stmt_375_c_macro_ __declare_static_bit_vector(EQ_u8_u1_374,1);\
bit_vector_equal(0, &(opcode), &(L_AND), &(EQ_u8_u1_374));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_407_407_delayed_7_0), &(EQ_u8_u1_374));\
;

#define simple_proc__processor_assign_stmt_380_c_macro_ __declare_static_bit_vector(EQ_u8_u1_379,1);\
bit_vector_equal(0, &(opcode), &(ADD), &(EQ_u8_u1_379));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_387_387_delayed_7_0), &(EQ_u8_u1_379));\
;

#define simple_proc__processor_assign_stmt_385_c_macro_ __declare_static_bit_vector(EQ_u8_u1_384,1);\
bit_vector_equal(0, &(opcode), &(SBIR), &(EQ_u8_u1_384));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_395_395_delayed_7_0), &(EQ_u8_u1_384));\
;

#define simple_proc__processor_assign_stmt_390_c_macro_ __declare_static_bit_vector(EQ_u8_u1_389,1);\
bit_vector_equal(0, &(opcode), &(L_SRL), &(EQ_u8_u1_389));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_470_470_delayed_7_0), &(EQ_u8_u1_389));\
;

#define simple_proc__processor_assign_stmt_395_c_macro_ __declare_static_bit_vector(EQ_u8_u1_394,1);\
bit_vector_equal(0, &(opcode), &(L_OR), &(EQ_u8_u1_394));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_416_416_delayed_7_0), &(EQ_u8_u1_394));\
;

#define simple_proc__processor_assign_stmt_400_c_macro_ __declare_static_bit_vector(EQ_u8_u1_399,1);\
bit_vector_equal(0, &(opcode), &(L_XNOR), &(EQ_u8_u1_399));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_424_424_delayed_7_0), &(EQ_u8_u1_399));\
;

#define simple_proc__processor_assign_stmt_405_c_macro_ __declare_static_bit_vector(EQ_u8_u1_404,1);\
bit_vector_equal(0, &(opcode), &(L_XOR), &(EQ_u8_u1_404));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_433_433_delayed_7_0), &(EQ_u8_u1_404));\
;

#define simple_proc__processor_assign_stmt_410_c_macro_ __declare_static_bit_vector(EQ_u8_u1_409,1);\
bit_vector_equal(0, &(opcode), &(ADD), &(EQ_u8_u1_409));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_443_443_delayed_7_0), &(EQ_u8_u1_409));\
;

#define simple_proc__processor_assign_stmt_415_c_macro_ __declare_static_bit_vector(EQ_u8_u1_414,1);\
bit_vector_equal(0, &(opcode), &(SUB), &(EQ_u8_u1_414));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_451_451_delayed_7_0), &(EQ_u8_u1_414));\
;

#define simple_proc__processor_assign_stmt_420_c_macro_ __declare_static_bit_vector(EQ_u8_u1_419,1);\
bit_vector_equal(0, &(opcode), &(L_SLL), &(EQ_u8_u1_419));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_460_460_delayed_7_0), &(EQ_u8_u1_419));\
;

#define simple_proc__processor_assign_stmt_425_c_macro_ __declare_static_bit_vector(EQ_u8_u1_424,1);\
bit_vector_equal(0, &(opcode), &(L_SRA), &(EQ_u8_u1_424));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_479_479_delayed_7_0), &(EQ_u8_u1_424));\
;

#define simple_proc__processor_assign_stmt_430_c_macro_ __declare_static_bit_vector(EQ_u8_u1_429,1);\
bit_vector_equal(0, &(opcode), &(CMP), &(EQ_u8_u1_429));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_489_489_delayed_7_0), &(EQ_u8_u1_429));\
;

#define simple_proc__processor_assign_stmt_537_c_macro_ __declare_static_bit_vector(ADD_u32_u32_435,32);\
__declare_static_bit_vector(konst_436,32);\
bit_vector_clear(&konst_436);\
__declare_static_bit_vector(MUX_437,32);\
__declare_static_bit_vector(AND_u32_u32_441,32);\
__declare_static_bit_vector(OR_u32_u32_443,32);\
__declare_static_bit_vector(konst_444,32);\
bit_vector_clear(&konst_444);\
__declare_static_bit_vector(MUX_445,32);\
__declare_static_bit_vector(OR_u32_u32_446,32);\
__declare_static_bit_vector(AND_u32_u32_450,32);\
__declare_static_bit_vector(konst_451,32);\
bit_vector_clear(&konst_451);\
__declare_static_bit_vector(MUX_452,32);\
__declare_static_bit_vector(OR_u32_u32_453,32);\
__declare_static_bit_vector(OR_u32_u32_457,32);\
__declare_static_bit_vector(konst_458,32);\
bit_vector_clear(&konst_458);\
__declare_static_bit_vector(MUX_459,32);\
__declare_static_bit_vector(XOR_u32_u32_463,32);\
__declare_static_bit_vector(konst_464,32);\
bit_vector_clear(&konst_464);\
__declare_static_bit_vector(MUX_465,32);\
__declare_static_bit_vector(OR_u32_u32_466,32);\
__declare_static_bit_vector(XOR_u32_u32_470,32);\
__declare_static_bit_vector(konst_471,32);\
bit_vector_clear(&konst_471);\
__declare_static_bit_vector(MUX_472,32);\
__declare_static_bit_vector(OR_u32_u32_473,32);\
__declare_static_bit_vector(OR_u32_u32_474,32);\
__declare_static_bit_vector(ADD_u32_u32_478,32);\
__declare_static_bit_vector(konst_479,32);\
bit_vector_clear(&konst_479);\
__declare_static_bit_vector(MUX_480,32);\
__declare_static_bit_vector(SUB_u32_u32_484,32);\
__declare_static_bit_vector(konst_485,32);\
bit_vector_clear(&konst_485);\
__declare_static_bit_vector(MUX_486,32);\
__declare_static_bit_vector(OR_u32_u32_487,32);\
__declare_static_bit_vector(SHL_u32_u32_491,32);\
__declare_static_bit_vector(type_cast_492,32);\
__declare_static_bit_vector(konst_493,32);\
bit_vector_clear(&konst_493);\
__declare_static_bit_vector(MUX_494,32);\
__declare_static_bit_vector(OR_u32_u32_495,32);\
__declare_static_bit_vector(LSHR_u32_u32_499,32);\
__declare_static_bit_vector(type_cast_500,32);\
__declare_static_bit_vector(konst_501,32);\
bit_vector_clear(&konst_501);\
__declare_static_bit_vector(MUX_502,32);\
__declare_static_bit_vector(LSHR_u32_u32_506,32);\
__declare_static_bit_vector(type_cast_507,32);\
__declare_static_bit_vector(konst_508,32);\
bit_vector_clear(&konst_508);\
__declare_static_bit_vector(MUX_509,32);\
__declare_static_bit_vector(OR_u32_u32_510,32);\
__declare_static_bit_vector(EQ_u32_u1_514,1);\
__declare_static_bit_vector(konst_516,32);\
bit_vector_clear(&konst_516);\
__declare_static_bit_vector(MUX_517,32);\
__declare_static_bit_vector(ULT_u32_u1_520,1);\
__declare_static_bit_vector(konst_522,32);\
bit_vector_clear(&konst_522);\
__declare_static_bit_vector(MUX_523,32);\
__declare_static_bit_vector(OR_u32_u32_524,32);\
__declare_static_bit_vector(UGT_u32_u1_527,1);\
__declare_static_bit_vector(konst_529,32);\
bit_vector_clear(&konst_529);\
__declare_static_bit_vector(MUX_530,32);\
__declare_static_bit_vector(OR_u32_u32_531,32);\
__declare_static_bit_vector(konst_532,32);\
bit_vector_clear(&konst_532);\
__declare_static_bit_vector(MUX_533,32);\
__declare_static_bit_vector(OR_u32_u32_534,32);\
__declare_static_bit_vector(OR_u32_u32_535,32);\
__declare_static_bit_vector(OR_u32_u32_536,32);\
if (has_undefined_bit(&EQ_u8_u1_387_387_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_387_387_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_387_387_delayed_7_0));assert(0);} \
bit_vector_plus( &(rd1), &(rd2), &(ADD_u32_u32_435));\
bit_vector_clear(&konst_436);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_387_387_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_437), &(ADD_u32_u32_435));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_437), &(konst_436));\
}\
if (has_undefined_bit(&EQ_u8_u1_395_395_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_395_395_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_395_395_delayed_7_0));assert(0);} \
bit_vector_and(&(rd2), &(byte_mask_3_bytes), &(AND_u32_u32_441));\
bit_vector_or(&(AND_u32_u32_441), &(type_cast_400_400_delayed_7_0), &(OR_u32_u32_443));\
bit_vector_clear(&konst_444);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_395_395_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_445), &(OR_u32_u32_443));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_445), &(konst_444));\
}\
bit_vector_or(&(MUX_437), &(MUX_445), &(OR_u32_u32_446));\
if (has_undefined_bit(&EQ_u8_u1_407_407_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_407_407_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_407_407_delayed_7_0));assert(0);} \
bit_vector_and(&(rd1), &(rd2), &(AND_u32_u32_450));\
bit_vector_clear(&konst_451);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_407_407_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_452), &(AND_u32_u32_450));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_452), &(konst_451));\
}\
bit_vector_or(&(OR_u32_u32_446), &(MUX_452), &(OR_u32_u32_453));\
if (has_undefined_bit(&EQ_u8_u1_416_416_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_416_416_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_416_416_delayed_7_0));assert(0);} \
bit_vector_or(&(rd1), &(rd2), &(OR_u32_u32_457));\
bit_vector_clear(&konst_458);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_416_416_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_459), &(OR_u32_u32_457));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_459), &(konst_458));\
}\
if (has_undefined_bit(&EQ_u8_u1_424_424_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_424_424_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_424_424_delayed_7_0));assert(0);} \
bit_vector_xnor(&(rd1), &(rd2), &(XOR_u32_u32_463));\
bit_vector_clear(&konst_464);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_424_424_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_465), &(XOR_u32_u32_463));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_465), &(konst_464));\
}\
bit_vector_or(&(MUX_459), &(MUX_465), &(OR_u32_u32_466));\
if (has_undefined_bit(&EQ_u8_u1_433_433_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_433_433_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_433_433_delayed_7_0));assert(0);} \
bit_vector_xor(&(rd1), &(rd2), &(XOR_u32_u32_470));\
bit_vector_clear(&konst_471);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_433_433_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_472), &(XOR_u32_u32_470));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_472), &(konst_471));\
}\
bit_vector_or(&(OR_u32_u32_466), &(MUX_472), &(OR_u32_u32_473));\
bit_vector_or(&(OR_u32_u32_453), &(OR_u32_u32_473), &(OR_u32_u32_474));\
if (has_undefined_bit(&EQ_u8_u1_443_443_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_443_443_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_443_443_delayed_7_0));assert(0);} \
bit_vector_plus( &(rd1), &(rd2), &(ADD_u32_u32_478));\
bit_vector_clear(&konst_479);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_443_443_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_480), &(ADD_u32_u32_478));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_480), &(konst_479));\
}\
if (has_undefined_bit(&EQ_u8_u1_451_451_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_451_451_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_451_451_delayed_7_0));assert(0);} \
bit_vector_minus( &(rd1), &(rd2), &(SUB_u32_u32_484));\
bit_vector_clear(&konst_485);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_451_451_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_486), &(SUB_u32_u32_484));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_486), &(konst_485));\
}\
bit_vector_or(&(MUX_480), &(MUX_486), &(OR_u32_u32_487));\
if (has_undefined_bit(&EQ_u8_u1_460_460_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_460_460_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_460_460_delayed_7_0));assert(0);} \
bit_vector_shift_left(&(rd1), &(rd2), &(SHL_u32_u32_491));\
bit_vector_bitcast_to_bit_vector( &(type_cast_492), &(SHL_u32_u32_491));\
bit_vector_clear(&konst_493);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_460_460_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_494), &(type_cast_492));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_494), &(konst_493));\
}\
bit_vector_or(&(OR_u32_u32_487), &(MUX_494), &(OR_u32_u32_495));\
if (has_undefined_bit(&EQ_u8_u1_470_470_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_470_470_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_470_470_delayed_7_0));assert(0);} \
bit_vector_shift_right(0, &(rd1), &(rd2), &(LSHR_u32_u32_499));\
bit_vector_bitcast_to_bit_vector( &(type_cast_500), &(LSHR_u32_u32_499));\
bit_vector_clear(&konst_501);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_470_470_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_502), &(type_cast_500));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_502), &(konst_501));\
}\
if (has_undefined_bit(&EQ_u8_u1_479_479_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_479_479_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_479_479_delayed_7_0));assert(0);} \
bit_vector_shift_right(0, &(rd1), &(rd2), &(LSHR_u32_u32_506));\
bit_vector_bitcast_to_bit_vector( &(type_cast_507), &(LSHR_u32_u32_506));\
bit_vector_clear(&konst_508);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_479_479_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_509), &(type_cast_507));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_509), &(konst_508));\
}\
bit_vector_or(&(MUX_502), &(MUX_509), &(OR_u32_u32_510));\
if (has_undefined_bit(&EQ_u8_u1_489_489_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_489_489_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_489_489_delayed_7_0));assert(0);} \
bit_vector_equal(0, &(rd1), &(rd2), &(EQ_u32_u1_514));\
if (has_undefined_bit(&EQ_u32_u1_514)) {fprintf(stderr, "Error: variable EQ_u32_u1_514 has undefined value (%s) at test point.\n", to_string(&EQ_u32_u1_514));assert(0);} \
bit_vector_clear(&konst_516);\
if(bit_vector_to_uint64(0, &EQ_u32_u1_514)){\
bit_vector_cast_to_bit_vector(0, &(MUX_517), &(zero_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_517), &(konst_516));\
}\
bit_vector_less(0, &(rd1), &(rd2), &(ULT_u32_u1_520));\
if (has_undefined_bit(&ULT_u32_u1_520)) {fprintf(stderr, "Error: variable ULT_u32_u1_520 has undefined value (%s) at test point.\n", to_string(&ULT_u32_u1_520));assert(0);} \
bit_vector_clear(&konst_522);\
if(bit_vector_to_uint64(0, &ULT_u32_u1_520)){\
bit_vector_cast_to_bit_vector(0, &(MUX_523), &(minus_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_523), &(konst_522));\
}\
bit_vector_or(&(MUX_517), &(MUX_523), &(OR_u32_u32_524));\
bit_vector_greater(0, &(rd1), &(rd2), &(UGT_u32_u1_527));\
if (has_undefined_bit(&UGT_u32_u1_527)) {fprintf(stderr, "Error: variable UGT_u32_u1_527 has undefined value (%s) at test point.\n", to_string(&UGT_u32_u1_527));assert(0);} \
bit_vector_clear(&konst_529);\
if(bit_vector_to_uint64(0, &UGT_u32_u1_527)){\
bit_vector_cast_to_bit_vector(0, &(MUX_530), &(one_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_530), &(konst_529));\
}\
bit_vector_or(&(OR_u32_u32_524), &(MUX_530), &(OR_u32_u32_531));\
bit_vector_clear(&konst_532);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_489_489_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_533), &(OR_u32_u32_531));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_533), &(konst_532));\
}\
bit_vector_or(&(OR_u32_u32_510), &(MUX_533), &(OR_u32_u32_534));\
bit_vector_or(&(OR_u32_u32_495), &(OR_u32_u32_534), &(OR_u32_u32_535));\
bit_vector_or(&(OR_u32_u32_474), &(OR_u32_u32_535), &(OR_u32_u32_536));\
bit_vector_cast_to_bit_vector(0, &(exec_result), &(OR_u32_u32_536));\
;

#define simple_proc__processor_assign_stmt_545_c_macro_ __declare_static_bit_vector(EQ_u8_u1_541,1);\
__declare_static_bit_vector(MUX_544,1);\
bit_vector_equal(0, &(opcode), &(STORE), &(EQ_u8_u1_541));\
if (has_undefined_bit(&EQ_u8_u1_541)) {fprintf(stderr, "Error: variable EQ_u8_u1_541 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_541));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_541)){\
bit_vector_cast_to_bit_vector(0, &(MUX_544), &(zero_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_544), &(one_1));\
}\
bit_vector_cast_to_bit_vector(0, &(memWrite), &(MUX_544));\
;

#define simple_proc__processor_assign_stmt_594_c_macro_ __declare_static_bit_vector(EQ_u8_u1_549,1);\
__declare_static_bit_vector(EQ_u8_u1_552,1);\
__declare_static_bit_vector(OR_u1_u1_553,1);\
__declare_static_bit_vector(EQ_u8_u1_556,1);\
__declare_static_bit_vector(OR_u1_u1_557,1);\
__declare_static_bit_vector(EQ_u8_u1_560,1);\
__declare_static_bit_vector(EQ_u8_u1_563,1);\
__declare_static_bit_vector(OR_u1_u1_564,1);\
__declare_static_bit_vector(EQ_u8_u1_567,1);\
__declare_static_bit_vector(OR_u1_u1_568,1);\
__declare_static_bit_vector(OR_u1_u1_569,1);\
__declare_static_bit_vector(EQ_u8_u1_572,1);\
__declare_static_bit_vector(EQ_u8_u1_575,1);\
__declare_static_bit_vector(OR_u1_u1_576,1);\
__declare_static_bit_vector(EQ_u8_u1_579,1);\
__declare_static_bit_vector(OR_u1_u1_580,1);\
__declare_static_bit_vector(EQ_u8_u1_583,1);\
__declare_static_bit_vector(EQ_u8_u1_586,1);\
__declare_static_bit_vector(OR_u1_u1_587,1);\
__declare_static_bit_vector(EQ_u8_u1_590,1);\
__declare_static_bit_vector(OR_u1_u1_591,1);\
__declare_static_bit_vector(OR_u1_u1_592,1);\
__declare_static_bit_vector(OR_u1_u1_593,1);\
bit_vector_equal(0, &(opcode), &(SBIR), &(EQ_u8_u1_549));\
bit_vector_equal(0, &(opcode), &(LOAD), &(EQ_u8_u1_552));\
bit_vector_or(&(EQ_u8_u1_549), &(EQ_u8_u1_552), &(OR_u1_u1_553));\
bit_vector_equal(0, &(opcode), &(L_AND), &(EQ_u8_u1_556));\
bit_vector_or(&(OR_u1_u1_553), &(EQ_u8_u1_556), &(OR_u1_u1_557));\
bit_vector_equal(0, &(opcode), &(L_OR), &(EQ_u8_u1_560));\
bit_vector_equal(0, &(opcode), &(L_XNOR), &(EQ_u8_u1_563));\
bit_vector_or(&(EQ_u8_u1_560), &(EQ_u8_u1_563), &(OR_u1_u1_564));\
bit_vector_equal(0, &(opcode), &(ADD), &(EQ_u8_u1_567));\
bit_vector_or(&(OR_u1_u1_564), &(EQ_u8_u1_567), &(OR_u1_u1_568));\
bit_vector_or(&(OR_u1_u1_557), &(OR_u1_u1_568), &(OR_u1_u1_569));\
bit_vector_equal(0, &(opcode), &(SUB), &(EQ_u8_u1_572));\
bit_vector_equal(0, &(opcode), &(L_SLL), &(EQ_u8_u1_575));\
bit_vector_or(&(EQ_u8_u1_572), &(EQ_u8_u1_575), &(OR_u1_u1_576));\
bit_vector_equal(0, &(opcode), &(L_SRL), &(EQ_u8_u1_579));\
bit_vector_or(&(OR_u1_u1_576), &(EQ_u8_u1_579), &(OR_u1_u1_580));\
bit_vector_equal(0, &(opcode), &(L_SRA), &(EQ_u8_u1_583));\
bit_vector_equal(0, &(opcode), &(CALL), &(EQ_u8_u1_586));\
bit_vector_or(&(EQ_u8_u1_583), &(EQ_u8_u1_586), &(OR_u1_u1_587));\
bit_vector_equal(0, &(opcode), &(CMP), &(EQ_u8_u1_590));\
bit_vector_or(&(OR_u1_u1_587), &(EQ_u8_u1_590), &(OR_u1_u1_591));\
bit_vector_or(&(OR_u1_u1_580), &(OR_u1_u1_591), &(OR_u1_u1_592));\
bit_vector_or(&(OR_u1_u1_569), &(OR_u1_u1_592), &(OR_u1_u1_593));\
bit_vector_cast_to_bit_vector(0, &(regWrite), &(OR_u1_u1_593));\
;

#define simple_proc__processor_assign_stmt_597_c_macro_ bit_vector_cast_to_bit_vector(0, &(memAddr), &(rs1_imm));\
;

#define simple_proc__processor_assign_stmt_605_c_macro_ __declare_static_bit_vector(EQ_u8_u1_601,1);\
__declare_static_bit_vector(MUX_604,1);\
bit_vector_equal(0, &(memAddr), &(uart_addr), &(EQ_u8_u1_601));\
if (has_undefined_bit(&EQ_u8_u1_601)) {fprintf(stderr, "Error: variable EQ_u8_u1_601 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_601));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_601)){\
bit_vector_cast_to_bit_vector(0, &(MUX_604), &(one_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_604), &(zero_1));\
}\
bit_vector_cast_to_bit_vector(0, &(is_uart_addr), &(MUX_604));\
;

#define simple_proc__processor_assign_stmt_608_c_macro_ bit_vector_cast_to_bit_vector(0, &(is_uart_addr_584_delayed_6_0), &(is_uart_addr));\
;

#define simple_proc__processor_assign_stmt_611_c_macro_ bit_vector_cast_to_bit_vector(0, &(memWrite_586_delayed_1_0), &(memWrite));\
;

#define simple_proc__processor_assign_stmt_616_c_macro_ __declare_static_bit_vector(CONCAT_u1_u9_615,9);\
bit_vector_concatenate( &(memWrite_586_delayed_1_0), &(memAddr), &(CONCAT_u1_u9_615));\
bit_vector_cast_to_bit_vector(0, &(CONCAT_u1_u9_588_588_delayed_6_0), &(CONCAT_u1_u9_615));\
;

#define simple_proc__processor_assign_stmt_624_c_macro_ if (has_undefined_bit(&is_uart_addr_584_delayed_6_0)) {fprintf(stderr, "Error: variable is_uart_addr_584_delayed_6_0 has undefined value (%s) at test point.\n", to_string(&is_uart_addr_584_delayed_6_0));assert(0);} \
__declare_static_bit_vector(CONCAT_u23_u55_622,55);\
__declare_static_bit_vector(CONCAT_u9_u64_623,64);\
if (!bit_vector_to_uint64(0, &is_uart_addr_584_delayed_6_0)) {\
bit_vector_concatenate( &(zero_23), &(rd2), &(CONCAT_u23_u55_622));\
bit_vector_concatenate( &(CONCAT_u1_u9_588_588_delayed_6_0), &(CONCAT_u23_u55_622), &(CONCAT_u9_u64_623));\
write_bit_vector_to_pipe("mem_in",&(CONCAT_u9_u64_623));\
}
;

#define simple_proc__processor_assign_stmt_628_c_macro_ if (has_undefined_bit(&is_uart_addr)) {fprintf(stderr, "Error: variable is_uart_addr has undefined value (%s) at test point.\n", to_string(&is_uart_addr));assert(0);} \
__declare_static_bit_vector(RPIPE_mem_out_627,32);\
if (!bit_vector_to_uint64(0, &is_uart_addr)) {\
read_bit_vector_from_pipe("mem_out",&(RPIPE_mem_out_627));\
bit_vector_cast_to_bit_vector(0, &(memReadData), &(RPIPE_mem_out_627));\
}
;

#define simple_proc__processor_call_stmt_631_c_macro_ if (has_undefined_bit(&is_uart_addr)) {fprintf(stderr, "Error: variable is_uart_addr has undefined value (%s) at test point.\n", to_string(&is_uart_addr));assert(0);} \
if (bit_vector_to_uint64(0, &is_uart_addr)) {\
_simple_proc_receive_from_uart_(&(data_from_uart));\
}\
;

#define simple_proc__processor_stmt_633_c_macro_ uint32_t simple_proc__processor_stmt_633_c_macro___print_counter= get_file_print_lock(simple_proc___report_log_file__);if(simple_proc___report_log_file__ != NULL) fprintf(simple_proc___report_log_file__,"[%u]processor>\t%s\n",simple_proc__processor_stmt_633_c_macro___print_counter,"uart");if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor>\t\t%s\t\t",simple_proc__processor_stmt_633_c_macro___print_counter,"data_from_uart");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(data_from_uart)));}release_file_print_lock(simple_proc___report_log_file__);;

#define simple_proc__processor_assign_stmt_636_c_macro_ bit_vector_cast_to_bit_vector(0, &(write_to_uart), &(is_uart_addr));\
;

#define simple_proc__processor_assign_stmt_641_c_macro_ __declare_static_bit_vector(konst_639,8);\
bit_vector_clear(&konst_639);\
konst_639.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u8_u8_640,8);\
bit_vector_clear(&konst_639);\
konst_639.val.byte_array[0] = 1;\
bit_vector_plus( &(program_cnt), &(konst_639), &(ADD_u8_u8_640));\
bit_vector_cast_to_bit_vector(0, &(program_cnt_1), &(ADD_u8_u8_640));\
;

#define simple_proc__processor_assign_stmt_646_c_macro_ __declare_static_bit_vector(EQ_u8_u1_645,1);\
bit_vector_equal(0, &(opcode), &(LOAD), &(EQ_u8_u1_645));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_617_617_delayed_8_0), &(EQ_u8_u1_645));\
;

#define simple_proc__processor_assign_stmt_649_c_macro_ bit_vector_cast_to_bit_vector(0, &(memReadData_618_delayed_6_0), &(memReadData));\
;

#define simple_proc__processor_assign_stmt_654_c_macro_ __declare_static_bit_vector(EQ_u8_u1_653,1);\
bit_vector_equal(0, &(opcode), &(CALL), &(EQ_u8_u1_653));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_621_621_delayed_8_0), &(EQ_u8_u1_653));\
;

#define simple_proc__processor_assign_stmt_658_c_macro_ __declare_static_bit_vector(type_cast_657,32);\
bit_vector_bitcast_to_bit_vector( &(type_cast_657), &(program_cnt_1));\
bit_vector_cast_to_bit_vector(0, &(type_cast_623_623_delayed_8_0), &(type_cast_657));\
;

#define simple_proc__processor_assign_stmt_663_c_macro_ __declare_static_bit_vector(EQ_u1_u1_662,1);\
bit_vector_equal(0, &(regWrite), &(one_1), &(EQ_u1_u1_662));\
bit_vector_cast_to_bit_vector(0, &(EQ_u1_u1_626_626_delayed_8_0), &(EQ_u1_u1_662));\
;

#define simple_proc__processor_assign_stmt_676_c_macro_ __declare_static_bit_vector(konst_671,32);\
bit_vector_clear(&konst_671);\
__declare_static_bit_vector(type_cast_672,32);\
bit_vector_clear(&type_cast_672);\
__declare_static_bit_vector(MUX_673,32);\
__declare_static_bit_vector(MUX_674,32);\
__declare_static_bit_vector(MUX_675,32);\
if (has_undefined_bit(&EQ_u8_u1_617_617_delayed_8_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_617_617_delayed_8_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_617_617_delayed_8_0));assert(0);} \
if (has_undefined_bit(&EQ_u8_u1_621_621_delayed_8_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_621_621_delayed_8_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_621_621_delayed_8_0));assert(0);} \
if (has_undefined_bit(&EQ_u1_u1_626_626_delayed_8_0)) {fprintf(stderr, "Error: variable EQ_u1_u1_626_626_delayed_8_0 has undefined value (%s) at test point.\n", to_string(&EQ_u1_u1_626_626_delayed_8_0));assert(0);} \
bit_vector_clear(&konst_671);\
bit_vector_bitcast_to_bit_vector( &(type_cast_672), &(konst_671));\
if(bit_vector_to_uint64(0, &EQ_u1_u1_626_626_delayed_8_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_673), &(exec_result));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_673), &(type_cast_672));\
}\
if(bit_vector_to_uint64(0, &EQ_u8_u1_621_621_delayed_8_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_674), &(type_cast_623_623_delayed_8_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_674), &(MUX_673));\
}\
if(bit_vector_to_uint64(0, &EQ_u8_u1_617_617_delayed_8_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_675), &(memReadData_618_delayed_6_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_675), &(MUX_674));\
}\
bit_vector_cast_to_bit_vector(0, &(regWriteData), &(MUX_675));\
;

#define simple_proc__processor_assign_stmt_679_c_macro_ bit_vector_cast_to_bit_vector(0, &(rs1_imm_635_delayed_9_0), &(rs1_imm));\
;

#define simple_proc__processor_assign_stmt_682_c_macro_ bit_vector_cast_to_bit_vector(0, &(rs2_637_delayed_9_0), &(rs2));\
;

#define simple_proc__processor_assign_stmt_685_c_macro_ bit_vector_cast_to_bit_vector(0, &(regWrite_638_delayed_9_0), &(regWrite));\
;

#define simple_proc__processor_assign_stmt_688_c_macro_ bit_vector_cast_to_bit_vector(0, &(rd_639_delayed_9_0), &(rd));\
;

#define simple_proc__processor_call_stmt_698_c_macro_ _simple_proc_registerFileModule_( &(zero_1),  &(rs1_imm_635_delayed_9_0),  &(zero_1),  &(rs2_637_delayed_9_0),  &(regWrite_638_delayed_9_0),  &(rd_639_delayed_9_0),  &(regWriteData), &(read_while_write1), &(read_while_write2));\
;

#define simple_proc__processor_assign_stmt_701_c_macro_ bit_vector_cast_to_bit_vector(0, &(write_to_uart_644_delayed_8_0), &(write_to_uart));\
;

#define simple_proc__processor_call_stmt_704_c_macro_ if (has_undefined_bit(&write_to_uart_644_delayed_8_0)) {fprintf(stderr, "Error: variable write_to_uart_644_delayed_8_0 has undefined value (%s) at test point.\n", to_string(&write_to_uart_644_delayed_8_0));assert(0);} \
if (bit_vector_to_uint64(0, &write_to_uart_644_delayed_8_0)) {\
_simple_proc_send_to_uart_( &(regWriteData));\
}\
;
;

#define simple_proc__processor_branch_block_stmt_299_c_export_apply_macro_ ;

#define simple_proc__processor_inner_outarg_prep_macro__ ;

#define simple_proc__processor_outer_arg_decl_macro__ ;

#define simple_proc__processor_outer_op_xfer_macro__ ;

#define simple_proc__receive_from_uart_inner_inarg_prep_macro__ __declare_static_bit_vector(receive_data_from_uart,32);\
__declare_static_bit_vector(in_data0,8);\
__declare_static_bit_vector(in_data1,8);\
__declare_static_bit_vector(in_data2,8);\
__declare_static_bit_vector(in_data3,8);\

#define simple_proc__receive_from_uart_assign_stmt_247_c_macro_ __declare_static_bit_vector(RPIPE_in_pipe_246,8);\
read_bit_vector_from_pipe("in_pipe",&(RPIPE_in_pipe_246));\
bit_vector_cast_to_bit_vector(0, &(in_data0), &(RPIPE_in_pipe_246));\
;

#define simple_proc__receive_from_uart_assign_stmt_250_c_macro_ __declare_static_bit_vector(RPIPE_in_pipe_249,8);\
read_bit_vector_from_pipe("in_pipe",&(RPIPE_in_pipe_249));\
bit_vector_cast_to_bit_vector(0, &(in_data1), &(RPIPE_in_pipe_249));\
;

#define simple_proc__receive_from_uart_assign_stmt_253_c_macro_ __declare_static_bit_vector(RPIPE_in_pipe_252,8);\
read_bit_vector_from_pipe("in_pipe",&(RPIPE_in_pipe_252));\
bit_vector_cast_to_bit_vector(0, &(in_data2), &(RPIPE_in_pipe_252));\
;

#define simple_proc__receive_from_uart_assign_stmt_256_c_macro_ __declare_static_bit_vector(RPIPE_in_pipe_255,8);\
read_bit_vector_from_pipe("in_pipe",&(RPIPE_in_pipe_255));\
bit_vector_cast_to_bit_vector(0, &(in_data3), &(RPIPE_in_pipe_255));\
;

#define simple_proc__receive_from_uart_assign_stmt_265_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_260,16);\
__declare_static_bit_vector(CONCAT_u8_u16_263,16);\
__declare_static_bit_vector(CONCAT_u16_u32_264,32);\
bit_vector_concatenate( &(in_data3), &(in_data2), &(CONCAT_u8_u16_260));\
bit_vector_concatenate( &(in_data1), &(in_data0), &(CONCAT_u8_u16_263));\
bit_vector_concatenate( &(CONCAT_u8_u16_260), &(CONCAT_u8_u16_263), &(CONCAT_u16_u32_264));\
bit_vector_cast_to_bit_vector(0, &(receive_data_from_uart), &(CONCAT_u16_u32_264));\
;

#define simple_proc__receive_from_uart_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__preceive_data_from_uart)), &(receive_data_from_uart));\
;

#define simple_proc__receive_from_uart_outer_arg_decl_macro__ __declare_static_bit_vector(__receive_data_from_uart, 32);\
;

#define simple_proc__receive_from_uart_outer_op_xfer_macro__  *receive_data_from_uart =  bit_vector_to_uint64(0, &__receive_data_from_uart);\
;

#define simple_proc__registerFileModule_inner_inarg_prep_macro__ __declare_static_bit_vector(valid_1,1);\
bit_vector_cast_to_bit_vector(0, &(valid_1), &((*__pvalid_1)));\
__declare_static_bit_vector(addr_1,8);\
bit_vector_cast_to_bit_vector(0, &(addr_1), &((*__paddr_1)));\
__declare_static_bit_vector(valid_2,1);\
bit_vector_cast_to_bit_vector(0, &(valid_2), &((*__pvalid_2)));\
__declare_static_bit_vector(addr_2,8);\
bit_vector_cast_to_bit_vector(0, &(addr_2), &((*__paddr_2)));\
__declare_static_bit_vector(valid_w,1);\
bit_vector_cast_to_bit_vector(0, &(valid_w), &((*__pvalid_w)));\
__declare_static_bit_vector(addr_w,8);\
bit_vector_cast_to_bit_vector(0, &(addr_w), &((*__paddr_w)));\
__declare_static_bit_vector(data_to_be_written,32);\
bit_vector_cast_to_bit_vector(0, &(data_to_be_written), &((*__pdata_to_be_written)));\
__declare_static_bit_vector(read_data_1,32);\
__declare_static_bit_vector(read_data_2,32);\
__declare_static_bit_vector(t_read_data_1,32);\
__declare_static_bit_vector(t_read_data_2,32);\
__declare_static_bit_vector(valid_1_241_delayed_4_0,1);\
__declare_static_bit_vector(valid_2_247_delayed_4_0,1);\

#define simple_proc__registerFileModule_assign_stmt_213_c_macro_ if (has_undefined_bit(&valid_1)) {fprintf(stderr, "Error: variable valid_1 has undefined value (%s) at test point.\n", to_string(&valid_1));assert(0);} \
if (bit_vector_to_uint64(0, &valid_1)) {\
bit_vector_cast_to_bit_vector(0, &(t_read_data_1), &((reg_array[bit_vector_to_uint64(0, &addr_1)])));\
}
;

#define simple_proc__registerFileModule_assign_stmt_218_c_macro_ if (has_undefined_bit(&valid_2)) {fprintf(stderr, "Error: variable valid_2 has undefined value (%s) at test point.\n", to_string(&valid_2));assert(0);} \
if (bit_vector_to_uint64(0, &valid_2)) {\
bit_vector_cast_to_bit_vector(0, &(t_read_data_2), &((reg_array[bit_vector_to_uint64(0, &addr_2)])));\
}
;

#define simple_proc__registerFileModule_assign_stmt_221_c_macro_ bit_vector_cast_to_bit_vector(0, &(valid_1_241_delayed_4_0), &(valid_1));\
;

#define simple_proc__registerFileModule_assign_stmt_227_c_macro_ __declare_static_bit_vector(konst_225,32);\
bit_vector_clear(&konst_225);\
__declare_static_bit_vector(MUX_226,32);\
if (has_undefined_bit(&valid_1_241_delayed_4_0)) {fprintf(stderr, "Error: variable valid_1_241_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&valid_1_241_delayed_4_0));assert(0);} \
bit_vector_clear(&konst_225);\
if(bit_vector_to_uint64(0, &valid_1_241_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_226), &(t_read_data_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_226), &(konst_225));\
}\
bit_vector_cast_to_bit_vector(0, &(read_data_1), &(MUX_226));\
;

#define simple_proc__registerFileModule_assign_stmt_230_c_macro_ bit_vector_cast_to_bit_vector(0, &(valid_2_247_delayed_4_0), &(valid_2));\
;

#define simple_proc__registerFileModule_assign_stmt_236_c_macro_ __declare_static_bit_vector(konst_234,32);\
bit_vector_clear(&konst_234);\
__declare_static_bit_vector(MUX_235,32);\
if (has_undefined_bit(&valid_2_247_delayed_4_0)) {fprintf(stderr, "Error: variable valid_2_247_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&valid_2_247_delayed_4_0));assert(0);} \
bit_vector_clear(&konst_234);\
if(bit_vector_to_uint64(0, &valid_2_247_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_235), &(t_read_data_2));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_235), &(konst_234));\
}\
bit_vector_cast_to_bit_vector(0, &(read_data_2), &(MUX_235));\
;

#define simple_proc__registerFileModule_assign_stmt_241_c_macro_ if (has_undefined_bit(&valid_w)) {fprintf(stderr, "Error: variable valid_w has undefined value (%s) at test point.\n", to_string(&valid_w));assert(0);} \
if (bit_vector_to_uint64(0, &valid_w)) {\
bit_vector_cast_to_bit_vector(0, &((reg_array[bit_vector_to_uint64(0, &addr_w)])), &(data_to_be_written));\
}
;

#define simple_proc__registerFileModule_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pread_data_1)), &(read_data_1));\
bit_vector_cast_to_bit_vector(0, &((*__pread_data_2)), &(read_data_2));\
;

#define simple_proc__send_to_uart_inner_inarg_prep_macro__ __declare_static_bit_vector(data_to_send,32);\
bit_vector_cast_to_bit_vector(0, &(data_to_send), &((*__pdata_to_send)));\
__declare_static_bit_vector(out_data_3,8);\
__declare_static_bit_vector(out_data_2,8);\
__declare_static_bit_vector(out_data_1,8);\
__declare_static_bit_vector(out_data_0,8);\

#define simple_proc__send_to_uart_assign_stmt_272_c_macro_ __declare_static_bit_vector(slice_271,8);\
bit_vector_slice(&(data_to_send), &(slice_271), 24);\
bit_vector_cast_to_bit_vector(0, &(out_data_3), &(slice_271));\
;

#define simple_proc__send_to_uart_assign_stmt_276_c_macro_ __declare_static_bit_vector(slice_275,8);\
bit_vector_slice(&(data_to_send), &(slice_275), 16);\
bit_vector_cast_to_bit_vector(0, &(out_data_2), &(slice_275));\
;

#define simple_proc__send_to_uart_assign_stmt_280_c_macro_ __declare_static_bit_vector(slice_279,8);\
bit_vector_slice(&(data_to_send), &(slice_279), 8);\
bit_vector_cast_to_bit_vector(0, &(out_data_1), &(slice_279));\
;

#define simple_proc__send_to_uart_assign_stmt_284_c_macro_ __declare_static_bit_vector(slice_283,8);\
bit_vector_slice(&(data_to_send), &(slice_283), 0);\
bit_vector_cast_to_bit_vector(0, &(out_data_0), &(slice_283));\
;

#define simple_proc__send_to_uart_assign_stmt_287_c_macro_ write_bit_vector_to_pipe("out_pipe",&(out_data_0));\
;

#define simple_proc__send_to_uart_assign_stmt_290_c_macro_ write_bit_vector_to_pipe("out_pipe",&(out_data_1));\
;

#define simple_proc__send_to_uart_assign_stmt_293_c_macro_ write_bit_vector_to_pipe("out_pipe",&(out_data_2));\
;

#define simple_proc__send_to_uart_assign_stmt_296_c_macro_ write_bit_vector_to_pipe("out_pipe",&(out_data_3));\
;

#define simple_proc__send_to_uart_inner_outarg_prep_macro__ ;

#define simple_proc__send_to_uart_outer_arg_decl_macro__ __declare_static_bit_vector(__data_to_send, 32);\
bit_vector_assign_uint64(0, &__data_to_send, data_to_send);\
;

#define simple_proc__send_to_uart_outer_op_xfer_macro__ ;
