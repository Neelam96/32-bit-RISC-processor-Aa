#include <pthread.h>
#include <pthreadUtils.h>
#include <Pipes.h>
#include <simple_proc_aa_c_model_internal.h>
#include <simple_proc_aa_c_model.h>
FILE* simple_proc___report_log_file__ = NULL;
int simple_proc___trace_on__ = 0;
void simple_proc__set_trace_file(FILE* fp) {
simple_proc___report_log_file__ = fp;
}
bit_vector simple_proc__ADD;
#define ADD (simple_proc__ADD)

bit_vector simple_proc__BN;
#define BN (simple_proc__BN)

bit_vector simple_proc__BZ;
#define BZ (simple_proc__BZ)

bit_vector simple_proc__CALL;
#define CALL (simple_proc__CALL)

bit_vector simple_proc__CMP;
#define CMP (simple_proc__CMP)

bit_vector simple_proc__HALT;
#define HALT (simple_proc__HALT)

bit_vector simple_proc__JMP;
#define JMP (simple_proc__JMP)

bit_vector simple_proc__LOAD;
#define LOAD (simple_proc__LOAD)

bit_vector simple_proc__L_AND;
#define L_AND (simple_proc__L_AND)

bit_vector simple_proc__L_OR;
#define L_OR (simple_proc__L_OR)

bit_vector simple_proc__L_SLL;
#define L_SLL (simple_proc__L_SLL)

bit_vector simple_proc__L_SRA;
#define L_SRA (simple_proc__L_SRA)

bit_vector simple_proc__L_SRL;
#define L_SRL (simple_proc__L_SRL)

bit_vector simple_proc__L_XNOR;
#define L_XNOR (simple_proc__L_XNOR)

bit_vector simple_proc__L_XOR;
#define L_XOR (simple_proc__L_XOR)

bit_vector simple_proc__SBIR;
#define SBIR (simple_proc__SBIR)

bit_vector simple_proc__STORE;
#define STORE (simple_proc__STORE)

bit_vector simple_proc__SUB;
#define SUB (simple_proc__SUB)

bit_vector simple_proc__byte_mask_3_bytes;
#define byte_mask_3_bytes (simple_proc__byte_mask_3_bytes)

bit_vector simple_proc__minus_1;
#define minus_1 (simple_proc__minus_1)

bit_vector simple_proc__one_1;
#define one_1 (simple_proc__one_1)

bit_vector simple_proc__one_10;
#define one_10 (simple_proc__one_10)

bit_vector simple_proc__one_32;
#define one_32 (simple_proc__one_32)

bit_vector simple_proc__read_signal;
#define read_signal (simple_proc__read_signal)

bit_vector simple_proc__reg_array[64];
#define reg_array (simple_proc__reg_array)

bit_vector simple_proc__uart_addr;
#define uart_addr (simple_proc__uart_addr)

bit_vector simple_proc__write_signal;
#define write_signal (simple_proc__write_signal)

bit_vector simple_proc__zero_1;
#define zero_1 (simple_proc__zero_1)

bit_vector simple_proc__zero_10;
#define zero_10 (simple_proc__zero_10)

bit_vector simple_proc__zero_23;
#define zero_23 (simple_proc__zero_23)

bit_vector simple_proc__zero_32;
#define zero_32 (simple_proc__zero_32)

bit_vector simple_proc__zero_33;
#define zero_33 (simple_proc__zero_33)

