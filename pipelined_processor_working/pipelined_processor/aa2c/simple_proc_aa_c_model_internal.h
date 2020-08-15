#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
// object initialization 

#define simple_proc__accessMem_inner_inarg_prep_macro__ __declare_static_bit_vector(read_write_bar,1);\
bit_vector_cast_to_bit_vector(0, &(read_write_bar), &((*__pread_write_bar)));\
__declare_static_bit_vector(addr,10);\
bit_vector_cast_to_bit_vector(0, &(addr), &((*__paddr)));\
__declare_static_bit_vector(write_data,32);\
bit_vector_cast_to_bit_vector(0, &(write_data), &((*__pwrite_data)));\
__declare_static_bit_vector(read_data,32);\
__declare_static_bit_vector(t_read_data,32);\
__declare_static_bit_vector(read_write_bar_144_delayed_4_0,1);\

#define simple_proc__accessMem_assign_stmt_137_c_macro_ if (has_undefined_bit(&read_write_bar)) {fprintf(stderr, "Error: variable read_write_bar has undefined value (%s) at test point.\n", to_string(&read_write_bar));assert(0);} \
if (bit_vector_to_uint64(0, &read_write_bar)) {\
bit_vector_cast_to_bit_vector(0, &(t_read_data), &((mem_array[bit_vector_to_uint64(0, &addr)])));\
}
;

#define simple_proc__accessMem_assign_stmt_142_c_macro_ if (has_undefined_bit(&read_write_bar)) {fprintf(stderr, "Error: variable read_write_bar has undefined value (%s) at test point.\n", to_string(&read_write_bar));assert(0);} \
if (!bit_vector_to_uint64(0, &read_write_bar)) {\
bit_vector_cast_to_bit_vector(0, &((mem_array[bit_vector_to_uint64(0, &addr)])), &(write_data));\
}
;

#define simple_proc__accessMem_assign_stmt_145_c_macro_ bit_vector_cast_to_bit_vector(0, &(read_write_bar_144_delayed_4_0), &(read_write_bar));\
;

