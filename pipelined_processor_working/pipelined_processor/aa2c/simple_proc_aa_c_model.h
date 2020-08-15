#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <BitVectors.h>
#include <pipeHandler.h>
void simple_proc__set_trace_file(FILE* fp);
void simple_proc___init_aa_globals__(); 
void _simple_proc_accessMem_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void _simple_proc_accessReg_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* , bit_vector* );
void simple_proc_global_storage_initializer_();
void _simple_proc_global_storage_initializer__();
void _simple_proc_iExecStage_(bit_vector*, bit_vector*, bit_vector*, bit_vector* );
void simple_proc_memAccessDaemon();
void _simple_proc_memAccessDaemon_();
void simple_proc_processor_daemon();
void _simple_proc_processor_daemon_();
void simple_proc_regAccessDaemon();
void _simple_proc_regAccessDaemon_();
void _simple_proc_scoreBoard_(bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector*, bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* , bit_vector* );
void simple_proc_start_daemons(FILE* fp, int trace_on);
void simple_proc_stop_daemons();