void simple_proc___init_aa_globals__() 
{
init_static_bit_vector(&(ADD), 8);\
bit_vector_clear(&ADD);\
ADD.val.byte_array[0] = 9;\
init_static_bit_vector(&(BN), 8);\
bit_vector_clear(&BN);\
BN.val.byte_array[0] = 15;\
init_static_bit_vector(&(BZ), 8);\
bit_vector_clear(&BZ);\
BZ.val.byte_array[0] = 14;\
init_static_bit_vector(&(CALL), 8);\
bit_vector_clear(&CALL);\
CALL.val.byte_array[0] = 16;\
init_static_bit_vector(&(CMP), 8);\
bit_vector_clear(&CMP);\
CMP.val.byte_array[0] = 18;\
init_static_bit_vector(&(HALT), 8);\
bit_vector_clear(&HALT);\
HALT.val.byte_array[0] = 1;\
init_static_bit_vector(&(JMP), 8);\
bit_vector_clear(&JMP);\
JMP.val.byte_array[0] = 17;\
init_static_bit_vector(&(LOAD), 8);\
bit_vector_clear(&LOAD);\
LOAD.val.byte_array[0] = 3;\
init_static_bit_vector(&(L_AND), 8);\
bit_vector_clear(&L_AND);\
L_AND.val.byte_array[0] = 5;\
init_static_bit_vector(&(L_OR), 8);\
bit_vector_clear(&L_OR);\
L_OR.val.byte_array[0] = 6;\
init_static_bit_vector(&(L_SLL), 8);\
bit_vector_clear(&L_SLL);\
L_SLL.val.byte_array[0] = 11;\
init_static_bit_vector(&(L_SRA), 8);\
bit_vector_clear(&L_SRA);\
L_SRA.val.byte_array[0] = 13;\
init_static_bit_vector(&(L_SRL), 8);\
bit_vector_clear(&L_SRL);\
L_SRL.val.byte_array[0] = 12;\
init_static_bit_vector(&(L_XNOR), 8);\
bit_vector_clear(&L_XNOR);\
L_XNOR.val.byte_array[0] = 7;\
init_static_bit_vector(&(L_XOR), 8);\
bit_vector_clear(&L_XOR);\
L_XOR.val.byte_array[0] = 8;\
init_static_bit_vector(&(SBIR), 8);\
bit_vector_clear(&SBIR);\
SBIR.val.byte_array[0] = 2;\
init_static_bit_vector(&(STORE), 8);\
bit_vector_clear(&STORE);\
STORE.val.byte_array[0] = 4;\
init_static_bit_vector(&(SUB), 8);\
bit_vector_clear(&SUB);\
SUB.val.byte_array[0] = 10;\
init_static_bit_vector(&(byte_mask_3_bytes), 32);\
bit_vector_clear(&byte_mask_3_bytes);\
byte_mask_3_bytes.val.byte_array[1] = 255;\
byte_mask_3_bytes.val.byte_array[2] = 255;\
byte_mask_3_bytes.val.byte_array[3] = 255;\
register_pipe("in_pipe", 8, 8, 0);\
register_pipe("mem_in", 8, 64, 0);\
register_pipe("mem_out", 8, 32, 0);\
init_static_bit_vector(&(minus_1), 32);\
bit_vector_clear(&minus_1);\
minus_1.val.byte_array[0] = 255;\
minus_1.val.byte_array[1] = 255;\
minus_1.val.byte_array[2] = 255;\
minus_1.val.byte_array[3] = 255;\
init_static_bit_vector(&(one_1), 1);\
bit_vector_clear(&one_1);\
one_1.val.byte_array[0] = 1;\
init_static_bit_vector(&(one_10), 10);\
bit_vector_clear(&one_10);\
one_10.val.byte_array[0] = 1;\
init_static_bit_vector(&(one_32), 32);\
bit_vector_clear(&one_32);\
one_32.val.byte_array[0] = 1;\
register_pipe("out_pipe", 8, 8, 0);\
register_pipe("processor_result", 2, 32, 0);\
init_static_bit_vector(&(read_signal), 1);\
bit_vector_clear(&read_signal);\
read_signal.val.byte_array[0] = 1;\
init_static_bit_vector(&(reg_array[0]), 32);\
init_static_bit_vector(&(reg_array[1]), 32);\
init_static_bit_vector(&(reg_array[2]), 32);\
init_static_bit_vector(&(reg_array[3]), 32);\
init_static_bit_vector(&(reg_array[4]), 32);\
init_static_bit_vector(&(reg_array[5]), 32);\
init_static_bit_vector(&(reg_array[6]), 32);\
init_static_bit_vector(&(reg_array[7]), 32);\
init_static_bit_vector(&(reg_array[8]), 32);\
init_static_bit_vector(&(reg_array[9]), 32);\
init_static_bit_vector(&(reg_array[10]), 32);\
init_static_bit_vector(&(reg_array[11]), 32);\
init_static_bit_vector(&(reg_array[12]), 32);\
init_static_bit_vector(&(reg_array[13]), 32);\
init_static_bit_vector(&(reg_array[14]), 32);\
init_static_bit_vector(&(reg_array[15]), 32);\
init_static_bit_vector(&(reg_array[16]), 32);\
init_static_bit_vector(&(reg_array[17]), 32);\
init_static_bit_vector(&(reg_array[18]), 32);\
init_static_bit_vector(&(reg_array[19]), 32);\
init_static_bit_vector(&(reg_array[20]), 32);\
init_static_bit_vector(&(reg_array[21]), 32);\
init_static_bit_vector(&(reg_array[22]), 32);\
init_static_bit_vector(&(reg_array[23]), 32);\
init_static_bit_vector(&(reg_array[24]), 32);\
init_static_bit_vector(&(reg_array[25]), 32);\
init_static_bit_vector(&(reg_array[26]), 32);\
init_static_bit_vector(&(reg_array[27]), 32);\
init_static_bit_vector(&(reg_array[28]), 32);\
init_static_bit_vector(&(reg_array[29]), 32);\
init_static_bit_vector(&(reg_array[30]), 32);\
init_static_bit_vector(&(reg_array[31]), 32);\
init_static_bit_vector(&(reg_array[32]), 32);\
init_static_bit_vector(&(reg_array[33]), 32);\
init_static_bit_vector(&(reg_array[34]), 32);\
init_static_bit_vector(&(reg_array[35]), 32);\
init_static_bit_vector(&(reg_array[36]), 32);\
init_static_bit_vector(&(reg_array[37]), 32);\
init_static_bit_vector(&(reg_array[38]), 32);\
init_static_bit_vector(&(reg_array[39]), 32);\
init_static_bit_vector(&(reg_array[40]), 32);\
init_static_bit_vector(&(reg_array[41]), 32);\
init_static_bit_vector(&(reg_array[42]), 32);\
init_static_bit_vector(&(reg_array[43]), 32);\
init_static_bit_vector(&(reg_array[44]), 32);\
init_static_bit_vector(&(reg_array[45]), 32);\
init_static_bit_vector(&(reg_array[46]), 32);\
init_static_bit_vector(&(reg_array[47]), 32);\
init_static_bit_vector(&(reg_array[48]), 32);\
init_static_bit_vector(&(reg_array[49]), 32);\
init_static_bit_vector(&(reg_array[50]), 32);\
init_static_bit_vector(&(reg_array[51]), 32);\
init_static_bit_vector(&(reg_array[52]), 32);\
init_static_bit_vector(&(reg_array[53]), 32);\
init_static_bit_vector(&(reg_array[54]), 32);\
init_static_bit_vector(&(reg_array[55]), 32);\
init_static_bit_vector(&(reg_array[56]), 32);\
init_static_bit_vector(&(reg_array[57]), 32);\
init_static_bit_vector(&(reg_array[58]), 32);\
init_static_bit_vector(&(reg_array[59]), 32);\
init_static_bit_vector(&(reg_array[60]), 32);\
init_static_bit_vector(&(reg_array[61]), 32);\
init_static_bit_vector(&(reg_array[62]), 32);\
init_static_bit_vector(&(reg_array[63]), 32);\
register_pipe("request_to_bridge", 8, 64, 0);\
register_pipe("response_from_bridge", 8, 32, 0);\
init_static_bit_vector(&(uart_addr), 8);\
bit_vector_clear(&uart_addr);\
uart_addr.val.byte_array[0] = 254;\
init_static_bit_vector(&(write_signal), 1);\
bit_vector_clear(&write_signal);\
init_static_bit_vector(&(zero_1), 1);\
bit_vector_clear(&zero_1);\
init_static_bit_vector(&(zero_10), 10);\
bit_vector_clear(&zero_10);\
init_static_bit_vector(&(zero_23), 23);\
bit_vector_clear(&zero_23);\
init_static_bit_vector(&(zero_32), 32);\
bit_vector_clear(&zero_32);\
init_static_bit_vector(&(zero_33), 33);\
bit_vector_clear(&zero_33);\
}
void _simple_proc_cal_Next_program_cnt_(bit_vector* __popcode, bit_vector* __prd1, bit_vector* __prd2, bit_vector* __pprogram_cnt, bit_vector* __pis_rs1_neg, bit_vector*  __pn_program_cnt)
{
MUTEX_DECL(simple_proc__cal_Next_program_cnt_series_block_stmt_109_c_mutex_);
MUTEX_LOCK(simple_proc__cal_Next_program_cnt_series_block_stmt_109_c_mutex_);
simple_proc__cal_Next_program_cnt_inner_inarg_prep_macro__; 
// 	$volatile is_Branch := (((opcode == BZ) & ( ~ is_rs1_neg )) | ((opcode == BN) & is_rs1_neg))
simple_proc__cal_Next_program_cnt_assign_stmt_129_c_macro_; 
// 	$volatile normalFlow := ( ~ ((is_Branch | (opcode == CALL)) | (opcode == JMP)) )
simple_proc__cal_Next_program_cnt_assign_stmt_141_c_macro_; 
// 	$volatile addr1 := ( $slice rd1 7 0 ) 
simple_proc__cal_Next_program_cnt_assign_stmt_145_c_macro_; 
// 	$volatile addr2 := ( $slice rd2 7 0 ) 
simple_proc__cal_Next_program_cnt_assign_stmt_149_c_macro_; 
// 	$volatile n_program_cnt := ((( $mux (opcode == CALL) addr1  _b0  )  | ( $mux (opcode == JMP) addr1  _b0  ) ) | (( $mux (is_Branch == one_1) addr2  _b0  )  | ( $mux (normalFlow == one_1) (program_cnt + 1 )  _b0  ) ))
simple_proc__cal_Next_program_cnt_assign_stmt_180_c_macro_; 
simple_proc__cal_Next_program_cnt_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__cal_Next_program_cnt_series_block_stmt_109_c_mutex_);
}
void _simple_proc_global_storage_initializer__()
{
MUTEX_DECL(simple_proc__global_storage_initializer__series_block_stmt_182_c_mutex_);
MUTEX_LOCK(simple_proc__global_storage_initializer__series_block_stmt_182_c_mutex_);
simple_proc__global_storage_initializer__inner_inarg_prep_macro__; 
/* null */ ;
simple_proc__global_storage_initializer__inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__global_storage_initializer__series_block_stmt_182_c_mutex_);
}
void simple_proc_global_storage_initializer_()
{
simple_proc__global_storage_initializer__outer_arg_decl_macro__;
_simple_proc_global_storage_initializer__();
simple_proc__global_storage_initializer__outer_op_xfer_macro__;
}