#define simple_proc__accessMem_assign_stmt_151_c_macro_ __declare_static_bit_vector(konst_149,32);\
bit_vector_clear(&konst_149);\
__declare_static_bit_vector(MUX_150,32);\
if (has_undefined_bit(&read_write_bar_144_delayed_4_0)) {fprintf(stderr, "Error: variable read_write_bar_144_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&read_write_bar_144_delayed_4_0));assert(0);} \
bit_vector_clear(&konst_149);\
if(bit_vector_to_uint64(0, &read_write_bar_144_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_150), &(t_read_data));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_150), &(konst_149));\
}\
bit_vector_cast_to_bit_vector(0, &(read_data), &(MUX_150));\
;

#define simple_proc__accessMem_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pread_data)), &(read_data));\
;

#define simple_proc__accessReg_inner_inarg_prep_macro__ __declare_static_bit_vector(valid_1,1);\
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
__declare_static_bit_vector(valid_1_171_delayed_4_0,1);\
__declare_static_bit_vector(valid_2_177_delayed_4_0,1);\

#define simple_proc__accessReg_assign_stmt_167_c_macro_ if (has_undefined_bit(&valid_1)) {fprintf(stderr, "Error: variable valid_1 has undefined value (%s) at test point.\n", to_string(&valid_1));assert(0);} \
if (bit_vector_to_uint64(0, &valid_1)) {\
bit_vector_cast_to_bit_vector(0, &(t_read_data_1), &((reg_array[bit_vector_to_uint64(0, &addr_1)])));\
}
;

#define simple_proc__accessReg_assign_stmt_172_c_macro_ if (has_undefined_bit(&valid_2)) {fprintf(stderr, "Error: variable valid_2 has undefined value (%s) at test point.\n", to_string(&valid_2));assert(0);} \
if (bit_vector_to_uint64(0, &valid_2)) {\
bit_vector_cast_to_bit_vector(0, &(t_read_data_2), &((reg_array[bit_vector_to_uint64(0, &addr_2)])));\
}
;

#define simple_proc__accessReg_assign_stmt_175_c_macro_ bit_vector_cast_to_bit_vector(0, &(valid_1_171_delayed_4_0), &(valid_1));\
;

#define simple_proc__accessReg_assign_stmt_181_c_macro_ __declare_static_bit_vector(konst_179,32);\
bit_vector_clear(&konst_179);\
__declare_static_bit_vector(MUX_180,32);\
if (has_undefined_bit(&valid_1_171_delayed_4_0)) {fprintf(stderr, "Error: variable valid_1_171_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&valid_1_171_delayed_4_0));assert(0);} \
bit_vector_clear(&konst_179);\
if(bit_vector_to_uint64(0, &valid_1_171_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_180), &(t_read_data_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_180), &(konst_179));\
}\
bit_vector_cast_to_bit_vector(0, &(read_data_1), &(MUX_180));\
;

#define simple_proc__accessReg_assign_stmt_184_c_macro_ bit_vector_cast_to_bit_vector(0, &(valid_2_177_delayed_4_0), &(valid_2));\
;

#define simple_proc__accessReg_assign_stmt_190_c_macro_ __declare_static_bit_vector(konst_188,32);\
bit_vector_clear(&konst_188);\
__declare_static_bit_vector(MUX_189,32);\
if (has_undefined_bit(&valid_2_177_delayed_4_0)) {fprintf(stderr, "Error: variable valid_2_177_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&valid_2_177_delayed_4_0));assert(0);} \
bit_vector_clear(&konst_188);\
if(bit_vector_to_uint64(0, &valid_2_177_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_189), &(t_read_data_2));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_189), &(konst_188));\
}\
bit_vector_cast_to_bit_vector(0, &(read_data_2), &(MUX_189));\
;

#define simple_proc__accessReg_assign_stmt_195_c_macro_ if (has_undefined_bit(&valid_w)) {fprintf(stderr, "Error: variable valid_w has undefined value (%s) at test point.\n", to_string(&valid_w));assert(0);} \
if (bit_vector_to_uint64(0, &valid_w)) {\
bit_vector_cast_to_bit_vector(0, &((reg_array[bit_vector_to_uint64(0, &addr_w)])), &(data_to_be_written));\
}
;

#define simple_proc__accessReg_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pread_data_1)), &(read_data_1));\
bit_vector_cast_to_bit_vector(0, &((*__pread_data_2)), &(read_data_2));\
;

#define simple_proc__global_storage_initializer__inner_inarg_prep_macro__ 
#define simple_proc__global_storage_initializer__inner_outarg_prep_macro__ ;

#define simple_proc__global_storage_initializer__outer_arg_decl_macro__ ;

#define simple_proc__global_storage_initializer__outer_op_xfer_macro__ ;

#define simple_proc__iExecStage_inner_inarg_prep_macro__ __declare_static_bit_vector(iexec_state,106);\
bit_vector_cast_to_bit_vector(0, &(iexec_state), &((*__piexec_state)));\
__declare_static_bit_vector(iexec_rd1_final,32);\
bit_vector_cast_to_bit_vector(0, &(iexec_rd1_final), &((*__piexec_rd1_final)));\
__declare_static_bit_vector(iexec_rd2_final,32);\
bit_vector_cast_to_bit_vector(0, &(iexec_rd2_final), &((*__piexec_rd2_final)));\
__declare_static_bit_vector(next_dcache_state,139);\
__declare_static_bit_vector(opcode,8);\
__declare_static_bit_vector(rs1_imm,8);\
__declare_static_bit_vector(rs2,8);\
__declare_static_bit_vector(rd,8);\
__declare_static_bit_vector(program_cnt,10);\
__declare_static_bit_vector(AND_u32_u32_241_241_delayed_1_0,32);\
__declare_static_bit_vector(OR_u32_u32_250_250_delayed_1_0,32);\
__declare_static_bit_vector(AND_u32_u32_230_230_delayed_1_0,32);\
__declare_static_bit_vector(XOR_u32_u32_259_259_delayed_1_0,32);\
__declare_static_bit_vector(XOR_u32_u32_267_267_delayed_1_0,32);\
__declare_static_bit_vector(ADD_u32_u32_276_276_delayed_1_0,32);\
__declare_static_bit_vector(SUB_u32_u32_286_286_delayed_1_0,32);\
__declare_static_bit_vector(type_cast_295_295_delayed_1_0,32);\
__declare_static_bit_vector(type_cast_305_305_delayed_1_0,32);\
__declare_static_bit_vector(OR_u32_u32_331_331_delayed_1_0,32);\
__declare_static_bit_vector(exec_result_initial,32);\
__declare_static_bit_vector(is_SRA,1);\
__declare_static_bit_vector(iexec_rd1_final_357_delayed_1_0,32);\
__declare_static_bit_vector(iexec_rd2_final_358_delayed_1_0,32);\
__declare_static_bit_vector(bottom_bits,32);\
__declare_static_bit_vector(iexec_rd1_final_364_delayed_1_0,32);\
__declare_static_bit_vector(iexec_rd2_final_369_delayed_1_0,32);\
__declare_static_bit_vector(top_bits,32);\
__declare_static_bit_vector(result_for_SRA,32);\
__declare_static_bit_vector(exec_result,32);\
__declare_static_bit_vector(is_rs1_neg,1);\
__declare_static_bit_vector(NOT_u1_u1_399_399_delayed_1_0,1);\
__declare_static_bit_vector(is_rs1_neg_404_delayed_1_0,1);\
__declare_static_bit_vector(is_Branch,1);\
__declare_static_bit_vector(iexec_rd1_final_415_delayed_1_0,32);\
__declare_static_bit_vector(iexec_rd2_final_418_delayed_1_0,32);\

#define simple_proc__iExecStage_assign_stmt_208_c_macro_ __declare_static_bit_vector(slice_207,8);\
bit_vector_slice(&(iexec_state), &(slice_207), 98);\
bit_vector_cast_to_bit_vector(0, &(opcode), &(slice_207));\
;

#define simple_proc__iExecStage_assign_stmt_212_c_macro_ __declare_static_bit_vector(slice_211,8);\
bit_vector_slice(&(iexec_state), &(slice_211), 90);\
bit_vector_cast_to_bit_vector(0, &(rs1_imm), &(slice_211));\
;

#define simple_proc__iExecStage_assign_stmt_216_c_macro_ __declare_static_bit_vector(slice_215,8);\
bit_vector_slice(&(iexec_state), &(slice_215), 82);\
bit_vector_cast_to_bit_vector(0, &(rs2), &(slice_215));\
;

#define simple_proc__iExecStage_assign_stmt_220_c_macro_ __declare_static_bit_vector(slice_219,8);\
bit_vector_slice(&(iexec_state), &(slice_219), 74);\
bit_vector_cast_to_bit_vector(0, &(rd), &(slice_219));\
;

#define simple_proc__iExecStage_assign_stmt_224_c_macro_ __declare_static_bit_vector(slice_223,10);\
bit_vector_slice(&(iexec_state), &(slice_223), 0);\
bit_vector_cast_to_bit_vector(0, &(program_cnt), &(slice_223));\
;

#define simple_proc__iExecStage_assign_stmt_229_c_macro_ __declare_static_bit_vector(AND_u32_u32_228,32);\
bit_vector_and(&(iexec_rd1_final), &(iexec_rd2_final), &(AND_u32_u32_228));\
bit_vector_cast_to_bit_vector(0, &(AND_u32_u32_241_241_delayed_1_0), &(AND_u32_u32_228));\
;

#define simple_proc__iExecStage_assign_stmt_234_c_macro_ __declare_static_bit_vector(OR_u32_u32_233,32);\
bit_vector_or(&(iexec_rd1_final), &(iexec_rd2_final), &(OR_u32_u32_233));\
bit_vector_cast_to_bit_vector(0, &(OR_u32_u32_250_250_delayed_1_0), &(OR_u32_u32_233));\
;

#define simple_proc__iExecStage_assign_stmt_239_c_macro_ __declare_static_bit_vector(AND_u32_u32_238,32);\
bit_vector_and(&(iexec_rd2_final), &(byte_mask_3_bytes), &(AND_u32_u32_238));\
bit_vector_cast_to_bit_vector(0, &(AND_u32_u32_230_230_delayed_1_0), &(AND_u32_u32_238));\
;

#define simple_proc__iExecStage_assign_stmt_244_c_macro_ __declare_static_bit_vector(XOR_u32_u32_243,32);\
bit_vector_xnor(&(iexec_rd1_final), &(iexec_rd2_final), &(XOR_u32_u32_243));\
bit_vector_cast_to_bit_vector(0, &(XOR_u32_u32_259_259_delayed_1_0), &(XOR_u32_u32_243));\
;

#define simple_proc__iExecStage_assign_stmt_249_c_macro_ __declare_static_bit_vector(XOR_u32_u32_248,32);\
bit_vector_xor(&(iexec_rd1_final), &(iexec_rd2_final), &(XOR_u32_u32_248));\
bit_vector_cast_to_bit_vector(0, &(XOR_u32_u32_267_267_delayed_1_0), &(XOR_u32_u32_248));\
;

#define simple_proc__iExecStage_assign_stmt_254_c_macro_ __declare_static_bit_vector(ADD_u32_u32_253,32);\
bit_vector_plus( &(iexec_rd1_final), &(iexec_rd2_final), &(ADD_u32_u32_253));\
bit_vector_cast_to_bit_vector(0, &(ADD_u32_u32_276_276_delayed_1_0), &(ADD_u32_u32_253));\
;

#define simple_proc__iExecStage_assign_stmt_259_c_macro_ __declare_static_bit_vector(SUB_u32_u32_258,32);\
bit_vector_minus( &(iexec_rd1_final), &(iexec_rd2_final), &(SUB_u32_u32_258));\
bit_vector_cast_to_bit_vector(0, &(SUB_u32_u32_286_286_delayed_1_0), &(SUB_u32_u32_258));\
;

#define simple_proc__iExecStage_assign_stmt_265_c_macro_ __declare_static_bit_vector(SHL_u32_u32_263,32);\
__declare_static_bit_vector(type_cast_264,32);\
bit_vector_shift_left(&(iexec_rd1_final), &(iexec_rd2_final), &(SHL_u32_u32_263));\
bit_vector_bitcast_to_bit_vector( &(type_cast_264), &(SHL_u32_u32_263));\
bit_vector_cast_to_bit_vector(0, &(type_cast_295_295_delayed_1_0), &(type_cast_264));\
;

#define simple_proc__iExecStage_assign_stmt_271_c_macro_ __declare_static_bit_vector(LSHR_u32_u32_269,32);\
__declare_static_bit_vector(type_cast_270,32);\
bit_vector_shift_right(0, &(iexec_rd1_final), &(iexec_rd2_final), &(LSHR_u32_u32_269));\
bit_vector_bitcast_to_bit_vector( &(type_cast_270), &(LSHR_u32_u32_269));\
bit_vector_cast_to_bit_vector(0, &(type_cast_305_305_delayed_1_0), &(type_cast_270));\
;

#define simple_proc__iExecStage_assign_stmt_293_c_macro_ __declare_static_bit_vector(EQ_u32_u1_275,1);\
__declare_static_bit_vector(konst_277,32);\
bit_vector_clear(&konst_277);\
__declare_static_bit_vector(MUX_278,32);\
__declare_static_bit_vector(ULT_u32_u1_281,1);\
__declare_static_bit_vector(konst_283,32);\
bit_vector_clear(&konst_283);\
__declare_static_bit_vector(MUX_284,32);\
__declare_static_bit_vector(OR_u32_u32_285,32);\
__declare_static_bit_vector(UGT_u32_u1_288,1);\
__declare_static_bit_vector(konst_290,32);\
bit_vector_clear(&konst_290);\
__declare_static_bit_vector(MUX_291,32);\
__declare_static_bit_vector(OR_u32_u32_292,32);\
bit_vector_equal(0, &(iexec_rd1_final), &(iexec_rd2_final), &(EQ_u32_u1_275));\
if (has_undefined_bit(&EQ_u32_u1_275)) {fprintf(stderr, "Error: variable EQ_u32_u1_275 has undefined value (%s) at test point.\n", to_string(&EQ_u32_u1_275));assert(0);} \
bit_vector_clear(&konst_277);\
if(bit_vector_to_uint64(0, &EQ_u32_u1_275)){\
bit_vector_cast_to_bit_vector(0, &(MUX_278), &(zero_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_278), &(konst_277));\
}\
bit_vector_less(0, &(iexec_rd1_final), &(iexec_rd2_final), &(ULT_u32_u1_281));\
if (has_undefined_bit(&ULT_u32_u1_281)) {fprintf(stderr, "Error: variable ULT_u32_u1_281 has undefined value (%s) at test point.\n", to_string(&ULT_u32_u1_281));assert(0);} \
bit_vector_clear(&konst_283);\
if(bit_vector_to_uint64(0, &ULT_u32_u1_281)){\
bit_vector_cast_to_bit_vector(0, &(MUX_284), &(minus_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_284), &(konst_283));\
}\
bit_vector_or(&(MUX_278), &(MUX_284), &(OR_u32_u32_285));\
bit_vector_greater(0, &(iexec_rd1_final), &(iexec_rd2_final), &(UGT_u32_u1_288));\
if (has_undefined_bit(&UGT_u32_u1_288)) {fprintf(stderr, "Error: variable UGT_u32_u1_288 has undefined value (%s) at test point.\n", to_string(&UGT_u32_u1_288));assert(0);} \
bit_vector_clear(&konst_290);\
if(bit_vector_to_uint64(0, &UGT_u32_u1_288)){\
bit_vector_cast_to_bit_vector(0, &(MUX_291), &(one_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_291), &(konst_290));\
}\
bit_vector_or(&(OR_u32_u32_285), &(MUX_291), &(OR_u32_u32_292));\
bit_vector_cast_to_bit_vector(0, &(OR_u32_u32_331_331_delayed_1_0), &(OR_u32_u32_292));\
;

#define simple_proc__iExecStage_assign_stmt_377_c_macro_ __declare_static_bit_vector(EQ_u8_u1_297,1);\
__declare_static_bit_vector(type_cast_300,32);\
__declare_static_bit_vector(OR_u32_u32_301,32);\
__declare_static_bit_vector(konst_302,32);\
bit_vector_clear(&konst_302);\
__declare_static_bit_vector(MUX_303,32);\
__declare_static_bit_vector(EQ_u8_u1_306,1);\
__declare_static_bit_vector(konst_308,32);\
bit_vector_clear(&konst_308);\
__declare_static_bit_vector(MUX_309,32);\
__declare_static_bit_vector(OR_u32_u32_310,32);\
__declare_static_bit_vector(EQ_u8_u1_313,1);\
__declare_static_bit_vector(konst_315,32);\
bit_vector_clear(&konst_315);\
__declare_static_bit_vector(MUX_316,32);\
__declare_static_bit_vector(OR_u32_u32_317,32);\
__declare_static_bit_vector(EQ_u8_u1_320,1);\
__declare_static_bit_vector(konst_322,32);\
bit_vector_clear(&konst_322);\
__declare_static_bit_vector(MUX_323,32);\
__declare_static_bit_vector(EQ_u8_u1_326,1);\
__declare_static_bit_vector(konst_328,32);\
bit_vector_clear(&konst_328);\
__declare_static_bit_vector(MUX_329,32);\
__declare_static_bit_vector(OR_u32_u32_330,32);\
__declare_static_bit_vector(EQ_u8_u1_333,1);\
__declare_static_bit_vector(konst_335,32);\
bit_vector_clear(&konst_335);\
__declare_static_bit_vector(MUX_336,32);\
__declare_static_bit_vector(OR_u32_u32_337,32);\
__declare_static_bit_vector(OR_u32_u32_338,32);\
__declare_static_bit_vector(EQ_u8_u1_341,1);\
__declare_static_bit_vector(konst_343,32);\
bit_vector_clear(&konst_343);\
__declare_static_bit_vector(MUX_344,32);\
__declare_static_bit_vector(EQ_u8_u1_347,1);\
__declare_static_bit_vector(konst_349,32);\
bit_vector_clear(&konst_349);\
__declare_static_bit_vector(MUX_350,32);\
__declare_static_bit_vector(OR_u32_u32_351,32);\
__declare_static_bit_vector(EQ_u8_u1_354,1);\
__declare_static_bit_vector(konst_356,32);\
bit_vector_clear(&konst_356);\
__declare_static_bit_vector(MUX_357,32);\
__declare_static_bit_vector(OR_u32_u32_358,32);\
__declare_static_bit_vector(EQ_u8_u1_361,1);\
__declare_static_bit_vector(konst_363,32);\
bit_vector_clear(&konst_363);\
__declare_static_bit_vector(MUX_364,32);\
__declare_static_bit_vector(EQ_u8_u1_367,1);\
__declare_static_bit_vector(konst_369,10);\
bit_vector_clear(&konst_369);\
konst_369.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_370,10);\
__declare_static_bit_vector(type_cast_371,32);\
__declare_static_bit_vector(konst_372,32);\
bit_vector_clear(&konst_372);\
__declare_static_bit_vector(MUX_373,32);\
__declare_static_bit_vector(OR_u32_u32_374,32);\
__declare_static_bit_vector(OR_u32_u32_375,32);\
__declare_static_bit_vector(OR_u32_u32_376,32);\
bit_vector_equal(0, &(opcode), &(SBIR), &(EQ_u8_u1_297));\
if (has_undefined_bit(&EQ_u8_u1_297)) {fprintf(stderr, "Error: variable EQ_u8_u1_297 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_297));assert(0);} \
bit_vector_bitcast_to_bit_vector( &(type_cast_300), &(rs1_imm));\
bit_vector_or(&(AND_u32_u32_230_230_delayed_1_0), &(type_cast_300), &(OR_u32_u32_301));\
bit_vector_clear(&konst_302);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_297)){\
bit_vector_cast_to_bit_vector(0, &(MUX_303), &(OR_u32_u32_301));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_303), &(konst_302));\
}\
bit_vector_equal(0, &(opcode), &(L_AND), &(EQ_u8_u1_306));\
if (has_undefined_bit(&EQ_u8_u1_306)) {fprintf(stderr, "Error: variable EQ_u8_u1_306 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_306));assert(0);} \
bit_vector_clear(&konst_308);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_306)){\
bit_vector_cast_to_bit_vector(0, &(MUX_309), &(AND_u32_u32_241_241_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_309), &(konst_308));\
}\
bit_vector_or(&(MUX_303), &(MUX_309), &(OR_u32_u32_310));\
bit_vector_equal(0, &(opcode), &(L_OR), &(EQ_u8_u1_313));\
if (has_undefined_bit(&EQ_u8_u1_313)) {fprintf(stderr, "Error: variable EQ_u8_u1_313 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_313));assert(0);} \
bit_vector_clear(&konst_315);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_313)){\
bit_vector_cast_to_bit_vector(0, &(MUX_316), &(OR_u32_u32_250_250_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_316), &(konst_315));\
}\
bit_vector_or(&(OR_u32_u32_310), &(MUX_316), &(OR_u32_u32_317));\
bit_vector_equal(0, &(opcode), &(L_XNOR), &(EQ_u8_u1_320));\
if (has_undefined_bit(&EQ_u8_u1_320)) {fprintf(stderr, "Error: variable EQ_u8_u1_320 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_320));assert(0);} \
bit_vector_clear(&konst_322);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_320)){\
bit_vector_cast_to_bit_vector(0, &(MUX_323), &(XOR_u32_u32_259_259_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_323), &(konst_322));\
}\
bit_vector_equal(0, &(opcode), &(L_XOR), &(EQ_u8_u1_326));\
if (has_undefined_bit(&EQ_u8_u1_326)) {fprintf(stderr, "Error: variable EQ_u8_u1_326 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_326));assert(0);} \
bit_vector_clear(&konst_328);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_326)){\
bit_vector_cast_to_bit_vector(0, &(MUX_329), &(XOR_u32_u32_267_267_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_329), &(konst_328));\
}\
bit_vector_or(&(MUX_323), &(MUX_329), &(OR_u32_u32_330));\
bit_vector_equal(0, &(opcode), &(ADD), &(EQ_u8_u1_333));\
if (has_undefined_bit(&EQ_u8_u1_333)) {fprintf(stderr, "Error: variable EQ_u8_u1_333 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_333));assert(0);} \
bit_vector_clear(&konst_335);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_333)){\
bit_vector_cast_to_bit_vector(0, &(MUX_336), &(ADD_u32_u32_276_276_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_336), &(konst_335));\
}\
bit_vector_or(&(OR_u32_u32_330), &(MUX_336), &(OR_u32_u32_337));\
bit_vector_or(&(OR_u32_u32_317), &(OR_u32_u32_337), &(OR_u32_u32_338));\
bit_vector_equal(0, &(opcode), &(SUB), &(EQ_u8_u1_341));\
if (has_undefined_bit(&EQ_u8_u1_341)) {fprintf(stderr, "Error: variable EQ_u8_u1_341 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_341));assert(0);} \
bit_vector_clear(&konst_343);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_341)){\
bit_vector_cast_to_bit_vector(0, &(MUX_344), &(SUB_u32_u32_286_286_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_344), &(konst_343));\
}\
bit_vector_equal(0, &(opcode), &(L_SLL), &(EQ_u8_u1_347));\
if (has_undefined_bit(&EQ_u8_u1_347)) {fprintf(stderr, "Error: variable EQ_u8_u1_347 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_347));assert(0);} \
bit_vector_clear(&konst_349);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_347)){\
bit_vector_cast_to_bit_vector(0, &(MUX_350), &(type_cast_295_295_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_350), &(konst_349));\
}\
bit_vector_or(&(MUX_344), &(MUX_350), &(OR_u32_u32_351));\
bit_vector_equal(0, &(opcode), &(L_SRL), &(EQ_u8_u1_354));\
if (has_undefined_bit(&EQ_u8_u1_354)) {fprintf(stderr, "Error: variable EQ_u8_u1_354 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_354));assert(0);} \
bit_vector_clear(&konst_356);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_354)){\
bit_vector_cast_to_bit_vector(0, &(MUX_357), &(type_cast_305_305_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_357), &(konst_356));\
}\
bit_vector_or(&(OR_u32_u32_351), &(MUX_357), &(OR_u32_u32_358));\
bit_vector_equal(0, &(opcode), &(CMP), &(EQ_u8_u1_361));\
if (has_undefined_bit(&EQ_u8_u1_361)) {fprintf(stderr, "Error: variable EQ_u8_u1_361 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_361));assert(0);} \
bit_vector_clear(&konst_363);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_361)){\
bit_vector_cast_to_bit_vector(0, &(MUX_364), &(OR_u32_u32_331_331_delayed_1_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_364), &(konst_363));\
}\
bit_vector_equal(0, &(opcode), &(CALL), &(EQ_u8_u1_367));\
if (has_undefined_bit(&EQ_u8_u1_367)) {fprintf(stderr, "Error: variable EQ_u8_u1_367 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_367));assert(0);} \
bit_vector_clear(&konst_369);\
konst_369.val.byte_array[0] = 1;\
bit_vector_plus( &(program_cnt), &(konst_369), &(ADD_u10_u10_370));\
bit_vector_bitcast_to_bit_vector( &(type_cast_371), &(ADD_u10_u10_370));\
bit_vector_clear(&konst_372);\
if(bit_vector_to_uint64(0, &EQ_u8_u1_367)){\
bit_vector_cast_to_bit_vector(0, &(MUX_373), &(type_cast_371));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_373), &(konst_372));\
}\
bit_vector_or(&(MUX_364), &(MUX_373), &(OR_u32_u32_374));\
bit_vector_or(&(OR_u32_u32_358), &(OR_u32_u32_374), &(OR_u32_u32_375));\
bit_vector_or(&(OR_u32_u32_338), &(OR_u32_u32_375), &(OR_u32_u32_376));\
bit_vector_cast_to_bit_vector(0, &(exec_result_initial), &(OR_u32_u32_376));\
;

#define simple_proc__iExecStage_assign_stmt_385_c_macro_ __declare_static_bit_vector(EQ_u8_u1_381,1);\
__declare_static_bit_vector(MUX_384,1);\
bit_vector_equal(0, &(opcode), &(L_SRA), &(EQ_u8_u1_381));\
if (has_undefined_bit(&EQ_u8_u1_381)) {fprintf(stderr, "Error: variable EQ_u8_u1_381 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_381));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_381)){\
bit_vector_cast_to_bit_vector(0, &(MUX_384), &(one_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_384), &(zero_1));\
}\
bit_vector_cast_to_bit_vector(0, &(is_SRA), &(MUX_384));\
;

#define simple_proc__iExecStage_assign_stmt_388_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd1_final_357_delayed_1_0), &(iexec_rd1_final));\
;

#define simple_proc__iExecStage_assign_stmt_391_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd2_final_358_delayed_1_0), &(iexec_rd2_final));\
;

#define simple_proc__iExecStage_assign_stmt_397_c_macro_ if (has_undefined_bit(&is_SRA)) {fprintf(stderr, "Error: variable is_SRA has undefined value (%s) at test point.\n", to_string(&is_SRA));assert(0);} \
__declare_static_bit_vector(LSHR_u32_u32_396,32);\
if (bit_vector_to_uint64(0, &is_SRA)) {\
bit_vector_shift_right(0, &(iexec_rd1_final_357_delayed_1_0), &(iexec_rd2_final_358_delayed_1_0), &(LSHR_u32_u32_396));\
bit_vector_cast_to_bit_vector(0, &(bottom_bits), &(LSHR_u32_u32_396));\
}
;

#define simple_proc__iExecStage_assign_stmt_400_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd1_final_364_delayed_1_0), &(iexec_rd1_final));\
;

#define simple_proc__iExecStage_assign_stmt_403_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd2_final_369_delayed_1_0), &(iexec_rd2_final));\
;

#define simple_proc__iExecStage_assign_stmt_415_c_macro_ if (has_undefined_bit(&is_SRA)) {fprintf(stderr, "Error: variable is_SRA has undefined value (%s) at test point.\n", to_string(&is_SRA));assert(0);} \
__declare_static_bit_vector(LSHR_u32_u32_409,32);\
__declare_static_bit_vector(SUB_u32_u32_410,32);\
__declare_static_bit_vector(SUB_u32_u32_413,32);\
__declare_static_bit_vector(SHL_u32_u32_414,32);\
if (bit_vector_to_uint64(0, &is_SRA)) {\
bit_vector_shift_right(0, &(iexec_rd1_final_364_delayed_1_0), &(thirty_one_32), &(LSHR_u32_u32_409));\
bit_vector_minus( &(zero_32), &(LSHR_u32_u32_409), &(SUB_u32_u32_410));\
bit_vector_minus( &(thirty_two_32), &(iexec_rd2_final_369_delayed_1_0), &(SUB_u32_u32_413));\
bit_vector_shift_left(&(SUB_u32_u32_410), &(SUB_u32_u32_413), &(SHL_u32_u32_414));\
bit_vector_cast_to_bit_vector(0, &(top_bits), &(SHL_u32_u32_414));\
}
;

#define simple_proc__iExecStage_assign_stmt_421_c_macro_ if (has_undefined_bit(&is_SRA)) {fprintf(stderr, "Error: variable is_SRA has undefined value (%s) at test point.\n", to_string(&is_SRA));assert(0);} \
__declare_static_bit_vector(OR_u32_u32_420,32);\
if (bit_vector_to_uint64(0, &is_SRA)) {\
bit_vector_or(&(top_bits), &(bottom_bits), &(OR_u32_u32_420));\
bit_vector_cast_to_bit_vector(0, &(result_for_SRA), &(OR_u32_u32_420));\
}
;

#define simple_proc__iExecStage_assign_stmt_427_c_macro_ __declare_static_bit_vector(MUX_426,32);\
if (has_undefined_bit(&is_SRA)) {fprintf(stderr, "Error: variable is_SRA has undefined value (%s) at test point.\n", to_string(&is_SRA));assert(0);} \
if(bit_vector_to_uint64(0, &is_SRA)){\
bit_vector_cast_to_bit_vector(0, &(MUX_426), &(result_for_SRA));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_426), &(exec_result_initial));\
}\
bit_vector_cast_to_bit_vector(0, &(exec_result), &(MUX_426));\
;

#define simple_proc__iExecStage_assign_stmt_431_c_macro_ __declare_static_bit_vector(slice_430,1);\
bit_vector_slice(&(iexec_rd1_final), &(slice_430), 31);\
bit_vector_cast_to_bit_vector(0, &(is_rs1_neg), &(slice_430));\
;

#define simple_proc__iExecStage_assign_stmt_435_c_macro_ __declare_static_bit_vector(NOT_u1_u1_434,1);\
bit_vector_not( &(is_rs1_neg), &(NOT_u1_u1_434));\
bit_vector_cast_to_bit_vector(0, &(NOT_u1_u1_399_399_delayed_1_0), &(NOT_u1_u1_434));\
;

#define simple_proc__iExecStage_assign_stmt_438_c_macro_ bit_vector_cast_to_bit_vector(0, &(is_rs1_neg_404_delayed_1_0), &(is_rs1_neg));\
;

#define simple_proc__iExecStage_assign_stmt_451_c_macro_ __declare_static_bit_vector(EQ_u8_u1_442,1);\
__declare_static_bit_vector(AND_u1_u1_444,1);\
__declare_static_bit_vector(EQ_u8_u1_447,1);\
__declare_static_bit_vector(AND_u1_u1_449,1);\
__declare_static_bit_vector(OR_u1_u1_450,1);\
bit_vector_equal(0, &(opcode), &(BZ), &(EQ_u8_u1_442));\
bit_vector_and(&(EQ_u8_u1_442), &(NOT_u1_u1_399_399_delayed_1_0), &(AND_u1_u1_444));\
bit_vector_equal(0, &(opcode), &(BN), &(EQ_u8_u1_447));\
bit_vector_and(&(EQ_u8_u1_447), &(is_rs1_neg_404_delayed_1_0), &(AND_u1_u1_449));\
bit_vector_or(&(AND_u1_u1_444), &(AND_u1_u1_449), &(OR_u1_u1_450));\
bit_vector_cast_to_bit_vector(0, &(is_Branch), &(OR_u1_u1_450));\
;

#define simple_proc__iExecStage_assign_stmt_454_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd1_final_415_delayed_1_0), &(iexec_rd1_final));\
;

#define simple_proc__iExecStage_assign_stmt_457_c_macro_ bit_vector_cast_to_bit_vector(0, &(iexec_rd2_final_418_delayed_1_0), &(iexec_rd2_final));\
;

#define simple_proc__iExecStage_assign_stmt_476_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_461,16);\
__declare_static_bit_vector(CONCAT_u16_u24_463,24);\
__declare_static_bit_vector(CONCAT_u8_u40_466,40);\
__declare_static_bit_vector(CONCAT_u24_u64_467,64);\
__declare_static_bit_vector(CONCAT_u32_u64_470,64);\
__declare_static_bit_vector(CONCAT_u1_u11_473,11);\
__declare_static_bit_vector(CONCAT_u64_u75_474,75);\
__declare_static_bit_vector(CONCAT_u64_u139_475,139);\
bit_vector_concatenate( &(opcode), &(rs1_imm), &(CONCAT_u8_u16_461));\
bit_vector_concatenate( &(CONCAT_u8_u16_461), &(rs2), &(CONCAT_u16_u24_463));\
bit_vector_concatenate( &(rd), &(iexec_rd1_final_415_delayed_1_0), &(CONCAT_u8_u40_466));\
bit_vector_concatenate( &(CONCAT_u16_u24_463), &(CONCAT_u8_u40_466), &(CONCAT_u24_u64_467));\
bit_vector_concatenate( &(iexec_rd2_final_418_delayed_1_0), &(exec_result), &(CONCAT_u32_u64_470));\
bit_vector_concatenate( &(is_Branch), &(program_cnt), &(CONCAT_u1_u11_473));\
bit_vector_concatenate( &(CONCAT_u32_u64_470), &(CONCAT_u1_u11_473), &(CONCAT_u64_u75_474));\
bit_vector_concatenate( &(CONCAT_u24_u64_467), &(CONCAT_u64_u75_474), &(CONCAT_u64_u139_475));\
bit_vector_cast_to_bit_vector(0, &(next_dcache_state), &(CONCAT_u64_u139_475));\
;

#define simple_proc__iExecStage_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pnext_dcache_state)), &(next_dcache_state));\
;

#define simple_proc__memAccessDaemon_inner_inarg_prep_macro__ 
#define simple_proc__memAccessDaemon_branch_block_stmt_479_c_export_decl_macro_ __declare_static_bit_vector(cmd_1,64);\
__declare_static_bit_vector(wdata,32);\
__declare_static_bit_vector(addr,10);\
__declare_static_bit_vector(rwbar,1);\
__declare_static_bit_vector(rdata,32);\


#define simple_proc__memAccessDaemon_merge_stmt_481_c_preamble_macro_ uint8_t merge_stmt_481_entry_flag;\
merge_stmt_481_entry_flag = do_while_entry_flag;\
goto merge_stmt_481_run;\
merge_stmt_481_run: ;\
;

#define simple_proc__memAccessDaemon_merge_stmt_481_c_postamble_macro_ merge_stmt_481_entry_flag = 0;

#define simple_proc__memAccessDaemon_assign_stmt_484_c_macro_ __declare_static_bit_vector(RPIPE_accessMem_request_483,64);\
read_bit_vector_from_pipe("accessMem_request",&(RPIPE_accessMem_request_483));\
bit_vector_cast_to_bit_vector(0, &(cmd_1), &(RPIPE_accessMem_request_483));\
;

#define simple_proc__memAccessDaemon_assign_stmt_488_c_macro_ __declare_static_bit_vector(slice_487,32);\
bit_vector_slice(&(cmd_1), &(slice_487), 32);\
bit_vector_cast_to_bit_vector(0, &(wdata), &(slice_487));\
;

#define simple_proc__memAccessDaemon_assign_stmt_492_c_macro_ __declare_static_bit_vector(slice_491,10);\
bit_vector_slice(&(cmd_1), &(slice_491), 22);\
bit_vector_cast_to_bit_vector(0, &(addr), &(slice_491));\
;

#define simple_proc__memAccessDaemon_assign_stmt_496_c_macro_ __declare_static_bit_vector(slice_495,1);\
bit_vector_slice(&(cmd_1), &(slice_495), 0);\
bit_vector_cast_to_bit_vector(0, &(rwbar), &(slice_495));\
;

#define simple_proc__memAccessDaemon_call_stmt_501_c_macro_ _simple_proc_accessMem_( &(rwbar),  &(addr),  &(wdata), &(rdata));\
;

#define simple_proc__memAccessDaemon_assign_stmt_504_c_macro_ write_bit_vector_to_pipe("accessMem_response",&(rdata));\
;
;

#define simple_proc__memAccessDaemon_branch_block_stmt_479_c_export_apply_macro_ ;

#define simple_proc__memAccessDaemon_inner_outarg_prep_macro__ ;

#define simple_proc__memAccessDaemon_outer_arg_decl_macro__ ;

#define simple_proc__memAccessDaemon_outer_op_xfer_macro__ ;

#define simple_proc__processor_daemon_inner_inarg_prep_macro__ 
#define simple_proc__processor_daemon_branch_block_stmt_921_c_export_decl_macro_ __declare_static_bit_vector(cmd,8);\


#define simple_proc__processor_daemon_merge_stmt_922_c_preamble_macro_ uint8_t merge_stmt_922_entry_flag;\
merge_stmt_922_entry_flag = 1;\
uint8_t check_for_start_921_flag = 0;\
goto merge_stmt_922_run;\
check_for_start_921: check_for_start_921_flag = 1;\
goto merge_stmt_922_run;\
merge_stmt_922_run: ;\
;

#define simple_proc__processor_daemon_merge_stmt_922_c_postamble_macro_ check_for_start_921_flag = 0;\
merge_stmt_922_entry_flag = 0;

#define simple_proc__processor_daemon_assign_stmt_925_c_macro_ __declare_static_bit_vector(RPIPE_start_processor_924,8);\
read_bit_vector_from_pipe("start_processor",&(RPIPE_start_processor_924));\
bit_vector_cast_to_bit_vector(0, &(cmd), &(RPIPE_start_processor_924));\
;

#define simple_proc__processor_daemon_branch_block_stmt_930_c_export_decl_macro_ __declare_static_bit_vector(ifetch_state,10);\
__declare_static_bit_vector(icache_state,10);\
__declare_static_bit_vector(idecode_state,42);\
__declare_static_bit_vector(iregfile_state,42);\
__declare_static_bit_vector(iexec_state,106);\
__declare_static_bit_vector(dcache_state,139);\
__declare_static_bit_vector(iretire_state,139);\
__declare_static_bit_vector(ifetch_actions,10);\
__declare_static_bit_vector(icache_actions,10);\
__declare_static_bit_vector(idecode_actions,42);\
__declare_static_bit_vector(iregfile_actions,5);\
__declare_static_bit_vector(iexec_actions,4);\
__declare_static_bit_vector(dcache_actions,3);\
__declare_static_bit_vector(ex_Unconditional_JUMP,1);\
__declare_static_bit_vector(is_Branch_Hazard,1);\
__declare_static_bit_vector(flush_ifetch,1);\
__declare_static_bit_vector(flush_icache,1);\
__declare_static_bit_vector(flush_idecode,1);\
__declare_static_bit_vector(flush_reg,1);\
__declare_static_bit_vector(flush_iexec,1);\
__declare_static_bit_vector(flush_dcache,1);\
__declare_static_bit_vector(stall_first_4,1);\
__declare_static_bit_vector(icache_instruction,32);\
__declare_static_bit_vector(n_icache_state,10);\
__declare_static_bit_vector(flush_idecode_1058_delayed_7_0,1);\
__declare_static_bit_vector(stall_first_4_1060_delayed_7_0,1);\
__declare_static_bit_vector(idecode_state_1061_delayed_7_0,42);\
__declare_static_bit_vector(icache_state_1063_delayed_7_0,10);\
__declare_static_bit_vector(n_idecode_state,42);\
__declare_static_bit_vector(n_iregfile_state,42);\
__declare_static_bit_vector(iregfile_pc,10);\
__declare_static_bit_vector(iexec_rs1_imm,8);\
__declare_static_bit_vector(iexec_rd1,32);\
__declare_static_bit_vector(iexec_rd2,32);\
__declare_static_bit_vector(dcache_opcode,8);\
__declare_static_bit_vector(dcache_rs1_imm,8);\
__declare_static_bit_vector(dcache_rs2,8);\
__declare_static_bit_vector(dcache_rd,8);\
__declare_static_bit_vector(dcache_rd1,32);\
__declare_static_bit_vector(dcache_rd2,32);\
__declare_static_bit_vector(dcache_exec_result,32);\
__declare_static_bit_vector(dcache_isBranch,1);\
__declare_static_bit_vector(dcache_pc,10);\
__declare_static_bit_vector(iretire_opcode,8);\
__declare_static_bit_vector(iretire_rd,8);\
__declare_static_bit_vector(iretire_exec_result_memData,32);\
__declare_static_bit_vector(dcache_to_ex_rs1_imm,1);\
__declare_static_bit_vector(dcache_to_ex_rs2,1);\
__declare_static_bit_vector(iretire_state_to_ex_rs1_imm,1);\
__declare_static_bit_vector(iretire_state_to_ex_rs2,1);\
__declare_static_bit_vector(iexec_rd1_final,32);\
__declare_static_bit_vector(iexec_rd2_final,32);\
__declare_static_bit_vector(n_dcache_state_from_exec,139);\
__declare_static_bit_vector(flush_dcache_1221_delayed_4_0,1);\
__declare_static_bit_vector(n_dcache_state,139);\
__declare_static_bit_vector(memWrite,1);\
__declare_static_bit_vector(iretire_state_to_dcache_addr,1);\
__declare_static_bit_vector(iretire_state_to_dcache_memData,1);\
__declare_static_bit_vector(memWriteData,32);\
__declare_static_bit_vector(final_memAddr_32,32);\
__declare_static_bit_vector(memAddr,10);\
__declare_static_bit_vector(memReadData,32);\
__declare_static_bit_vector(reg_valid_read1,1);\
__declare_static_bit_vector(reg_valid_read2,1);\
__declare_static_bit_vector(reg_valid_write,1);\
__declare_static_bit_vector(iretire_state_to_rs1_imm,1);\
__declare_static_bit_vector(iretire_state_to_rs2,1);\
__declare_static_bit_vector(reg_opcode,8);\
__declare_static_bit_vector(reg_rs1_imm,8);\
__declare_static_bit_vector(reg_rs2,8);\
__declare_static_bit_vector(reg_rd,8);\
__declare_static_bit_vector(reg_data_to_be_written,32);\
__declare_static_bit_vector(reg_d1,32);\
__declare_static_bit_vector(reg_d2,32);\
__declare_static_bit_vector(iretire_state_to_rs1_imm_1318_delayed_7_0,1);\
__declare_static_bit_vector(reg_data_to_be_written_1319_delayed_7_0,32);\
__declare_static_bit_vector(final_rd1,32);\
__declare_static_bit_vector(iretire_state_to_rs2_1324_delayed_7_0,1);\
__declare_static_bit_vector(reg_data_to_be_written_1325_delayed_7_0,32);\
__declare_static_bit_vector(final_rd2,32);\
__declare_static_bit_vector(flush_iexec_1330_delayed_7_0,1);\
__declare_static_bit_vector(CONCAT_u16_u32_1338_1338_delayed_7_0,32);\
__declare_static_bit_vector(iregfile_pc_1342_delayed_7_0,10);\
__declare_static_bit_vector(n_iexec_state,106);\
__declare_static_bit_vector(EQ_u8_u1_1350_1350_delayed_7_0,1);\
__declare_static_bit_vector(dcache_exec_result_1352_delayed_7_0,32);\
__declare_static_bit_vector(dcache_data_to_be_written_to_reg,32);\
__declare_static_bit_vector(CONCAT_u24_u64_1364_1364_delayed_7_0,64);\
__declare_static_bit_vector(dcache_rd2_1365_delayed_7_0,32);\
__declare_static_bit_vector(CONCAT_u1_u11_1370_1370_delayed_7_0,11);\
__declare_static_bit_vector(n_iRetire_state,139);\
__declare_static_bit_vector(iretire_to_dcache_addr_32,32);\
__declare_static_bit_vector(dcache_to_ex_addr_32,32);\
__declare_static_bit_vector(next_ifetch_state_32,32);\
__declare_static_bit_vector(next_ifetch_state,10);\


#define simple_proc__processor_daemon_merge_stmt_932_c_preamble_macro_ uint8_t merge_stmt_932_entry_flag;\
merge_stmt_932_entry_flag = do_while_entry_flag;\
goto merge_stmt_932_run;\
merge_stmt_932_run: ;\

#define simple_proc__processor_daemon_phi_stmt_933_c_macro_ if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(ifetch_state), &(next_ifetch_state));\
}\
else {\
bit_vector_cast_to_bit_vector(0, &(ifetch_state), &(one_10));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_937_c_macro_ __declare_static_bit_vector(konst_939,10);\
bit_vector_clear(&konst_939);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(icache_state), &(n_icache_state));\
}\
else {\
__declare_static_bit_vector(konst_939,10);\
bit_vector_clear(&konst_939);\
bit_vector_clear(&konst_939);\
bit_vector_cast_to_bit_vector(0, &(icache_state), &(konst_939));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_941_c_macro_ __declare_static_bit_vector(konst_943,42);\
bit_vector_clear(&konst_943);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(idecode_state), &(n_idecode_state));\
}\
else {\
__declare_static_bit_vector(konst_943,42);\
bit_vector_clear(&konst_943);\
bit_vector_clear(&konst_943);\
bit_vector_cast_to_bit_vector(0, &(idecode_state), &(konst_943));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_945_c_macro_ __declare_static_bit_vector(konst_947,42);\
bit_vector_clear(&konst_947);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(iregfile_state), &(n_iregfile_state));\
}\
else {\
__declare_static_bit_vector(konst_947,42);\
bit_vector_clear(&konst_947);\
bit_vector_clear(&konst_947);\
bit_vector_cast_to_bit_vector(0, &(iregfile_state), &(konst_947));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_949_c_macro_ __declare_static_bit_vector(konst_951,106);\
bit_vector_clear(&konst_951);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(iexec_state), &(n_iexec_state));\
}\
else {\
__declare_static_bit_vector(konst_951,106);\
bit_vector_clear(&konst_951);\
bit_vector_clear(&konst_951);\
bit_vector_cast_to_bit_vector(0, &(iexec_state), &(konst_951));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_953_c_macro_ __declare_static_bit_vector(konst_955,139);\
bit_vector_clear(&konst_955);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(dcache_state), &(n_dcache_state));\
}\
else {\
__declare_static_bit_vector(konst_955,139);\
bit_vector_clear(&konst_955);\
bit_vector_clear(&konst_955);\
bit_vector_cast_to_bit_vector(0, &(dcache_state), &(konst_955));\
}\
;

