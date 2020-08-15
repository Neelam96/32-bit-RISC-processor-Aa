#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
void simple_proc__set_trace_file(FILE* fp);
void simple_proc___init_aa_globals__(); 
void _simple_proc_cal_Next_program_cnt_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void simple_proc_global_storage_initializer_();
void _simple_proc_global_storage_initializer__();
void simple_proc_memory_daemon();
void _simple_proc_memory_daemon_();
void simple_proc_processor();
void _simple_proc_processor_();
void simple_proc_receive_from_uart(uint32_t* );
void _simple_proc_receive_from_uart_(bit_vector* );
void _simple_proc_registerFileModule_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* , bit_vector* );
void simple_proc_send_to_uart(uint32_t);
void _simple_proc_send_to_uart_(bit_vector*);
void simple_proc_start_daemons(FILE* fp, int trace_on);
void simple_proc_stop_daemons();