void _simple_proc_memory_daemon_()
{
MUTEX_DECL(simple_proc__memory_daemon_series_block_stmt_185_c_mutex_);
MUTEX_LOCK(simple_proc__memory_daemon_series_block_stmt_185_c_mutex_);
simple_proc__memory_daemon_inner_inarg_prep_macro__; 
// 	data_in_mem := mem_in// bits of buffering = 64. 
simple_proc__memory_daemon_assign_stmt_188_c_macro_; 
// 	data_in := ( $slice data_in_mem 31 0 ) // bits of buffering = 32. 
simple_proc__memory_daemon_assign_stmt_192_c_macro_; 
// 	mem_out := (data_in + 1 )// bits of buffering = 32. 
simple_proc__memory_daemon_assign_stmt_197_c_macro_; 
simple_proc__memory_daemon_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__memory_daemon_series_block_stmt_185_c_mutex_);
}
void simple_proc_memory_daemon()
{
simple_proc__memory_daemon_outer_arg_decl_macro__;
_simple_proc_memory_daemon_();
simple_proc__memory_daemon_outer_op_xfer_macro__;
}


void _simple_proc_processor_()
{
MUTEX_DECL(simple_proc__processor_series_block_stmt_298_c_mutex_);
MUTEX_LOCK(simple_proc__processor_series_block_stmt_298_c_mutex_);
simple_proc__processor_inner_inarg_prep_macro__; 
simple_proc__processor_branch_block_stmt_299_c_export_decl_macro_; 
{
{
// do-while:   file prog.linked.opt.aa, line 121
__declare_static_bit_vector(EQ_u8_u1_708,1);\
__declare_static_bit_vector(NOT_u1_u1_709,1);\
uint8_t do_while_entry_flag;
do_while_entry_flag = 1;
uint8_t do_while_loopback_flag;
do_while_loopback_flag = 0;
while(1) {
// merge  file prog.linked.opt.aa, line 123
simple_proc__processor_merge_stmt_301_c_preamble_macro_; 
// 			$phi program_cnt := 			  _b00000000  $on   $entry 			  n_program_cnt $on   $loopback 
 // type of target is $uint<8>
simple_proc__processor_phi_stmt_302_c_macro_; 
simple_proc__processor_merge_stmt_301_c_postamble_macro_; 
// 			mem_in := ((read_signal && program_cnt) && (zero_23 && zero_32))// bits of buffering = 64. 
simple_proc__processor_assign_stmt_315_c_macro_; 
// 			instruction := mem_out// bits of buffering = 32. 
simple_proc__processor_assign_stmt_318_c_macro_; 
// 			$volatile opcode := ( $slice instruction 31 24 ) 
simple_proc__processor_assign_stmt_322_c_macro_; 
// 			$volatile rs1_imm := ( $slice instruction 23 16 ) 
simple_proc__processor_assign_stmt_326_c_macro_; 
// 			$volatile rs2 := ( $slice instruction 15 8 ) 
simple_proc__processor_assign_stmt_330_c_macro_; 
// 			$volatile rd := ( $slice instruction 7 0 ) 
simple_proc__processor_assign_stmt_334_c_macro_; 
// 			$call registerFileModule (one_1 rs1_imm one_1 rs2 zero_1 rd zero_32 ) (rd1 rd2 ) 
simple_proc__processor_call_stmt_344_c_macro_; 
// 			$volatile is_rs1_neg := ( $slice rd1 31 31 ) 
simple_proc__processor_assign_stmt_348_c_macro_; 
// 			opcode_369_delayed_7_0 := opcode $buffering 7// bits of buffering = 56. 
simple_proc__processor_assign_stmt_351_c_macro_; 
// 			program_cnt_372_delayed_7_0 := program_cnt $buffering 7// bits of buffering = 56. 
simple_proc__processor_assign_stmt_354_c_macro_; 
// 			$call cal_Next_program_cnt (opcode_369_delayed_7_0 rd1 rd2 program_cnt_372_delayed_7_0 is_rs1_neg ) (n_program_cnt ) 
simple_proc__processor_call_stmt_361_c_macro_; 
// $report (processor status 			 instruction instruction 			 rd1 rd1 			 rd2 rd2 			 n_program_cnt n_program_cnt )
simple_proc__processor_stmt_366_c_macro_; 
// 			type_cast_400_400_delayed_7_0 := ($bitcast ($uint<32>) rs1_imm ) $buffering 7// bits of buffering = 224. 
simple_proc__processor_assign_stmt_370_c_macro_; 
// 			EQ_u8_u1_407_407_delayed_7_0 := (opcode == L_AND) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_375_c_macro_; 
// 			EQ_u8_u1_387_387_delayed_7_0 := (opcode == ADD) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_380_c_macro_; 
// 			EQ_u8_u1_395_395_delayed_7_0 := (opcode == SBIR) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_385_c_macro_; 
// 			EQ_u8_u1_470_470_delayed_7_0 := (opcode == L_SRL) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_390_c_macro_; 
// 			EQ_u8_u1_416_416_delayed_7_0 := (opcode == L_OR) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_395_c_macro_; 
// 			EQ_u8_u1_424_424_delayed_7_0 := (opcode == L_XNOR) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_400_c_macro_; 
// 			EQ_u8_u1_433_433_delayed_7_0 := (opcode == L_XOR) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_405_c_macro_; 
// 			EQ_u8_u1_443_443_delayed_7_0 := (opcode == ADD) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_410_c_macro_; 
// 			EQ_u8_u1_451_451_delayed_7_0 := (opcode == SUB) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_415_c_macro_; 
// 			EQ_u8_u1_460_460_delayed_7_0 := (opcode == L_SLL) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_420_c_macro_; 
// 			EQ_u8_u1_479_479_delayed_7_0 := (opcode == L_SRA) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_425_c_macro_; 
// 			EQ_u8_u1_489_489_delayed_7_0 := (opcode == CMP) $buffering 7// bits of buffering = 7. 
simple_proc__processor_assign_stmt_430_c_macro_; 
// 			exec_result := ((((( $mux EQ_u8_u1_387_387_delayed_7_0 (rd1 + rd2)  _b0  )  | ( $mux EQ_u8_u1_395_395_delayed_7_0 ((rd2 & byte_mask_3_bytes) | type_cast_400_400_delayed_7_0)  _b0  ) ) | ( $mux EQ_u8_u1_407_407_delayed_7_0 (rd1 & rd2)  _b0  ) ) | ((( $mux EQ_u8_u1_416_416_delayed_7_0 (rd1 | rd2)  _b0  )  | ( $mux EQ_u8_u1_424_424_delayed_7_0 (rd1 ~^ rd2)  _b0  ) ) | ( $mux EQ_u8_u1_433_433_delayed_7_0 (rd1 ^ rd2)  _b0  ) )) | (((( $mux EQ_u8_u1_443_443_delayed_7_0 (rd1 + rd2)  _b0  )  | ( $mux EQ_u8_u1_451_451_delayed_7_0 (rd1 - rd2)  _b0  ) ) | ( $mux EQ_u8_u1_460_460_delayed_7_0 ($bitcast ($uint<32>) (rd1 << rd2) )  _b0  ) ) | ((( $mux EQ_u8_u1_470_470_delayed_7_0 ($bitcast ($uint<32>) (rd1 >> rd2) )  _b0  )  | ( $mux EQ_u8_u1_479_479_delayed_7_0 ($bitcast ($uint<32>) (rd1 >> rd2) )  _b0  ) ) | ( $mux EQ_u8_u1_489_489_delayed_7_0 ((( $mux (rd1 == rd2) zero_32  _b0  )  | ( $mux (rd1 < rd2) minus_1  _b0  ) ) | ( $mux (rd1 > rd2) one_32  _b0  ) )  _b0  ) )))// bits of buffering = 32. 
simple_proc__processor_assign_stmt_537_c_macro_; 
// 			$volatile memWrite := ( $mux (opcode == STORE) zero_1  one_1 ) 
simple_proc__processor_assign_stmt_545_c_macro_; 
// 			$volatile regWrite := (((((opcode == SBIR) | (opcode == LOAD)) | (opcode == L_AND)) | (((opcode == L_OR) | (opcode == L_XNOR)) | (opcode == ADD))) | ((((opcode == SUB) | (opcode == L_SLL)) | (opcode == L_SRL)) | (((opcode == L_SRA) | (opcode == CALL)) | (opcode == CMP))))
simple_proc__processor_assign_stmt_594_c_macro_; 
// 			memAddr := rs1_imm// bits of buffering = 8. 
simple_proc__processor_assign_stmt_597_c_macro_; 
// 			$volatile is_uart_addr := ( $mux (memAddr == uart_addr) one_1  zero_1 ) 
simple_proc__processor_assign_stmt_605_c_macro_; 
// 			is_uart_addr_584_delayed_6_0 := is_uart_addr $buffering 6// bits of buffering = 6. 
simple_proc__processor_assign_stmt_608_c_macro_; 
// 			memWrite_586_delayed_1_0 := memWrite// bits of buffering = 1. 
simple_proc__processor_assign_stmt_611_c_macro_; 
// 			CONCAT_u1_u9_588_588_delayed_6_0 := (memWrite_586_delayed_1_0 && memAddr) $buffering 6// bits of buffering = 54. 
simple_proc__processor_assign_stmt_616_c_macro_; 
// 			$guard (~is_uart_addr_584_delayed_6_0) mem_in := (CONCAT_u1_u9_588_588_delayed_6_0 && (zero_23 && rd2))// bits of buffering = 64. 
simple_proc__processor_assign_stmt_624_c_macro_; 
// 			$guard (~is_uart_addr) memReadData := mem_out// bits of buffering = 32. 
simple_proc__processor_assign_stmt_628_c_macro_; 
// 			$guard (is_uart_addr) $call receive_from_uart () (data_from_uart ) 
simple_proc__processor_call_stmt_631_c_macro_; 
// $report (processor uart 			 data_from_uart data_from_uart )
simple_proc__processor_stmt_633_c_macro_; 
// 			$volatile write_to_uart := is_uart_addr
simple_proc__processor_assign_stmt_636_c_macro_; 
// 			$volatile program_cnt_1 := (program_cnt + 1 )
simple_proc__processor_assign_stmt_641_c_macro_; 
// 			EQ_u8_u1_617_617_delayed_8_0 := (opcode == LOAD) $buffering 8// bits of buffering = 8. 
simple_proc__processor_assign_stmt_646_c_macro_; 
// 			memReadData_618_delayed_6_0 := memReadData $buffering 6// bits of buffering = 192. 
simple_proc__processor_assign_stmt_649_c_macro_; 
// 			EQ_u8_u1_621_621_delayed_8_0 := (opcode == CALL) $buffering 8// bits of buffering = 8. 
simple_proc__processor_assign_stmt_654_c_macro_; 
// 			type_cast_623_623_delayed_8_0 := ($bitcast ($uint<32>) program_cnt_1 ) $buffering 8// bits of buffering = 256. 
simple_proc__processor_assign_stmt_658_c_macro_; 
// 			EQ_u1_u1_626_626_delayed_8_0 := (regWrite == one_1) $buffering 8// bits of buffering = 8. 
simple_proc__processor_assign_stmt_663_c_macro_; 
// 			regWriteData := ( $mux EQ_u8_u1_617_617_delayed_8_0 memReadData_618_delayed_6_0  ( $mux EQ_u8_u1_621_621_delayed_8_0 type_cast_623_623_delayed_8_0  ( $mux EQ_u1_u1_626_626_delayed_8_0 exec_result  ($bitcast ($uint<32>) 0  ) )  )  ) // bits of buffering = 32. 
simple_proc__processor_assign_stmt_676_c_macro_; 
// 			rs1_imm_635_delayed_9_0 := rs1_imm $buffering 9// bits of buffering = 72. 
simple_proc__processor_assign_stmt_679_c_macro_; 
// 			rs2_637_delayed_9_0 := rs2 $buffering 9// bits of buffering = 72. 
simple_proc__processor_assign_stmt_682_c_macro_; 
// 			regWrite_638_delayed_9_0 := regWrite $buffering 9// bits of buffering = 9. 
simple_proc__processor_assign_stmt_685_c_macro_; 
// 			rd_639_delayed_9_0 := rd $buffering 9// bits of buffering = 72. 
simple_proc__processor_assign_stmt_688_c_macro_; 
// 			$call registerFileModule (zero_1 rs1_imm_635_delayed_9_0 zero_1 rs2_637_delayed_9_0 regWrite_638_delayed_9_0 rd_639_delayed_9_0 regWriteData ) (read_while_write1 read_while_write2 ) 
simple_proc__processor_call_stmt_698_c_macro_; 
// 			write_to_uart_644_delayed_8_0 := write_to_uart $buffering 8// bits of buffering = 8. 
simple_proc__processor_assign_stmt_701_c_macro_; 
// 			$guard (write_to_uart_644_delayed_8_0) $call send_to_uart (regWriteData ) () 
simple_proc__processor_call_stmt_704_c_macro_; 
do_while_entry_flag = 0;
do_while_loopback_flag = 1;
bit_vector_equal(0, &(opcode), &(HALT), &(EQ_u8_u1_708));\
bit_vector_not( &(EQ_u8_u1_708), &(NOT_u1_u1_709));\
if (has_undefined_bit(&NOT_u1_u1_709)) {fprintf(stderr, "Error: variable NOT_u1_u1_709 has undefined value (%s) at test point.\n", to_string(&NOT_u1_u1_709));assert(0);} \

if (!bit_vector_to_uint64(0, &NOT_u1_u1_709)) break;
} 
}
simple_proc__processor_branch_block_stmt_299_c_export_apply_macro_;
}
simple_proc__processor_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__processor_series_block_stmt_298_c_mutex_);
}
void simple_proc_processor()
{
simple_proc__processor_outer_arg_decl_macro__;
_simple_proc_processor_();
simple_proc__processor_outer_op_xfer_macro__;
}