#define simple_proc__processor_daemon_phi_stmt_957_c_macro_ __declare_static_bit_vector(konst_959,139);\
bit_vector_clear(&konst_959);\
if(do_while_loopback_flag) {\
bit_vector_cast_to_bit_vector(0, &(iretire_state), &(n_iRetire_state));\
}\
else {\
__declare_static_bit_vector(konst_959,139);\
bit_vector_clear(&konst_959);\
bit_vector_clear(&konst_959);\
bit_vector_cast_to_bit_vector(0, &(iretire_state), &(konst_959));\
}\
;
;

#define simple_proc__processor_daemon_merge_stmt_932_c_postamble_macro_ merge_stmt_932_entry_flag = 0;

#define simple_proc__processor_daemon_call_stmt_984_c_macro_ _simple_proc_scoreBoard_( &(ifetch_state),  &(icache_state),  &(idecode_state),  &(iregfile_state),  &(iexec_state),  &(dcache_state),  &(iretire_state), &(ifetch_actions), &(icache_actions), &(idecode_actions), &(iregfile_actions), &(iexec_actions), &(dcache_actions), &(ex_Unconditional_JUMP), &(is_Branch_Hazard), &(flush_ifetch), &(flush_icache), &(flush_idecode), &(flush_reg), &(flush_iexec), &(flush_dcache), &(stall_first_4));\
;

#define simple_proc__processor_daemon_call_stmt_989_c_macro_ _simple_proc_accessMem_( &(read_signal),  &(icache_state),  &(zero_32), &(icache_instruction));\
;

#define simple_proc__processor_daemon_assign_stmt_998_c_macro_ __declare_static_bit_vector(MUX_996,10);\
__declare_static_bit_vector(MUX_997,10);\
if (has_undefined_bit(&flush_icache)) {fprintf(stderr, "Error: variable flush_icache has undefined value (%s) at test point.\n", to_string(&flush_icache));assert(0);} \
if (has_undefined_bit(&stall_first_4)) {fprintf(stderr, "Error: variable stall_first_4 has undefined value (%s) at test point.\n", to_string(&stall_first_4));assert(0);} \
if(bit_vector_to_uint64(0, &stall_first_4)){\
bit_vector_cast_to_bit_vector(0, &(MUX_996), &(icache_state));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_996), &(ifetch_state));\
}\
if(bit_vector_to_uint64(0, &flush_icache)){\
bit_vector_cast_to_bit_vector(0, &(MUX_997), &(zero_10));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_997), &(MUX_996));\
}\
bit_vector_cast_to_bit_vector(0, &(n_icache_state), &(MUX_997));\
;

#define simple_proc__processor_daemon_assign_stmt_1001_c_macro_ bit_vector_cast_to_bit_vector(0, &(flush_idecode_1058_delayed_7_0), &(flush_idecode));\
;

#define simple_proc__processor_daemon_assign_stmt_1004_c_macro_ bit_vector_cast_to_bit_vector(0, &(stall_first_4_1060_delayed_7_0), &(stall_first_4));\
;

#define simple_proc__processor_daemon_assign_stmt_1007_c_macro_ bit_vector_cast_to_bit_vector(0, &(idecode_state_1061_delayed_7_0), &(idecode_state));\
;

#define simple_proc__processor_daemon_assign_stmt_1010_c_macro_ bit_vector_cast_to_bit_vector(0, &(icache_state_1063_delayed_7_0), &(icache_state));\
;

#define simple_proc__processor_daemon_assign_stmt_1021_c_macro_ __declare_static_bit_vector(CONCAT_u32_u42_1018,42);\
__declare_static_bit_vector(MUX_1019,42);\
__declare_static_bit_vector(MUX_1020,42);\
if (has_undefined_bit(&flush_idecode_1058_delayed_7_0)) {fprintf(stderr, "Error: variable flush_idecode_1058_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&flush_idecode_1058_delayed_7_0));assert(0);} \
if (has_undefined_bit(&stall_first_4_1060_delayed_7_0)) {fprintf(stderr, "Error: variable stall_first_4_1060_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&stall_first_4_1060_delayed_7_0));assert(0);} \
bit_vector_concatenate( &(icache_instruction), &(icache_state_1063_delayed_7_0), &(CONCAT_u32_u42_1018));\
if(bit_vector_to_uint64(0, &stall_first_4_1060_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1019), &(idecode_state_1061_delayed_7_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1019), &(CONCAT_u32_u42_1018));\
}\
if(bit_vector_to_uint64(0, &flush_idecode_1058_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1020), &(zero_42));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1020), &(MUX_1019));\
}\
bit_vector_cast_to_bit_vector(0, &(n_idecode_state), &(MUX_1020));\
;

#define simple_proc__processor_daemon_assign_stmt_1030_c_macro_ __declare_static_bit_vector(MUX_1028,42);\
__declare_static_bit_vector(MUX_1029,42);\
if (has_undefined_bit(&flush_reg)) {fprintf(stderr, "Error: variable flush_reg has undefined value (%s) at test point.\n", to_string(&flush_reg));assert(0);} \
if (has_undefined_bit(&stall_first_4)) {fprintf(stderr, "Error: variable stall_first_4 has undefined value (%s) at test point.\n", to_string(&stall_first_4));assert(0);} \
if(bit_vector_to_uint64(0, &stall_first_4)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1028), &(iregfile_state));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1028), &(idecode_state));\
}\
if(bit_vector_to_uint64(0, &flush_reg)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1029), &(zero_42));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1029), &(MUX_1028));\
}\
bit_vector_cast_to_bit_vector(0, &(n_iregfile_state), &(MUX_1029));\
;

#define simple_proc__processor_daemon_assign_stmt_1034_c_macro_ __declare_static_bit_vector(slice_1033,10);\
bit_vector_slice(&(iregfile_state), &(slice_1033), 0);\
bit_vector_cast_to_bit_vector(0, &(iregfile_pc), &(slice_1033));\
;

#define simple_proc__processor_daemon_assign_stmt_1038_c_macro_ __declare_static_bit_vector(slice_1037,8);\
bit_vector_slice(&(iexec_state), &(slice_1037), 90);\
bit_vector_cast_to_bit_vector(0, &(iexec_rs1_imm), &(slice_1037));\
;

#define simple_proc__processor_daemon_assign_stmt_1042_c_macro_ __declare_static_bit_vector(slice_1041,32);\
bit_vector_slice(&(iexec_state), &(slice_1041), 42);\
bit_vector_cast_to_bit_vector(0, &(iexec_rd1), &(slice_1041));\
;

#define simple_proc__processor_daemon_assign_stmt_1046_c_macro_ __declare_static_bit_vector(slice_1045,32);\
bit_vector_slice(&(iexec_state), &(slice_1045), 10);\
bit_vector_cast_to_bit_vector(0, &(iexec_rd2), &(slice_1045));\
;

#define simple_proc__processor_daemon_assign_stmt_1050_c_macro_ __declare_static_bit_vector(slice_1049,8);\
bit_vector_slice(&(dcache_state), &(slice_1049), 131);\
bit_vector_cast_to_bit_vector(0, &(dcache_opcode), &(slice_1049));\
;

#define simple_proc__processor_daemon_assign_stmt_1054_c_macro_ __declare_static_bit_vector(slice_1053,8);\
bit_vector_slice(&(dcache_state), &(slice_1053), 123);\
bit_vector_cast_to_bit_vector(0, &(dcache_rs1_imm), &(slice_1053));\
;

#define simple_proc__processor_daemon_assign_stmt_1058_c_macro_ __declare_static_bit_vector(slice_1057,8);\
bit_vector_slice(&(dcache_state), &(slice_1057), 115);\
bit_vector_cast_to_bit_vector(0, &(dcache_rs2), &(slice_1057));\
;

#define simple_proc__processor_daemon_assign_stmt_1062_c_macro_ __declare_static_bit_vector(slice_1061,8);\
bit_vector_slice(&(dcache_state), &(slice_1061), 107);\
bit_vector_cast_to_bit_vector(0, &(dcache_rd), &(slice_1061));\
;

#define simple_proc__processor_daemon_assign_stmt_1066_c_macro_ __declare_static_bit_vector(slice_1065,32);\
bit_vector_slice(&(dcache_state), &(slice_1065), 75);\
bit_vector_cast_to_bit_vector(0, &(dcache_rd1), &(slice_1065));\
;

#define simple_proc__processor_daemon_assign_stmt_1070_c_macro_ __declare_static_bit_vector(slice_1069,32);\
bit_vector_slice(&(dcache_state), &(slice_1069), 43);\
bit_vector_cast_to_bit_vector(0, &(dcache_rd2), &(slice_1069));\
;

#define simple_proc__processor_daemon_assign_stmt_1074_c_macro_ __declare_static_bit_vector(slice_1073,32);\
bit_vector_slice(&(dcache_state), &(slice_1073), 11);\
bit_vector_cast_to_bit_vector(0, &(dcache_exec_result), &(slice_1073));\
;

#define simple_proc__processor_daemon_assign_stmt_1078_c_macro_ __declare_static_bit_vector(slice_1077,1);\
bit_vector_slice(&(dcache_state), &(slice_1077), 10);\
bit_vector_cast_to_bit_vector(0, &(dcache_isBranch), &(slice_1077));\
;

#define simple_proc__processor_daemon_assign_stmt_1082_c_macro_ __declare_static_bit_vector(slice_1081,10);\
bit_vector_slice(&(dcache_state), &(slice_1081), 0);\
bit_vector_cast_to_bit_vector(0, &(dcache_pc), &(slice_1081));\
;

#define simple_proc__processor_daemon_assign_stmt_1086_c_macro_ __declare_static_bit_vector(slice_1085,8);\
bit_vector_slice(&(iretire_state), &(slice_1085), 131);\
bit_vector_cast_to_bit_vector(0, &(iretire_opcode), &(slice_1085));\
;

#define simple_proc__processor_daemon_assign_stmt_1090_c_macro_ __declare_static_bit_vector(slice_1089,8);\
bit_vector_slice(&(iretire_state), &(slice_1089), 107);\
bit_vector_cast_to_bit_vector(0, &(iretire_rd), &(slice_1089));\
;

#define simple_proc__processor_daemon_assign_stmt_1094_c_macro_ __declare_static_bit_vector(slice_1093,32);\
bit_vector_slice(&(iretire_state), &(slice_1093), 11);\
bit_vector_cast_to_bit_vector(0, &(iretire_exec_result_memData), &(slice_1093));\
;

#define simple_proc__processor_daemon_assign_stmt_1098_c_macro_ __declare_static_bit_vector(slice_1097,1);\
bit_vector_slice(&(iexec_actions), &(slice_1097), 3);\
bit_vector_cast_to_bit_vector(0, &(dcache_to_ex_rs1_imm), &(slice_1097));\
;

#define simple_proc__processor_daemon_assign_stmt_1102_c_macro_ __declare_static_bit_vector(slice_1101,1);\
bit_vector_slice(&(iexec_actions), &(slice_1101), 2);\
bit_vector_cast_to_bit_vector(0, &(dcache_to_ex_rs2), &(slice_1101));\
;

#define simple_proc__processor_daemon_assign_stmt_1106_c_macro_ __declare_static_bit_vector(slice_1105,1);\
bit_vector_slice(&(iexec_actions), &(slice_1105), 1);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_ex_rs1_imm), &(slice_1105));\
;

#define simple_proc__processor_daemon_assign_stmt_1110_c_macro_ __declare_static_bit_vector(slice_1109,1);\
bit_vector_slice(&(iexec_actions), &(slice_1109), 0);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_ex_rs2), &(slice_1109));\
;

#define simple_proc__processor_daemon_assign_stmt_1119_c_macro_ __declare_static_bit_vector(MUX_1117,32);\
__declare_static_bit_vector(MUX_1118,32);\
if (has_undefined_bit(&dcache_to_ex_rs1_imm)) {fprintf(stderr, "Error: variable dcache_to_ex_rs1_imm has undefined value (%s) at test point.\n", to_string(&dcache_to_ex_rs1_imm));assert(0);} \
if (has_undefined_bit(&iretire_state_to_ex_rs1_imm)) {fprintf(stderr, "Error: variable iretire_state_to_ex_rs1_imm has undefined value (%s) at test point.\n", to_string(&iretire_state_to_ex_rs1_imm));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_ex_rs1_imm)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1117), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1117), &(iexec_rd1));\
}\
if(bit_vector_to_uint64(0, &dcache_to_ex_rs1_imm)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1118), &(dcache_exec_result));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1118), &(MUX_1117));\
}\
bit_vector_cast_to_bit_vector(0, &(iexec_rd1_final), &(MUX_1118));\
;