void _simple_proc_receive_from_uart_(bit_vector*  __preceive_data_from_uart)
{
MUTEX_DECL(simple_proc__receive_from_uart_series_block_stmt_243_c_mutex_);
MUTEX_LOCK(simple_proc__receive_from_uart_series_block_stmt_243_c_mutex_);
simple_proc__receive_from_uart_inner_inarg_prep_macro__; 
// 	in_data0 := in_pipe// bits of buffering = 8. 
simple_proc__receive_from_uart_assign_stmt_247_c_macro_; 
// 	in_data1 := in_pipe// bits of buffering = 8. 
simple_proc__receive_from_uart_assign_stmt_250_c_macro_; 
// 	in_data2 := in_pipe// bits of buffering = 8. 
simple_proc__receive_from_uart_assign_stmt_253_c_macro_; 
// 	in_data3 := in_pipe// bits of buffering = 8. 
simple_proc__receive_from_uart_assign_stmt_256_c_macro_; 
// 	receive_data_from_uart := ((in_data3 && in_data2) && (in_data1 && in_data0))// bits of buffering = 32. 
simple_proc__receive_from_uart_assign_stmt_265_c_macro_; 
simple_proc__receive_from_uart_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__receive_from_uart_series_block_stmt_243_c_mutex_);
}
void simple_proc_receive_from_uart(uint32_t*  receive_data_from_uart )
{
simple_proc__receive_from_uart_outer_arg_decl_macro__;
_simple_proc_receive_from_uart_( &__receive_data_from_uart);
simple_proc__receive_from_uart_outer_op_xfer_macro__;
}