#define simple_proc__processor_daemon_assign_stmt_1128_c_macro_ __declare_static_bit_vector(MUX_1126,32);\
__declare_static_bit_vector(MUX_1127,32);\
if (has_undefined_bit(&dcache_to_ex_rs2)) {fprintf(stderr, "Error: variable dcache_to_ex_rs2 has undefined value (%s) at test point.\n", to_string(&dcache_to_ex_rs2));assert(0);} \
if (has_undefined_bit(&iretire_state_to_ex_rs2)) {fprintf(stderr, "Error: variable iretire_state_to_ex_rs2 has undefined value (%s) at test point.\n", to_string(&iretire_state_to_ex_rs2));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_ex_rs2)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1126), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1126), &(iexec_rd2));\
}\
if(bit_vector_to_uint64(0, &dcache_to_ex_rs2)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1127), &(dcache_exec_result));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1127), &(MUX_1126));\
}\
bit_vector_cast_to_bit_vector(0, &(iexec_rd2_final), &(MUX_1127));\
;

#define simple_proc__processor_daemon_call_stmt_1133_c_macro_ _simple_proc_iExecStage_( &(iexec_state),  &(iexec_rd1_final),  &(iexec_rd2_final), &(n_dcache_state_from_exec));\
;

#define simple_proc__processor_daemon_assign_stmt_1136_c_macro_ bit_vector_cast_to_bit_vector(0, &(flush_dcache_1221_delayed_4_0), &(flush_dcache));\
;

#define simple_proc__processor_daemon_assign_stmt_1142_c_macro_ __declare_static_bit_vector(MUX_1141,139);\
if (has_undefined_bit(&flush_dcache_1221_delayed_4_0)) {fprintf(stderr, "Error: variable flush_dcache_1221_delayed_4_0 has undefined value (%s) at test point.\n", to_string(&flush_dcache_1221_delayed_4_0));assert(0);} \
if(bit_vector_to_uint64(0, &flush_dcache_1221_delayed_4_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1141), &(zero_139));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1141), &(n_dcache_state_from_exec));\
}\
bit_vector_cast_to_bit_vector(0, &(n_dcache_state), &(MUX_1141));\
;

#define simple_proc__processor_daemon_assign_stmt_1146_c_macro_ __declare_static_bit_vector(slice_1145,1);\
bit_vector_slice(&(dcache_actions), &(slice_1145), 2);\
bit_vector_cast_to_bit_vector(0, &(memWrite), &(slice_1145));\
;

#define simple_proc__processor_daemon_assign_stmt_1150_c_macro_ __declare_static_bit_vector(slice_1149,1);\
bit_vector_slice(&(dcache_actions), &(slice_1149), 1);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_dcache_addr), &(slice_1149));\
;

#define simple_proc__processor_daemon_assign_stmt_1154_c_macro_ __declare_static_bit_vector(slice_1153,1);\
bit_vector_slice(&(dcache_actions), &(slice_1153), 0);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_dcache_memData), &(slice_1153));\
;

#define simple_proc__processor_daemon_assign_stmt_1160_c_macro_ __declare_static_bit_vector(MUX_1159,32);\
if (has_undefined_bit(&iretire_state_to_dcache_memData)) {fprintf(stderr, "Error: variable iretire_state_to_dcache_memData has undefined value (%s) at test point.\n", to_string(&iretire_state_to_dcache_memData));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_dcache_memData)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1159), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1159), &(dcache_rd2));\
}\
bit_vector_cast_to_bit_vector(0, &(memWriteData), &(MUX_1159));\
;

#define simple_proc__processor_daemon_assign_stmt_1166_c_macro_ __declare_static_bit_vector(MUX_1165,32);\
if (has_undefined_bit(&iretire_state_to_dcache_addr)) {fprintf(stderr, "Error: variable iretire_state_to_dcache_addr has undefined value (%s) at test point.\n", to_string(&iretire_state_to_dcache_addr));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_dcache_addr)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1165), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1165), &(dcache_rd1));\
}\
bit_vector_cast_to_bit_vector(0, &(final_memAddr_32), &(MUX_1165));\
;

#define simple_proc__processor_daemon_assign_stmt_1170_c_macro_ __declare_static_bit_vector(slice_1169,10);\
bit_vector_slice(&(final_memAddr_32), &(slice_1169), 0);\
bit_vector_cast_to_bit_vector(0, &(memAddr), &(slice_1169));\
;

#define simple_proc__processor_daemon_call_stmt_1175_c_macro_ _simple_proc_accessMem_( &(memWrite),  &(memAddr),  &(memWriteData), &(memReadData));\
;

#define simple_proc__processor_daemon_assign_stmt_1179_c_macro_ __declare_static_bit_vector(slice_1178,1);\
bit_vector_slice(&(iregfile_actions), &(slice_1178), 4);\
bit_vector_cast_to_bit_vector(0, &(reg_valid_read1), &(slice_1178));\
;

#define simple_proc__processor_daemon_assign_stmt_1183_c_macro_ __declare_static_bit_vector(slice_1182,1);\
bit_vector_slice(&(iregfile_actions), &(slice_1182), 3);\
bit_vector_cast_to_bit_vector(0, &(reg_valid_read2), &(slice_1182));\
;

#define simple_proc__processor_daemon_assign_stmt_1187_c_macro_ __declare_static_bit_vector(slice_1186,1);\
bit_vector_slice(&(iregfile_actions), &(slice_1186), 2);\
bit_vector_cast_to_bit_vector(0, &(reg_valid_write), &(slice_1186));\
;

#define simple_proc__processor_daemon_assign_stmt_1191_c_macro_ __declare_static_bit_vector(slice_1190,1);\
bit_vector_slice(&(iregfile_actions), &(slice_1190), 1);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs1_imm), &(slice_1190));\
;

#define simple_proc__processor_daemon_assign_stmt_1195_c_macro_ __declare_static_bit_vector(slice_1194,1);\
bit_vector_slice(&(iregfile_actions), &(slice_1194), 0);\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs2), &(slice_1194));\
;

#define simple_proc__processor_daemon_assign_stmt_1199_c_macro_ __declare_static_bit_vector(slice_1198,8);\
bit_vector_slice(&(iregfile_state), &(slice_1198), 34);\
bit_vector_cast_to_bit_vector(0, &(reg_opcode), &(slice_1198));\
;

#define simple_proc__processor_daemon_assign_stmt_1203_c_macro_ __declare_static_bit_vector(slice_1202,8);\
bit_vector_slice(&(iregfile_state), &(slice_1202), 26);\
bit_vector_cast_to_bit_vector(0, &(reg_rs1_imm), &(slice_1202));\
;

#define simple_proc__processor_daemon_assign_stmt_1207_c_macro_ __declare_static_bit_vector(slice_1206,8);\
bit_vector_slice(&(iregfile_state), &(slice_1206), 18);\
bit_vector_cast_to_bit_vector(0, &(reg_rs2), &(slice_1206));\
;

#define simple_proc__processor_daemon_assign_stmt_1211_c_macro_ __declare_static_bit_vector(slice_1210,8);\
bit_vector_slice(&(iregfile_state), &(slice_1210), 10);\
bit_vector_cast_to_bit_vector(0, &(reg_rd), &(slice_1210));\
;

#define simple_proc__processor_daemon_assign_stmt_1214_c_macro_ bit_vector_cast_to_bit_vector(0, &(reg_data_to_be_written), &(iretire_exec_result_memData));\
;

#define simple_proc__processor_daemon_call_stmt_1224_c_macro_ _simple_proc_accessReg_( &(reg_valid_read1),  &(reg_rs1_imm),  &(reg_valid_read2),  &(reg_rs2),  &(reg_valid_write),  &(iretire_rd),  &(reg_data_to_be_written), &(reg_d1), &(reg_d2));\
;

#define simple_proc__processor_daemon_assign_stmt_1227_c_macro_ bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs1_imm_1318_delayed_7_0), &(iretire_state_to_rs1_imm));\
;

#define simple_proc__processor_daemon_assign_stmt_1230_c_macro_ bit_vector_cast_to_bit_vector(0, &(reg_data_to_be_written_1319_delayed_7_0), &(reg_data_to_be_written));\
;

#define simple_proc__processor_daemon_assign_stmt_1236_c_macro_ __declare_static_bit_vector(MUX_1235,32);\
if (has_undefined_bit(&iretire_state_to_rs1_imm_1318_delayed_7_0)) {fprintf(stderr, "Error: variable iretire_state_to_rs1_imm_1318_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&iretire_state_to_rs1_imm_1318_delayed_7_0));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_rs1_imm_1318_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1235), &(reg_data_to_be_written_1319_delayed_7_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1235), &(reg_d1));\
}\
bit_vector_cast_to_bit_vector(0, &(final_rd1), &(MUX_1235));\
;

#define simple_proc__processor_daemon_assign_stmt_1239_c_macro_ bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs2_1324_delayed_7_0), &(iretire_state_to_rs2));\
;

#define simple_proc__processor_daemon_assign_stmt_1242_c_macro_ bit_vector_cast_to_bit_vector(0, &(reg_data_to_be_written_1325_delayed_7_0), &(reg_data_to_be_written));\
;

#define simple_proc__processor_daemon_assign_stmt_1248_c_macro_ __declare_static_bit_vector(MUX_1247,32);\
if (has_undefined_bit(&iretire_state_to_rs2_1324_delayed_7_0)) {fprintf(stderr, "Error: variable iretire_state_to_rs2_1324_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&iretire_state_to_rs2_1324_delayed_7_0));assert(0);} \
if(bit_vector_to_uint64(0, &iretire_state_to_rs2_1324_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1247), &(reg_data_to_be_written_1325_delayed_7_0));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1247), &(reg_d2));\
}\
bit_vector_cast_to_bit_vector(0, &(final_rd2), &(MUX_1247));\
;

#define simple_proc__processor_daemon_assign_stmt_1251_c_macro_ bit_vector_cast_to_bit_vector(0, &(flush_iexec_1330_delayed_7_0), &(flush_iexec));\
;

#define simple_proc__processor_daemon_assign_stmt_1260_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_1255,16);\
__declare_static_bit_vector(CONCAT_u8_u16_1258,16);\
__declare_static_bit_vector(CONCAT_u16_u32_1259,32);\
bit_vector_concatenate( &(reg_opcode), &(reg_rs1_imm), &(CONCAT_u8_u16_1255));\
bit_vector_concatenate( &(reg_rs2), &(reg_rd), &(CONCAT_u8_u16_1258));\
bit_vector_concatenate( &(CONCAT_u8_u16_1255), &(CONCAT_u8_u16_1258), &(CONCAT_u16_u32_1259));\
bit_vector_cast_to_bit_vector(0, &(CONCAT_u16_u32_1338_1338_delayed_7_0), &(CONCAT_u16_u32_1259));\
;

#define simple_proc__processor_daemon_assign_stmt_1263_c_macro_ bit_vector_cast_to_bit_vector(0, &(iregfile_pc_1342_delayed_7_0), &(iregfile_pc));\
;

#define simple_proc__processor_daemon_assign_stmt_1275_c_macro_ __declare_static_bit_vector(CONCAT_u32_u64_1270,64);\
__declare_static_bit_vector(CONCAT_u64_u74_1272,74);\
__declare_static_bit_vector(CONCAT_u32_u106_1273,106);\
__declare_static_bit_vector(MUX_1274,106);\
if (has_undefined_bit(&flush_iexec_1330_delayed_7_0)) {fprintf(stderr, "Error: variable flush_iexec_1330_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&flush_iexec_1330_delayed_7_0));assert(0);} \
bit_vector_concatenate( &(final_rd1), &(final_rd2), &(CONCAT_u32_u64_1270));\
bit_vector_concatenate( &(CONCAT_u32_u64_1270), &(iregfile_pc_1342_delayed_7_0), &(CONCAT_u64_u74_1272));\
bit_vector_concatenate( &(CONCAT_u16_u32_1338_1338_delayed_7_0), &(CONCAT_u64_u74_1272), &(CONCAT_u32_u106_1273));\
if(bit_vector_to_uint64(0, &flush_iexec_1330_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1274), &(zero_106));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1274), &(CONCAT_u32_u106_1273));\
}\
bit_vector_cast_to_bit_vector(0, &(n_iexec_state), &(MUX_1274));\
;

#define simple_proc__processor_daemon_assign_stmt_1280_c_macro_ __declare_static_bit_vector(EQ_u8_u1_1279,1);\
bit_vector_equal(0, &(dcache_opcode), &(LOAD), &(EQ_u8_u1_1279));\
bit_vector_cast_to_bit_vector(0, &(EQ_u8_u1_1350_1350_delayed_7_0), &(EQ_u8_u1_1279));\
;

#define simple_proc__processor_daemon_assign_stmt_1283_c_macro_ bit_vector_cast_to_bit_vector(0, &(dcache_exec_result_1352_delayed_7_0), &(dcache_exec_result));\
;

#define simple_proc__processor_daemon_assign_stmt_1289_c_macro_ __declare_static_bit_vector(MUX_1288,32);\
if (has_undefined_bit(&EQ_u8_u1_1350_1350_delayed_7_0)) {fprintf(stderr, "Error: variable EQ_u8_u1_1350_1350_delayed_7_0 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_1350_1350_delayed_7_0));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_1350_1350_delayed_7_0)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1288), &(memReadData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1288), &(dcache_exec_result_1352_delayed_7_0));\
}\
bit_vector_cast_to_bit_vector(0, &(dcache_data_to_be_written_to_reg), &(MUX_1288));\
;

#define simple_proc__processor_daemon_assign_stmt_1300_c_macro_ __declare_static_bit_vector(CONCAT_u8_u16_1293,16);\
__declare_static_bit_vector(CONCAT_u16_u24_1295,24);\
__declare_static_bit_vector(CONCAT_u8_u40_1298,40);\
__declare_static_bit_vector(CONCAT_u24_u64_1299,64);\
bit_vector_concatenate( &(dcache_opcode), &(dcache_rs1_imm), &(CONCAT_u8_u16_1293));\
bit_vector_concatenate( &(CONCAT_u8_u16_1293), &(dcache_rs2), &(CONCAT_u16_u24_1295));\
bit_vector_concatenate( &(dcache_rd), &(dcache_rd1), &(CONCAT_u8_u40_1298));\
bit_vector_concatenate( &(CONCAT_u16_u24_1295), &(CONCAT_u8_u40_1298), &(CONCAT_u24_u64_1299));\
bit_vector_cast_to_bit_vector(0, &(CONCAT_u24_u64_1364_1364_delayed_7_0), &(CONCAT_u24_u64_1299));\
;

#define simple_proc__processor_daemon_assign_stmt_1303_c_macro_ bit_vector_cast_to_bit_vector(0, &(dcache_rd2_1365_delayed_7_0), &(dcache_rd2));\
;

#define simple_proc__processor_daemon_assign_stmt_1308_c_macro_ __declare_static_bit_vector(CONCAT_u1_u11_1307,11);\
bit_vector_concatenate( &(dcache_isBranch), &(dcache_pc), &(CONCAT_u1_u11_1307));\
bit_vector_cast_to_bit_vector(0, &(CONCAT_u1_u11_1370_1370_delayed_7_0), &(CONCAT_u1_u11_1307));\
;

#define simple_proc__processor_daemon_assign_stmt_1317_c_macro_ __declare_static_bit_vector(CONCAT_u32_u64_1313,64);\
__declare_static_bit_vector(CONCAT_u64_u75_1315,75);\
__declare_static_bit_vector(CONCAT_u64_u139_1316,139);\
bit_vector_concatenate( &(dcache_rd2_1365_delayed_7_0), &(dcache_data_to_be_written_to_reg), &(CONCAT_u32_u64_1313));\
bit_vector_concatenate( &(CONCAT_u32_u64_1313), &(CONCAT_u1_u11_1370_1370_delayed_7_0), &(CONCAT_u64_u75_1315));\
bit_vector_concatenate( &(CONCAT_u24_u64_1364_1364_delayed_7_0), &(CONCAT_u64_u75_1315), &(CONCAT_u64_u139_1316));\
bit_vector_cast_to_bit_vector(0, &(n_iRetire_state), &(CONCAT_u64_u139_1316));\
;

#define simple_proc__processor_daemon_assign_stmt_1325_c_macro_ __declare_static_bit_vector(EQ_u8_u1_1321,1);\
__declare_static_bit_vector(MUX_1324,32);\
bit_vector_equal(0, &(dcache_rs2), &(iretire_rd), &(EQ_u8_u1_1321));\
if (has_undefined_bit(&EQ_u8_u1_1321)) {fprintf(stderr, "Error: variable EQ_u8_u1_1321 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_1321));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_1321)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1324), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1324), &(dcache_rd2));\
}\
bit_vector_cast_to_bit_vector(0, &(iretire_to_dcache_addr_32), &(MUX_1324));\
;

#define simple_proc__processor_daemon_assign_stmt_1338_c_macro_ __declare_static_bit_vector(EQ_u8_u1_1329,1);\
__declare_static_bit_vector(EQ_u8_u1_1333,1);\
__declare_static_bit_vector(MUX_1336,32);\
__declare_static_bit_vector(MUX_1337,32);\
bit_vector_equal(0, &(dcache_rd), &(iexec_rs1_imm), &(EQ_u8_u1_1329));\
if (has_undefined_bit(&EQ_u8_u1_1329)) {fprintf(stderr, "Error: variable EQ_u8_u1_1329 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_1329));assert(0);} \
bit_vector_equal(0, &(iretire_rd), &(iexec_rs1_imm), &(EQ_u8_u1_1333));\
if (has_undefined_bit(&EQ_u8_u1_1333)) {fprintf(stderr, "Error: variable EQ_u8_u1_1333 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_1333));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_1333)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1336), &(iretire_exec_result_memData));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1336), &(iexec_rd1));\
}\
if(bit_vector_to_uint64(0, &EQ_u8_u1_1329)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1337), &(dcache_exec_result));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1337), &(MUX_1336));\
}\
bit_vector_cast_to_bit_vector(0, &(dcache_to_ex_addr_32), &(MUX_1337));\
;

#define simple_proc__processor_daemon_assign_stmt_1354_c_macro_ __declare_static_bit_vector(type_cast_1346,32);\
__declare_static_bit_vector(konst_1348,10);\
bit_vector_clear(&konst_1348);\
konst_1348.val.byte_array[0] = 1;\
__declare_static_bit_vector(ADD_u10_u10_1349,10);\
__declare_static_bit_vector(type_cast_1350,32);\
__declare_static_bit_vector(MUX_1351,32);\
__declare_static_bit_vector(MUX_1352,32);\
__declare_static_bit_vector(MUX_1353,32);\
if (has_undefined_bit(&is_Branch_Hazard)) {fprintf(stderr, "Error: variable is_Branch_Hazard has undefined value (%s) at test point.\n", to_string(&is_Branch_Hazard));assert(0);} \
if (has_undefined_bit(&ex_Unconditional_JUMP)) {fprintf(stderr, "Error: variable ex_Unconditional_JUMP has undefined value (%s) at test point.\n", to_string(&ex_Unconditional_JUMP));assert(0);} \
if (has_undefined_bit(&stall_first_4)) {fprintf(stderr, "Error: variable stall_first_4 has undefined value (%s) at test point.\n", to_string(&stall_first_4));assert(0);} \
bit_vector_bitcast_to_bit_vector( &(type_cast_1346), &(ifetch_state));\
bit_vector_clear(&konst_1348);\
konst_1348.val.byte_array[0] = 1;\
bit_vector_plus( &(ifetch_state), &(konst_1348), &(ADD_u10_u10_1349));\
bit_vector_bitcast_to_bit_vector( &(type_cast_1350), &(ADD_u10_u10_1349));\
if(bit_vector_to_uint64(0, &stall_first_4)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1351), &(type_cast_1346));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1351), &(type_cast_1350));\
}\
if(bit_vector_to_uint64(0, &ex_Unconditional_JUMP)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1352), &(dcache_to_ex_addr_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1352), &(MUX_1351));\
}\
if(bit_vector_to_uint64(0, &is_Branch_Hazard)){\
bit_vector_cast_to_bit_vector(0, &(MUX_1353), &(iretire_to_dcache_addr_32));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_1353), &(MUX_1352));\
}\
bit_vector_cast_to_bit_vector(0, &(next_ifetch_state_32), &(MUX_1353));\
;

#define simple_proc__processor_daemon_assign_stmt_1358_c_macro_ __declare_static_bit_vector(slice_1357,10);\
bit_vector_slice(&(next_ifetch_state_32), &(slice_1357), 0);\
bit_vector_cast_to_bit_vector(0, &(next_ifetch_state), &(slice_1357));\
;

#define simple_proc__processor_daemon_stmt_1369_c_macro_ uint32_t simple_proc__processor_daemon_stmt_1369_c_macro___print_counter= get_file_print_lock(simple_proc___report_log_file__);if(simple_proc___report_log_file__ != NULL) fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t%s\n",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"processor");if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"ifetch_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(ifetch_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"icache_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(icache_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"idecode_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(idecode_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"iregfile_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(iregfile_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"iexec_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(iexec_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"dcache_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(dcache_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"iretire_state");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(iretire_state)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"reg_data_to_be_written");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(reg_data_to_be_written)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"iretire_opcode");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(iretire_opcode)));}if(simple_proc___report_log_file__ != NULL) {fprintf(simple_proc___report_log_file__,"[%u]processor_daemon>\t\t%s\t\t",simple_proc__processor_daemon_stmt_1369_c_macro___print_counter,"icache_instruction");fprintf(simple_proc___report_log_file__, ":= 0x%s\n",to_hex_string(&(icache_instruction)));}release_file_print_lock(simple_proc___report_log_file__);;

#define simple_proc__processor_daemon_assign_stmt_1372_c_macro_ write_bit_vector_to_pipe("processor_result",&(reg_data_to_be_written));\
;
;

#define simple_proc__processor_daemon_branch_block_stmt_930_c_export_apply_macro_ ;
;

#define simple_proc__processor_daemon_branch_block_stmt_921_c_export_apply_macro_ ;

#define simple_proc__processor_daemon_inner_outarg_prep_macro__ ;

#define simple_proc__processor_daemon_outer_arg_decl_macro__ ;

#define simple_proc__processor_daemon_outer_op_xfer_macro__ ;

#define simple_proc__regAccessDaemon_inner_inarg_prep_macro__ 
#define simple_proc__regAccessDaemon_branch_block_stmt_1384_c_export_decl_macro_ __declare_static_bit_vector(cmd_1,64);\
__declare_static_bit_vector(valid_1,1);\
__declare_static_bit_vector(addr1,8);\
__declare_static_bit_vector(valid_2,1);\
__declare_static_bit_vector(addr2,8);\
__declare_static_bit_vector(valid_w,1);\
__declare_static_bit_vector(addr_w,8);\
__declare_static_bit_vector(data_to_be_written,32);\
__declare_static_bit_vector(rdata1,32);\
__declare_static_bit_vector(rdata2,32);\


#define simple_proc__regAccessDaemon_merge_stmt_1386_c_preamble_macro_ uint8_t merge_stmt_1386_entry_flag;\
merge_stmt_1386_entry_flag = do_while_entry_flag;\
goto merge_stmt_1386_run;\
merge_stmt_1386_run: ;\
;

#define simple_proc__regAccessDaemon_merge_stmt_1386_c_postamble_macro_ merge_stmt_1386_entry_flag = 0;

#define simple_proc__regAccessDaemon_assign_stmt_1389_c_macro_ __declare_static_bit_vector(RPIPE_accessReg_request_1388,64);\
read_bit_vector_from_pipe("accessReg_request",&(RPIPE_accessReg_request_1388));\
bit_vector_cast_to_bit_vector(0, &(cmd_1), &(RPIPE_accessReg_request_1388));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1393_c_macro_ __declare_static_bit_vector(slice_1392,1);\
bit_vector_slice(&(cmd_1), &(slice_1392), 63);\
bit_vector_cast_to_bit_vector(0, &(valid_1), &(slice_1392));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1397_c_macro_ __declare_static_bit_vector(slice_1396,8);\
bit_vector_slice(&(cmd_1), &(slice_1396), 55);\
bit_vector_cast_to_bit_vector(0, &(addr1), &(slice_1396));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1401_c_macro_ __declare_static_bit_vector(slice_1400,1);\
bit_vector_slice(&(cmd_1), &(slice_1400), 54);\
bit_vector_cast_to_bit_vector(0, &(valid_2), &(slice_1400));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1405_c_macro_ __declare_static_bit_vector(slice_1404,8);\
bit_vector_slice(&(cmd_1), &(slice_1404), 46);\
bit_vector_cast_to_bit_vector(0, &(addr2), &(slice_1404));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1409_c_macro_ __declare_static_bit_vector(slice_1408,1);\
bit_vector_slice(&(cmd_1), &(slice_1408), 40);\
bit_vector_cast_to_bit_vector(0, &(valid_w), &(slice_1408));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1413_c_macro_ __declare_static_bit_vector(slice_1412,8);\
bit_vector_slice(&(cmd_1), &(slice_1412), 32);\
bit_vector_cast_to_bit_vector(0, &(addr_w), &(slice_1412));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1417_c_macro_ __declare_static_bit_vector(slice_1416,32);\
bit_vector_slice(&(cmd_1), &(slice_1416), 0);\
bit_vector_cast_to_bit_vector(0, &(data_to_be_written), &(slice_1416));\
;

#define simple_proc__regAccessDaemon_call_stmt_1427_c_macro_ _simple_proc_accessReg_( &(valid_1),  &(addr1),  &(valid_2),  &(addr2),  &(valid_w),  &(addr_w),  &(data_to_be_written), &(rdata1), &(rdata2));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1430_c_macro_ write_bit_vector_to_pipe("accessReg_response1",&(rdata1));\
;

#define simple_proc__regAccessDaemon_assign_stmt_1433_c_macro_ write_bit_vector_to_pipe("accessReg_response2",&(rdata2));\
;
;

#define simple_proc__regAccessDaemon_branch_block_stmt_1384_c_export_apply_macro_ ;

#define simple_proc__regAccessDaemon_inner_outarg_prep_macro__ ;

#define simple_proc__regAccessDaemon_outer_arg_decl_macro__ ;

#define simple_proc__regAccessDaemon_outer_op_xfer_macro__ ;

#define simple_proc__scoreBoard_inner_inarg_prep_macro__ __declare_static_bit_vector(ifetch_state,10);\
bit_vector_cast_to_bit_vector(0, &(ifetch_state), &((*__pifetch_state)));\
__declare_static_bit_vector(icache_state,10);\
bit_vector_cast_to_bit_vector(0, &(icache_state), &((*__picache_state)));\
__declare_static_bit_vector(idecode_state,42);\
bit_vector_cast_to_bit_vector(0, &(idecode_state), &((*__pidecode_state)));\
__declare_static_bit_vector(iregfile_state,42);\
bit_vector_cast_to_bit_vector(0, &(iregfile_state), &((*__piregfile_state)));\
__declare_static_bit_vector(iexec_state,106);\
bit_vector_cast_to_bit_vector(0, &(iexec_state), &((*__piexec_state)));\
__declare_static_bit_vector(dcache_state,139);\
bit_vector_cast_to_bit_vector(0, &(dcache_state), &((*__pdcache_state)));\
__declare_static_bit_vector(iretire_state,139);\
bit_vector_cast_to_bit_vector(0, &(iretire_state), &((*__piretire_state)));\
__declare_static_bit_vector(ifetch_actions,10);\
__declare_static_bit_vector(icache_actions,10);\
__declare_static_bit_vector(idecode_actions,42);\
__declare_static_bit_vector(iregfile_actions,5);\
__declare_static_bit_vector(iexec_actions,4);\
__declare_static_bit_vector(dcache_actions,3);\
__declare_static_bit_vector(ex_Unconditional_JUMP,1);\
__declare_static_bit_vector(is_Branch_Hazard,1);\
__declare_static_bit_vector(flush_ifetch,1);\
__declare_static_bit_vector(flush_icache,1);\
__declare_static_bit_vector(flush_idecode,1);\
__declare_static_bit_vector(flush_reg,1);\
__declare_static_bit_vector(flush_iexec,1);\
__declare_static_bit_vector(flush_dcache,1);\
__declare_static_bit_vector(stall_first_4,1);\
__declare_static_bit_vector(is_Branch,1);\
__declare_static_bit_vector(ex_opcode,8);\
__declare_static_bit_vector(ex_rs1_imm,8);\
__declare_static_bit_vector(ex_rs2,8);\
__declare_static_bit_vector(ex_rd,8);\
__declare_static_bit_vector(dcache_opcode,8);\
__declare_static_bit_vector(dcache_rs1_imm,8);\
__declare_static_bit_vector(dcache_rs2,8);\
__declare_static_bit_vector(dcache_rd,8);\
__declare_static_bit_vector(dcache_state_reg_write,1);\
__declare_static_bit_vector(dcache_to_ex_rs1_imm,1);\
__declare_static_bit_vector(dcache_to_ex_rs2,1);\
__declare_static_bit_vector(iretire_opcode,8);\
__declare_static_bit_vector(iretire_rs1_imm,8);\
__declare_static_bit_vector(iretire_rd,8);\
__declare_static_bit_vector(iretire_state_reg_write,1);\
__declare_static_bit_vector(iretire_state_to_ex_rs1_imm,1);\
__declare_static_bit_vector(iretire_state_to_ex_rs2,1);\
__declare_static_bit_vector(iretire_state_to_dcache_addr,1);\
__declare_static_bit_vector(iretire_state_to_dcache_memData,1);\
__declare_static_bit_vector(iregfile_opcode,8);\
__declare_static_bit_vector(iregfile_rs1_imm,8);\
__declare_static_bit_vector(iregfile_rs2,8);\
__declare_static_bit_vector(iretire_state_to_rs1_imm,1);\
__declare_static_bit_vector(iretire_state_to_rs2,1);\
__declare_static_bit_vector(iregfile_state_opcode,8);\
__declare_static_bit_vector(reg_valid_read1,1);\
__declare_static_bit_vector(reg_valid_read2,1);\
__declare_static_bit_vector(reg_valid_write,1);\
__declare_static_bit_vector(memWrite,1);\

#define simple_proc__scoreBoard_assign_stmt_538_c_macro_ __declare_static_bit_vector(slice_537,1);\
bit_vector_slice(&(dcache_state), &(slice_537), 10);\
bit_vector_cast_to_bit_vector(0, &(is_Branch), &(slice_537));\
;

#define simple_proc__scoreBoard_assign_stmt_542_c_macro_ __declare_static_bit_vector(slice_541,8);\
bit_vector_slice(&(iexec_state), &(slice_541), 98);\
bit_vector_cast_to_bit_vector(0, &(ex_opcode), &(slice_541));\
;

#define simple_proc__scoreBoard_assign_stmt_546_c_macro_ __declare_static_bit_vector(slice_545,8);\
bit_vector_slice(&(iexec_state), &(slice_545), 90);\
bit_vector_cast_to_bit_vector(0, &(ex_rs1_imm), &(slice_545));\
;

#define simple_proc__scoreBoard_assign_stmt_550_c_macro_ __declare_static_bit_vector(slice_549,8);\
bit_vector_slice(&(iexec_state), &(slice_549), 82);\
bit_vector_cast_to_bit_vector(0, &(ex_rs2), &(slice_549));\
;