void _simple_proc_registerFileModule_(bit_vector* __pvalid_1, bit_vector* __paddr_1, bit_vector* __pvalid_2, bit_vector* __paddr_2, bit_vector* __pvalid_w, bit_vector* __paddr_w, bit_vector* __pdata_to_be_written, bit_vector*  __pread_data_1, bit_vector*  __pread_data_2)
{
MUTEX_DECL(simple_proc__registerFileModule_series_block_stmt_199_c_mutex_);
MUTEX_LOCK(simple_proc__registerFileModule_series_block_stmt_199_c_mutex_);
simple_proc__registerFileModule_inner_inarg_prep_macro__; 
// 	$guard (valid_1) t_read_data_1 := reg_array[addr_1]// bits of buffering = 32. 
simple_proc__registerFileModule_assign_stmt_213_c_macro_; 
// 	$guard (valid_2) t_read_data_2 := reg_array[addr_2]// bits of buffering = 32. 
simple_proc__registerFileModule_assign_stmt_218_c_macro_; 
// 	valid_1_241_delayed_4_0 := valid_1 $buffering 4// bits of buffering = 4. 
simple_proc__registerFileModule_assign_stmt_221_c_macro_; 
// 	read_data_1 := ( $mux valid_1_241_delayed_4_0 t_read_data_1  0  ) // bits of buffering = 32. 
simple_proc__registerFileModule_assign_stmt_227_c_macro_; 
// 	valid_2_247_delayed_4_0 := valid_2 $buffering 4// bits of buffering = 4. 
simple_proc__registerFileModule_assign_stmt_230_c_macro_; 
// 	read_data_2 := ( $mux valid_2_247_delayed_4_0 t_read_data_2  0  ) // bits of buffering = 32. 
simple_proc__registerFileModule_assign_stmt_236_c_macro_; 
// 	$guard (valid_w) reg_array[addr_w] := data_to_be_written// bits of buffering = 32. 
simple_proc__registerFileModule_assign_stmt_241_c_macro_; 
simple_proc__registerFileModule_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__registerFileModule_series_block_stmt_199_c_mutex_);
}
void _simple_proc_send_to_uart_(bit_vector* __pdata_to_send)
{
MUTEX_DECL(simple_proc__send_to_uart_series_block_stmt_267_c_mutex_);
MUTEX_LOCK(simple_proc__send_to_uart_series_block_stmt_267_c_mutex_);
simple_proc__send_to_uart_inner_inarg_prep_macro__; 
// 	out_data_3 := ( $slice data_to_send 31 24 ) // bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_272_c_macro_; 
// 	out_data_2 := ( $slice data_to_send 23 16 ) // bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_276_c_macro_; 
// 	out_data_1 := ( $slice data_to_send 15 8 ) // bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_280_c_macro_; 
// 	out_data_0 := ( $slice data_to_send 7 0 ) // bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_284_c_macro_; 
// 	out_pipe := out_data_0// bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_287_c_macro_; 
// 	out_pipe := out_data_1// bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_290_c_macro_; 
// 	out_pipe := out_data_2// bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_293_c_macro_; 
// 	out_pipe := out_data_3// bits of buffering = 8. 
simple_proc__send_to_uart_assign_stmt_296_c_macro_; 
simple_proc__send_to_uart_inner_outarg_prep_macro__; 
MUTEX_UNLOCK(simple_proc__send_to_uart_series_block_stmt_267_c_mutex_);
}
void simple_proc_send_to_uart(uint32_t data_to_send )
{
simple_proc__send_to_uart_outer_arg_decl_macro__;
_simple_proc_send_to_uart_( &__data_to_send);
simple_proc__send_to_uart_outer_op_xfer_macro__;
}


DEFINE_THREAD(simple_proc_memory_daemon);
PTHREAD_DECL(simple_proc_memory_daemon);
DEFINE_THREAD(simple_proc_processor);
PTHREAD_DECL(simple_proc_processor);
void simple_proc_start_daemons(FILE* fp, int trace_on) {
simple_proc___report_log_file__ = fp;
simple_proc___trace_on__ = trace_on;
simple_proc___init_aa_globals__(); 
PTHREAD_CREATE(simple_proc_memory_daemon);
PTHREAD_CREATE(simple_proc_processor);
}
void simple_proc_stop_daemons() {
PTHREAD_CANCEL(simple_proc_memory_daemon);
PTHREAD_CANCEL(simple_proc_processor);
}