#define simple_proc__scoreBoard_assign_stmt_554_c_macro_ __declare_static_bit_vector(slice_553,8);\
bit_vector_slice(&(iexec_state), &(slice_553), 74);\
bit_vector_cast_to_bit_vector(0, &(ex_rd), &(slice_553));\
;

#define simple_proc__scoreBoard_assign_stmt_563_c_macro_ __declare_static_bit_vector(EQ_u8_u1_558,1);\
__declare_static_bit_vector(EQ_u8_u1_561,1);\
__declare_static_bit_vector(OR_u1_u1_562,1);\
bit_vector_equal(0, &(ex_opcode), &(CALL), &(EQ_u8_u1_558));\
bit_vector_equal(0, &(ex_opcode), &(JMP), &(EQ_u8_u1_561));\
bit_vector_or(&(EQ_u8_u1_558), &(EQ_u8_u1_561), &(OR_u1_u1_562));\
bit_vector_cast_to_bit_vector(0, &(ex_Unconditional_JUMP), &(OR_u1_u1_562));\
;

#define simple_proc__scoreBoard_assign_stmt_566_c_macro_ bit_vector_cast_to_bit_vector(0, &(is_Branch_Hazard), &(is_Branch));\
;

#define simple_proc__scoreBoard_assign_stmt_570_c_macro_ __declare_static_bit_vector(slice_569,8);\
bit_vector_slice(&(dcache_state), &(slice_569), 131);\
bit_vector_cast_to_bit_vector(0, &(dcache_opcode), &(slice_569));\
;

#define simple_proc__scoreBoard_assign_stmt_574_c_macro_ __declare_static_bit_vector(slice_573,8);\
bit_vector_slice(&(dcache_state), &(slice_573), 123);\
bit_vector_cast_to_bit_vector(0, &(dcache_rs1_imm), &(slice_573));\
;

#define simple_proc__scoreBoard_assign_stmt_578_c_macro_ __declare_static_bit_vector(slice_577,8);\
bit_vector_slice(&(dcache_state), &(slice_577), 115);\
bit_vector_cast_to_bit_vector(0, &(dcache_rs2), &(slice_577));\
;

#define simple_proc__scoreBoard_assign_stmt_582_c_macro_ __declare_static_bit_vector(slice_581,8);\
bit_vector_slice(&(dcache_state), &(slice_581), 107);\
bit_vector_cast_to_bit_vector(0, &(dcache_rd), &(slice_581));\
;

#define simple_proc__scoreBoard_assign_stmt_631_c_macro_ __declare_static_bit_vector(EQ_u8_u1_586,1);\
__declare_static_bit_vector(EQ_u8_u1_589,1);\
__declare_static_bit_vector(OR_u1_u1_590,1);\
__declare_static_bit_vector(EQ_u8_u1_593,1);\
__declare_static_bit_vector(OR_u1_u1_594,1);\
__declare_static_bit_vector(EQ_u8_u1_597,1);\
__declare_static_bit_vector(EQ_u8_u1_600,1);\
__declare_static_bit_vector(OR_u1_u1_601,1);\
__declare_static_bit_vector(EQ_u8_u1_604,1);\
__declare_static_bit_vector(OR_u1_u1_605,1);\
__declare_static_bit_vector(OR_u1_u1_606,1);\
__declare_static_bit_vector(EQ_u8_u1_609,1);\
__declare_static_bit_vector(EQ_u8_u1_612,1);\
__declare_static_bit_vector(OR_u1_u1_613,1);\
__declare_static_bit_vector(EQ_u8_u1_616,1);\
__declare_static_bit_vector(OR_u1_u1_617,1);\
__declare_static_bit_vector(EQ_u8_u1_620,1);\
__declare_static_bit_vector(EQ_u8_u1_623,1);\
__declare_static_bit_vector(OR_u1_u1_624,1);\
__declare_static_bit_vector(EQ_u8_u1_627,1);\
__declare_static_bit_vector(OR_u1_u1_628,1);\
__declare_static_bit_vector(OR_u1_u1_629,1);\
__declare_static_bit_vector(OR_u1_u1_630,1);\
bit_vector_equal(0, &(dcache_opcode), &(SBIR), &(EQ_u8_u1_586));\
bit_vector_equal(0, &(dcache_opcode), &(LOAD), &(EQ_u8_u1_589));\
bit_vector_or(&(EQ_u8_u1_586), &(EQ_u8_u1_589), &(OR_u1_u1_590));\
bit_vector_equal(0, &(dcache_opcode), &(L_AND), &(EQ_u8_u1_593));\
bit_vector_or(&(OR_u1_u1_590), &(EQ_u8_u1_593), &(OR_u1_u1_594));\
bit_vector_equal(0, &(dcache_opcode), &(L_OR), &(EQ_u8_u1_597));\
bit_vector_equal(0, &(dcache_opcode), &(L_XNOR), &(EQ_u8_u1_600));\
bit_vector_or(&(EQ_u8_u1_597), &(EQ_u8_u1_600), &(OR_u1_u1_601));\
bit_vector_equal(0, &(dcache_opcode), &(ADD), &(EQ_u8_u1_604));\
bit_vector_or(&(OR_u1_u1_601), &(EQ_u8_u1_604), &(OR_u1_u1_605));\
bit_vector_or(&(OR_u1_u1_594), &(OR_u1_u1_605), &(OR_u1_u1_606));\
bit_vector_equal(0, &(dcache_opcode), &(SUB), &(EQ_u8_u1_609));\
bit_vector_equal(0, &(dcache_opcode), &(L_SLL), &(EQ_u8_u1_612));\
bit_vector_or(&(EQ_u8_u1_609), &(EQ_u8_u1_612), &(OR_u1_u1_613));\
bit_vector_equal(0, &(dcache_opcode), &(L_SRL), &(EQ_u8_u1_616));\
bit_vector_or(&(OR_u1_u1_613), &(EQ_u8_u1_616), &(OR_u1_u1_617));\
bit_vector_equal(0, &(dcache_opcode), &(L_SRA), &(EQ_u8_u1_620));\
bit_vector_equal(0, &(dcache_opcode), &(CALL), &(EQ_u8_u1_623));\
bit_vector_or(&(EQ_u8_u1_620), &(EQ_u8_u1_623), &(OR_u1_u1_624));\
bit_vector_equal(0, &(dcache_opcode), &(CMP), &(EQ_u8_u1_627));\
bit_vector_or(&(OR_u1_u1_624), &(EQ_u8_u1_627), &(OR_u1_u1_628));\
bit_vector_or(&(OR_u1_u1_617), &(OR_u1_u1_628), &(OR_u1_u1_629));\
bit_vector_or(&(OR_u1_u1_606), &(OR_u1_u1_629), &(OR_u1_u1_630));\
bit_vector_cast_to_bit_vector(0, &(dcache_state_reg_write), &(OR_u1_u1_630));\
;

#define simple_proc__scoreBoard_assign_stmt_640_c_macro_ __declare_static_bit_vector(EQ_u1_u1_635,1);\
__declare_static_bit_vector(EQ_u8_u1_638,1);\
__declare_static_bit_vector(AND_u1_u1_639,1);\
bit_vector_equal(0, &(dcache_state_reg_write), &(one_1), &(EQ_u1_u1_635));\
bit_vector_equal(0, &(dcache_rd), &(ex_rs1_imm), &(EQ_u8_u1_638));\
bit_vector_and(&(EQ_u1_u1_635), &(EQ_u8_u1_638), &(AND_u1_u1_639));\
bit_vector_cast_to_bit_vector(0, &(dcache_to_ex_rs1_imm), &(AND_u1_u1_639));\
;

#define simple_proc__scoreBoard_assign_stmt_649_c_macro_ __declare_static_bit_vector(EQ_u1_u1_644,1);\
__declare_static_bit_vector(EQ_u8_u1_647,1);\
__declare_static_bit_vector(AND_u1_u1_648,1);\
bit_vector_equal(0, &(dcache_state_reg_write), &(one_1), &(EQ_u1_u1_644));\
bit_vector_equal(0, &(dcache_rd), &(ex_rs2), &(EQ_u8_u1_647));\
bit_vector_and(&(EQ_u1_u1_644), &(EQ_u8_u1_647), &(AND_u1_u1_648));\
bit_vector_cast_to_bit_vector(0, &(dcache_to_ex_rs2), &(AND_u1_u1_648));\
;

#define simple_proc__scoreBoard_assign_stmt_653_c_macro_ __declare_static_bit_vector(slice_652,8);\
bit_vector_slice(&(iretire_state), &(slice_652), 131);\
bit_vector_cast_to_bit_vector(0, &(iretire_opcode), &(slice_652));\
;

#define simple_proc__scoreBoard_assign_stmt_657_c_macro_ __declare_static_bit_vector(slice_656,8);\
bit_vector_slice(&(iretire_state), &(slice_656), 123);\
bit_vector_cast_to_bit_vector(0, &(iretire_rs1_imm), &(slice_656));\
;

#define simple_proc__scoreBoard_assign_stmt_661_c_macro_ __declare_static_bit_vector(slice_660,8);\
bit_vector_slice(&(iretire_state), &(slice_660), 107);\
bit_vector_cast_to_bit_vector(0, &(iretire_rd), &(slice_660));\
;

#define simple_proc__scoreBoard_assign_stmt_710_c_macro_ __declare_static_bit_vector(EQ_u8_u1_665,1);\
__declare_static_bit_vector(EQ_u8_u1_668,1);\
__declare_static_bit_vector(OR_u1_u1_669,1);\
__declare_static_bit_vector(EQ_u8_u1_672,1);\
__declare_static_bit_vector(OR_u1_u1_673,1);\
__declare_static_bit_vector(EQ_u8_u1_676,1);\
__declare_static_bit_vector(EQ_u8_u1_679,1);\
__declare_static_bit_vector(OR_u1_u1_680,1);\
__declare_static_bit_vector(EQ_u8_u1_683,1);\
__declare_static_bit_vector(OR_u1_u1_684,1);\
__declare_static_bit_vector(OR_u1_u1_685,1);\
__declare_static_bit_vector(EQ_u8_u1_688,1);\
__declare_static_bit_vector(EQ_u8_u1_691,1);\
__declare_static_bit_vector(OR_u1_u1_692,1);\
__declare_static_bit_vector(EQ_u8_u1_695,1);\
__declare_static_bit_vector(OR_u1_u1_696,1);\
__declare_static_bit_vector(EQ_u8_u1_699,1);\
__declare_static_bit_vector(EQ_u8_u1_702,1);\
__declare_static_bit_vector(OR_u1_u1_703,1);\
__declare_static_bit_vector(EQ_u8_u1_706,1);\
__declare_static_bit_vector(OR_u1_u1_707,1);\
__declare_static_bit_vector(OR_u1_u1_708,1);\
__declare_static_bit_vector(OR_u1_u1_709,1);\
bit_vector_equal(0, &(iretire_opcode), &(SBIR), &(EQ_u8_u1_665));\
bit_vector_equal(0, &(iretire_opcode), &(LOAD), &(EQ_u8_u1_668));\
bit_vector_or(&(EQ_u8_u1_665), &(EQ_u8_u1_668), &(OR_u1_u1_669));\
bit_vector_equal(0, &(iretire_opcode), &(L_AND), &(EQ_u8_u1_672));\
bit_vector_or(&(OR_u1_u1_669), &(EQ_u8_u1_672), &(OR_u1_u1_673));\
bit_vector_equal(0, &(iretire_opcode), &(L_OR), &(EQ_u8_u1_676));\
bit_vector_equal(0, &(iretire_opcode), &(L_XNOR), &(EQ_u8_u1_679));\
bit_vector_or(&(EQ_u8_u1_676), &(EQ_u8_u1_679), &(OR_u1_u1_680));\
bit_vector_equal(0, &(iretire_opcode), &(ADD), &(EQ_u8_u1_683));\
bit_vector_or(&(OR_u1_u1_680), &(EQ_u8_u1_683), &(OR_u1_u1_684));\
bit_vector_or(&(OR_u1_u1_673), &(OR_u1_u1_684), &(OR_u1_u1_685));\
bit_vector_equal(0, &(iretire_opcode), &(SUB), &(EQ_u8_u1_688));\
bit_vector_equal(0, &(iretire_opcode), &(L_SLL), &(EQ_u8_u1_691));\
bit_vector_or(&(EQ_u8_u1_688), &(EQ_u8_u1_691), &(OR_u1_u1_692));\
bit_vector_equal(0, &(iretire_opcode), &(L_SRL), &(EQ_u8_u1_695));\
bit_vector_or(&(OR_u1_u1_692), &(EQ_u8_u1_695), &(OR_u1_u1_696));\
bit_vector_equal(0, &(iretire_opcode), &(L_SRA), &(EQ_u8_u1_699));\
bit_vector_equal(0, &(iretire_opcode), &(CALL), &(EQ_u8_u1_702));\
bit_vector_or(&(EQ_u8_u1_699), &(EQ_u8_u1_702), &(OR_u1_u1_703));\
bit_vector_equal(0, &(iretire_opcode), &(CMP), &(EQ_u8_u1_706));\
bit_vector_or(&(OR_u1_u1_703), &(EQ_u8_u1_706), &(OR_u1_u1_707));\
bit_vector_or(&(OR_u1_u1_696), &(OR_u1_u1_707), &(OR_u1_u1_708));\
bit_vector_or(&(OR_u1_u1_685), &(OR_u1_u1_708), &(OR_u1_u1_709));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_reg_write), &(OR_u1_u1_709));\
;

#define simple_proc__scoreBoard_assign_stmt_719_c_macro_ __declare_static_bit_vector(EQ_u1_u1_714,1);\
__declare_static_bit_vector(EQ_u8_u1_717,1);\
__declare_static_bit_vector(AND_u1_u1_718,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_714));\
bit_vector_equal(0, &(iretire_rd), &(ex_rs1_imm), &(EQ_u8_u1_717));\
bit_vector_and(&(EQ_u1_u1_714), &(EQ_u8_u1_717), &(AND_u1_u1_718));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_ex_rs1_imm), &(AND_u1_u1_718));\
;

#define simple_proc__scoreBoard_assign_stmt_728_c_macro_ __declare_static_bit_vector(EQ_u1_u1_723,1);\
__declare_static_bit_vector(EQ_u8_u1_726,1);\
__declare_static_bit_vector(AND_u1_u1_727,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_723));\
bit_vector_equal(0, &(iretire_rd), &(ex_rs2), &(EQ_u8_u1_726));\
bit_vector_and(&(EQ_u1_u1_723), &(EQ_u8_u1_726), &(AND_u1_u1_727));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_ex_rs2), &(AND_u1_u1_727));\
;

#define simple_proc__scoreBoard_assign_stmt_737_c_macro_ __declare_static_bit_vector(EQ_u1_u1_732,1);\
__declare_static_bit_vector(EQ_u8_u1_735,1);\
__declare_static_bit_vector(AND_u1_u1_736,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_732));\
bit_vector_equal(0, &(dcache_rs1_imm), &(iretire_rd), &(EQ_u8_u1_735));\
bit_vector_and(&(EQ_u1_u1_732), &(EQ_u8_u1_735), &(AND_u1_u1_736));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_dcache_addr), &(AND_u1_u1_736));\
;

#define simple_proc__scoreBoard_assign_stmt_746_c_macro_ __declare_static_bit_vector(EQ_u1_u1_741,1);\
__declare_static_bit_vector(EQ_u8_u1_744,1);\
__declare_static_bit_vector(AND_u1_u1_745,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_741));\
bit_vector_equal(0, &(dcache_rs2), &(iretire_rd), &(EQ_u8_u1_744));\
bit_vector_and(&(EQ_u1_u1_741), &(EQ_u8_u1_744), &(AND_u1_u1_745));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_dcache_memData), &(AND_u1_u1_745));\
;

#define simple_proc__scoreBoard_assign_stmt_750_c_macro_ __declare_static_bit_vector(slice_749,8);\
bit_vector_slice(&(iregfile_state), &(slice_749), 34);\
bit_vector_cast_to_bit_vector(0, &(iregfile_opcode), &(slice_749));\
;

#define simple_proc__scoreBoard_assign_stmt_754_c_macro_ __declare_static_bit_vector(slice_753,8);\
bit_vector_slice(&(iregfile_state), &(slice_753), 26);\
bit_vector_cast_to_bit_vector(0, &(iregfile_rs1_imm), &(slice_753));\
;

#define simple_proc__scoreBoard_assign_stmt_758_c_macro_ __declare_static_bit_vector(slice_757,8);\
bit_vector_slice(&(iregfile_state), &(slice_757), 18);\
bit_vector_cast_to_bit_vector(0, &(iregfile_rs2), &(slice_757));\
;

#define simple_proc__scoreBoard_assign_stmt_767_c_macro_ __declare_static_bit_vector(EQ_u1_u1_762,1);\
__declare_static_bit_vector(EQ_u8_u1_765,1);\
__declare_static_bit_vector(AND_u1_u1_766,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_762));\
bit_vector_equal(0, &(iretire_rd), &(iregfile_rs1_imm), &(EQ_u8_u1_765));\
bit_vector_and(&(EQ_u1_u1_762), &(EQ_u8_u1_765), &(AND_u1_u1_766));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs1_imm), &(AND_u1_u1_766));\
;

#define simple_proc__scoreBoard_assign_stmt_776_c_macro_ __declare_static_bit_vector(EQ_u1_u1_771,1);\
__declare_static_bit_vector(EQ_u8_u1_774,1);\
__declare_static_bit_vector(AND_u1_u1_775,1);\
bit_vector_equal(0, &(iretire_state_reg_write), &(one_1), &(EQ_u1_u1_771));\
bit_vector_equal(0, &(iretire_rd), &(iregfile_rs2), &(EQ_u8_u1_774));\
bit_vector_and(&(EQ_u1_u1_771), &(EQ_u8_u1_774), &(AND_u1_u1_775));\
bit_vector_cast_to_bit_vector(0, &(iretire_state_to_rs2), &(AND_u1_u1_775));\
;

#define simple_proc__scoreBoard_assign_stmt_799_c_macro_ __declare_static_bit_vector(EQ_u8_u1_780,1);\
__declare_static_bit_vector(EQ_u8_u1_783,1);\
__declare_static_bit_vector(NOT_u1_u1_784,1);\
__declare_static_bit_vector(AND_u1_u1_785,1);\
__declare_static_bit_vector(EQ_u8_u1_788,1);\
__declare_static_bit_vector(NOT_u1_u1_789,1);\
__declare_static_bit_vector(EQ_u8_u1_792,1);\
__declare_static_bit_vector(EQ_u8_u1_795,1);\
__declare_static_bit_vector(OR_u1_u1_796,1);\
__declare_static_bit_vector(AND_u1_u1_797,1);\
__declare_static_bit_vector(AND_u1_u1_798,1);\
bit_vector_equal(0, &(ex_opcode), &(LOAD), &(EQ_u8_u1_780));\
bit_vector_equal(0, &(iregfile_opcode), &(zero_8), &(EQ_u8_u1_783));\
bit_vector_not( &(EQ_u8_u1_783), &(NOT_u1_u1_784));\
bit_vector_and(&(EQ_u8_u1_780), &(NOT_u1_u1_784), &(AND_u1_u1_785));\
bit_vector_equal(0, &(iregfile_opcode), &(STORE), &(EQ_u8_u1_788));\
bit_vector_not( &(EQ_u8_u1_788), &(NOT_u1_u1_789));\
bit_vector_equal(0, &(iretire_rs1_imm), &(ex_rd), &(EQ_u8_u1_792));\
bit_vector_equal(0, &(iregfile_rs2), &(ex_rd), &(EQ_u8_u1_795));\
bit_vector_or(&(EQ_u8_u1_792), &(EQ_u8_u1_795), &(OR_u1_u1_796));\
bit_vector_and(&(NOT_u1_u1_789), &(OR_u1_u1_796), &(AND_u1_u1_797));\
bit_vector_and(&(AND_u1_u1_785), &(AND_u1_u1_797), &(AND_u1_u1_798));\
bit_vector_cast_to_bit_vector(0, &(stall_first_4), &(AND_u1_u1_798));\
;

#define simple_proc__scoreBoard_assign_stmt_808_c_macro_ __declare_static_bit_vector(EQ_u1_u1_803,1);\
__declare_static_bit_vector(EQ_u1_u1_806,1);\
__declare_static_bit_vector(OR_u1_u1_807,1);\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_803));\
bit_vector_equal(0, &(ex_Unconditional_JUMP), &(one_1), &(EQ_u1_u1_806));\
bit_vector_or(&(EQ_u1_u1_803), &(EQ_u1_u1_806), &(OR_u1_u1_807));\
bit_vector_cast_to_bit_vector(0, &(flush_ifetch), &(OR_u1_u1_807));\
;

#define simple_proc__scoreBoard_assign_stmt_817_c_macro_ __declare_static_bit_vector(EQ_u1_u1_812,1);\
__declare_static_bit_vector(EQ_u1_u1_815,1);\
__declare_static_bit_vector(OR_u1_u1_816,1);\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_812));\
bit_vector_equal(0, &(ex_Unconditional_JUMP), &(one_1), &(EQ_u1_u1_815));\
bit_vector_or(&(EQ_u1_u1_812), &(EQ_u1_u1_815), &(OR_u1_u1_816));\
bit_vector_cast_to_bit_vector(0, &(flush_icache), &(OR_u1_u1_816));\
;

#define simple_proc__scoreBoard_assign_stmt_826_c_macro_ __declare_static_bit_vector(EQ_u1_u1_821,1);\
__declare_static_bit_vector(EQ_u1_u1_824,1);\
__declare_static_bit_vector(OR_u1_u1_825,1);\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_821));\
bit_vector_equal(0, &(ex_Unconditional_JUMP), &(one_1), &(EQ_u1_u1_824));\
bit_vector_or(&(EQ_u1_u1_821), &(EQ_u1_u1_824), &(OR_u1_u1_825));\
bit_vector_cast_to_bit_vector(0, &(flush_idecode), &(OR_u1_u1_825));\
;

#define simple_proc__scoreBoard_assign_stmt_835_c_macro_ __declare_static_bit_vector(EQ_u1_u1_830,1);\
__declare_static_bit_vector(EQ_u1_u1_833,1);\
__declare_static_bit_vector(OR_u1_u1_834,1);\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_830));\
bit_vector_equal(0, &(ex_Unconditional_JUMP), &(one_1), &(EQ_u1_u1_833));\
bit_vector_or(&(EQ_u1_u1_830), &(EQ_u1_u1_833), &(OR_u1_u1_834));\
bit_vector_cast_to_bit_vector(0, &(flush_reg), &(OR_u1_u1_834));\
;

#define simple_proc__scoreBoard_assign_stmt_848_c_macro_ __declare_static_bit_vector(EQ_u1_u1_839,1);\
__declare_static_bit_vector(EQ_u1_u1_842,1);\
__declare_static_bit_vector(OR_u1_u1_843,1);\
__declare_static_bit_vector(EQ_u1_u1_846,1);\
__declare_static_bit_vector(OR_u1_u1_847,1);\
bit_vector_equal(0, &(is_Branch), &(one_1), &(EQ_u1_u1_839));\
bit_vector_equal(0, &(ex_Unconditional_JUMP), &(one_1), &(EQ_u1_u1_842));\
bit_vector_or(&(EQ_u1_u1_839), &(EQ_u1_u1_842), &(OR_u1_u1_843));\
bit_vector_equal(0, &(stall_first_4), &(one_1), &(EQ_u1_u1_846));\
bit_vector_or(&(OR_u1_u1_843), &(EQ_u1_u1_846), &(OR_u1_u1_847));\
bit_vector_cast_to_bit_vector(0, &(flush_iexec), &(OR_u1_u1_847));\
;

#define simple_proc__scoreBoard_assign_stmt_851_c_macro_ bit_vector_cast_to_bit_vector(0, &(flush_dcache), &(is_Branch));\
;

#define simple_proc__scoreBoard_assign_stmt_854_c_macro_ bit_vector_cast_to_bit_vector(0, &(ifetch_actions), &(ifetch_state));\
;

#define simple_proc__scoreBoard_assign_stmt_857_c_macro_ bit_vector_cast_to_bit_vector(0, &(icache_actions), &(icache_state));\
;

#define simple_proc__scoreBoard_assign_stmt_860_c_macro_ bit_vector_cast_to_bit_vector(0, &(idecode_actions), &(idecode_state));\
;

#define simple_proc__scoreBoard_assign_stmt_864_c_macro_ __declare_static_bit_vector(slice_863,8);\
bit_vector_slice(&(iregfile_state), &(slice_863), 34);\
bit_vector_cast_to_bit_vector(0, &(iregfile_state_opcode), &(slice_863));\
;

#define simple_proc__scoreBoard_assign_stmt_872_c_macro_ __declare_static_bit_vector(konst_867,8);\
bit_vector_clear(&konst_867);\
__declare_static_bit_vector(EQ_u8_u1_868,1);\
__declare_static_bit_vector(MUX_871,1);\
bit_vector_clear(&konst_867);\
bit_vector_equal(0, &(iregfile_state_opcode), &(konst_867), &(EQ_u8_u1_868));\
if (has_undefined_bit(&EQ_u8_u1_868)) {fprintf(stderr, "Error: variable EQ_u8_u1_868 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_868));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_868)){\
bit_vector_cast_to_bit_vector(0, &(MUX_871), &(zero_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_871), &(one_1));\
}\
bit_vector_cast_to_bit_vector(0, &(reg_valid_read1), &(MUX_871));\
;

#define simple_proc__scoreBoard_assign_stmt_880_c_macro_ __declare_static_bit_vector(konst_875,8);\
bit_vector_clear(&konst_875);\
__declare_static_bit_vector(EQ_u8_u1_876,1);\
__declare_static_bit_vector(MUX_879,1);\
bit_vector_clear(&konst_875);\
bit_vector_equal(0, &(iregfile_state_opcode), &(konst_875), &(EQ_u8_u1_876));\
if (has_undefined_bit(&EQ_u8_u1_876)) {fprintf(stderr, "Error: variable EQ_u8_u1_876 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_876));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_876)){\
bit_vector_cast_to_bit_vector(0, &(MUX_879), &(zero_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_879), &(one_1));\
}\
bit_vector_cast_to_bit_vector(0, &(reg_valid_read2), &(MUX_879));\
;

#define simple_proc__scoreBoard_assign_stmt_883_c_macro_ bit_vector_cast_to_bit_vector(0, &(reg_valid_write), &(iretire_state_reg_write));\
;

#define simple_proc__scoreBoard_assign_stmt_894_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_887,2);\
__declare_static_bit_vector(CONCAT_u2_u3_889,3);\
__declare_static_bit_vector(CONCAT_u1_u2_892,2);\
__declare_static_bit_vector(CONCAT_u3_u5_893,5);\
bit_vector_concatenate( &(reg_valid_read1), &(reg_valid_read2), &(CONCAT_u1_u2_887));\
bit_vector_concatenate( &(CONCAT_u1_u2_887), &(reg_valid_write), &(CONCAT_u2_u3_889));\
bit_vector_concatenate( &(iretire_state_to_rs1_imm), &(iretire_state_to_rs2), &(CONCAT_u1_u2_892));\
bit_vector_concatenate( &(CONCAT_u2_u3_889), &(CONCAT_u1_u2_892), &(CONCAT_u3_u5_893));\
bit_vector_cast_to_bit_vector(0, &(iregfile_actions), &(CONCAT_u3_u5_893));\
;

#define simple_proc__scoreBoard_assign_stmt_903_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_898,2);\
__declare_static_bit_vector(CONCAT_u1_u2_901,2);\
__declare_static_bit_vector(CONCAT_u2_u4_902,4);\
bit_vector_concatenate( &(dcache_to_ex_rs1_imm), &(dcache_to_ex_rs2), &(CONCAT_u1_u2_898));\
bit_vector_concatenate( &(iretire_state_to_ex_rs1_imm), &(iretire_state_to_ex_rs2), &(CONCAT_u1_u2_901));\
bit_vector_concatenate( &(CONCAT_u1_u2_898), &(CONCAT_u1_u2_901), &(CONCAT_u2_u4_902));\
bit_vector_cast_to_bit_vector(0, &(iexec_actions), &(CONCAT_u2_u4_902));\
;

#define simple_proc__scoreBoard_assign_stmt_911_c_macro_ __declare_static_bit_vector(EQ_u8_u1_907,1);\
__declare_static_bit_vector(MUX_910,1);\
bit_vector_equal(0, &(dcache_opcode), &(STORE), &(EQ_u8_u1_907));\
if (has_undefined_bit(&EQ_u8_u1_907)) {fprintf(stderr, "Error: variable EQ_u8_u1_907 has undefined value (%s) at test point.\n", to_string(&EQ_u8_u1_907));assert(0);} \
if(bit_vector_to_uint64(0, &EQ_u8_u1_907)){\
bit_vector_cast_to_bit_vector(0, &(MUX_910), &(zero_1));\
}\
else\
{\
bit_vector_cast_to_bit_vector(0, &(MUX_910), &(one_1));\
}\
bit_vector_cast_to_bit_vector(0, &(memWrite), &(MUX_910));\
;

#define simple_proc__scoreBoard_assign_stmt_918_c_macro_ __declare_static_bit_vector(CONCAT_u1_u2_915,2);\
__declare_static_bit_vector(CONCAT_u2_u3_917,3);\
bit_vector_concatenate( &(memWrite), &(iretire_state_to_dcache_addr), &(CONCAT_u1_u2_915));\
bit_vector_concatenate( &(CONCAT_u1_u2_915), &(iretire_state_to_dcache_memData), &(CONCAT_u2_u3_917));\
bit_vector_cast_to_bit_vector(0, &(dcache_actions), &(CONCAT_u2_u3_917));\
;

#define simple_proc__scoreBoard_inner_outarg_prep_macro__ bit_vector_cast_to_bit_vector(0, &((*__pifetch_actions)), &(ifetch_actions));\
bit_vector_cast_to_bit_vector(0, &((*__picache_actions)), &(icache_actions));\
bit_vector_cast_to_bit_vector(0, &((*__pidecode_actions)), &(idecode_actions));\
bit_vector_cast_to_bit_vector(0, &((*__piregfile_actions)), &(iregfile_actions));\
bit_vector_cast_to_bit_vector(0, &((*__piexec_actions)), &(iexec_actions));\
bit_vector_cast_to_bit_vector(0, &((*__pdcache_actions)), &(dcache_actions));\
bit_vector_cast_to_bit_vector(0, &((*__pex_Unconditional_JUMP)), &(ex_Unconditional_JUMP));\
bit_vector_cast_to_bit_vector(0, &((*__pis_Branch_Hazard)), &(is_Branch_Hazard));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_ifetch)), &(flush_ifetch));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_icache)), &(flush_icache));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_idecode)), &(flush_idecode));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_reg)), &(flush_reg));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_iexec)), &(flush_iexec));\
bit_vector_cast_to_bit_vector(0, &((*__pflush_dcache)), &(flush_dcache));\
bit_vector_cast_to_bit_vector(0, &((*__pstall_first_4)), &(stall_first_4));\
;
