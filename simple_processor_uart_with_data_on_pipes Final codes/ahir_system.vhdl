-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity cal_Next_program_cnt is -- 
  generic (tag_length : integer); 
  port ( -- 
    opcode : in  std_logic_vector(7 downto 0);
    rd1 : in  std_logic_vector(31 downto 0);
    rd2 : in  std_logic_vector(31 downto 0);
    program_cnt : in  std_logic_vector(7 downto 0);
    is_rs1_neg : in  std_logic_vector(0 downto 0);
    n_program_cnt : out  std_logic_vector(7 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity cal_Next_program_cnt;
architecture cal_Next_program_cnt_arch of cal_Next_program_cnt is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 81)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 8)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal opcode_buffer :  std_logic_vector(7 downto 0);
  signal opcode_update_enable: Boolean;
  signal rd1_buffer :  std_logic_vector(31 downto 0);
  signal rd1_update_enable: Boolean;
  signal rd2_buffer :  std_logic_vector(31 downto 0);
  signal rd2_update_enable: Boolean;
  signal program_cnt_buffer :  std_logic_vector(7 downto 0);
  signal program_cnt_update_enable: Boolean;
  signal is_rs1_neg_buffer :  std_logic_vector(0 downto 0);
  signal is_rs1_neg_update_enable: Boolean;
  -- output port buffer signals
  signal n_program_cnt_buffer :  std_logic_vector(7 downto 0);
  signal n_program_cnt_update_enable: Boolean;
  signal cal_Next_program_cnt_CP_0_start: Boolean;
  signal cal_Next_program_cnt_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "cal_Next_program_cnt_input_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      bypass_flag => false,
      data_width => tag_length + 81) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(7 downto 0) <= opcode;
  opcode_buffer <= in_buffer_data_out(7 downto 0);
  in_buffer_data_in(39 downto 8) <= rd1;
  rd1_buffer <= in_buffer_data_out(39 downto 8);
  in_buffer_data_in(71 downto 40) <= rd2;
  rd2_buffer <= in_buffer_data_out(71 downto 40);
  in_buffer_data_in(79 downto 72) <= program_cnt;
  program_cnt_buffer <= in_buffer_data_out(79 downto 72);
  in_buffer_data_in(80 downto 80) <= is_rs1_neg;
  is_rs1_neg_buffer <= in_buffer_data_out(80 downto 80);
  in_buffer_data_in(tag_length + 80 downto 81) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 80 downto 81);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  cal_Next_program_cnt_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "cal_Next_program_cnt_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 8) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(7 downto 0) <= n_program_cnt_buffer;
  n_program_cnt <= out_buffer_data_out(7 downto 0);
  out_buffer_data_in(tag_length + 7 downto 8) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 7 downto 8);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= cal_Next_program_cnt_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= cal_Next_program_cnt_CP_0_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= cal_Next_program_cnt_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  cal_Next_program_cnt_CP_0: Block -- control-path 
    signal cal_Next_program_cnt_CP_0_elements: BooleanArray(0 downto 0);
    -- 
  begin -- 
    cal_Next_program_cnt_CP_0_elements(0) <= cal_Next_program_cnt_CP_0_start;
    cal_Next_program_cnt_CP_0_symbol <= cal_Next_program_cnt_CP_0_elements(0);
    -- CP-element group 0:  transition  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0:  members (4) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 $exit
      -- CP-element group 0: 	 assign_stmt_140_to_assign_stmt_191/$entry
      -- CP-element group 0: 	 assign_stmt_140_to_assign_stmt_191/$exit
      -- 
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal ADD_u8_u8_186_wire : std_logic_vector(7 downto 0);
    signal AND_u1_u1_133_wire : std_logic_vector(0 downto 0);
    signal AND_u1_u1_138_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_177_wire : std_logic_vector(0 downto 0);
    signal EQ_u1_u1_183_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_130_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_136_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_145_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_149_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_164_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_170_wire : std_logic_vector(0 downto 0);
    signal MUX_167_wire : std_logic_vector(7 downto 0);
    signal MUX_173_wire : std_logic_vector(7 downto 0);
    signal MUX_180_wire : std_logic_vector(7 downto 0);
    signal MUX_188_wire : std_logic_vector(7 downto 0);
    signal NOT_u1_u1_132_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_146_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_150_wire : std_logic_vector(0 downto 0);
    signal OR_u8_u8_174_wire : std_logic_vector(7 downto 0);
    signal OR_u8_u8_189_wire : std_logic_vector(7 downto 0);
    signal R_BN_135_wire_constant : std_logic_vector(7 downto 0);
    signal R_BZ_129_wire_constant : std_logic_vector(7 downto 0);
    signal R_CALL_144_wire_constant : std_logic_vector(7 downto 0);
    signal R_CALL_163_wire_constant : std_logic_vector(7 downto 0);
    signal R_JMP_148_wire_constant : std_logic_vector(7 downto 0);
    signal R_JMP_169_wire_constant : std_logic_vector(7 downto 0);
    signal R_one_1_176_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_1_182_wire_constant : std_logic_vector(0 downto 0);
    signal addr1_156 : std_logic_vector(7 downto 0);
    signal addr2_160 : std_logic_vector(7 downto 0);
    signal is_Branch_140 : std_logic_vector(0 downto 0);
    signal konst_166_wire_constant : std_logic_vector(7 downto 0);
    signal konst_172_wire_constant : std_logic_vector(7 downto 0);
    signal konst_179_wire_constant : std_logic_vector(7 downto 0);
    signal konst_185_wire_constant : std_logic_vector(7 downto 0);
    signal konst_187_wire_constant : std_logic_vector(7 downto 0);
    signal normalFlow_152 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    R_BN_135_wire_constant <= "00001111";
    R_BZ_129_wire_constant <= "00001110";
    R_CALL_144_wire_constant <= "00010000";
    R_CALL_163_wire_constant <= "00010000";
    R_JMP_148_wire_constant <= "00010001";
    R_JMP_169_wire_constant <= "00010001";
    R_one_1_176_wire_constant <= "1";
    R_one_1_182_wire_constant <= "1";
    konst_166_wire_constant <= "00000000";
    konst_172_wire_constant <= "00000000";
    konst_179_wire_constant <= "00000000";
    konst_185_wire_constant <= "00000001";
    konst_187_wire_constant <= "00000000";
    -- flow-through select operator MUX_167_inst
    MUX_167_wire <= addr1_156 when (EQ_u8_u1_164_wire(0) /=  '0') else konst_166_wire_constant;
    -- flow-through select operator MUX_173_inst
    MUX_173_wire <= addr1_156 when (EQ_u8_u1_170_wire(0) /=  '0') else konst_172_wire_constant;
    -- flow-through select operator MUX_180_inst
    MUX_180_wire <= addr2_160 when (EQ_u1_u1_177_wire(0) /=  '0') else konst_179_wire_constant;
    -- flow-through select operator MUX_188_inst
    MUX_188_wire <= ADD_u8_u8_186_wire when (EQ_u1_u1_183_wire(0) /=  '0') else konst_187_wire_constant;
    -- flow-through slice operator slice_155_inst
    addr1_156 <= rd1_buffer(7 downto 0);
    -- flow-through slice operator slice_159_inst
    addr2_160 <= rd2_buffer(7 downto 0);
    -- binary operator ADD_u8_u8_186_inst
    process(program_cnt_buffer) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntAdd_proc(program_cnt_buffer, konst_185_wire_constant, tmp_var);
      ADD_u8_u8_186_wire <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_133_inst
    process(EQ_u8_u1_130_wire, NOT_u1_u1_132_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u8_u1_130_wire, NOT_u1_u1_132_wire, tmp_var);
      AND_u1_u1_133_wire <= tmp_var; --
    end process;
    -- binary operator AND_u1_u1_138_inst
    process(EQ_u8_u1_136_wire, is_rs1_neg_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntAnd_proc(EQ_u8_u1_136_wire, is_rs1_neg_buffer, tmp_var);
      AND_u1_u1_138_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_177_inst
    process(is_Branch_140) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(is_Branch_140, R_one_1_176_wire_constant, tmp_var);
      EQ_u1_u1_177_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u1_u1_183_inst
    process(normalFlow_152) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(normalFlow_152, R_one_1_182_wire_constant, tmp_var);
      EQ_u1_u1_183_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_130_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_BZ_129_wire_constant, tmp_var);
      EQ_u8_u1_130_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_136_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_BN_135_wire_constant, tmp_var);
      EQ_u8_u1_136_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_145_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_CALL_144_wire_constant, tmp_var);
      EQ_u8_u1_145_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_149_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_JMP_148_wire_constant, tmp_var);
      EQ_u8_u1_149_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_164_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_CALL_163_wire_constant, tmp_var);
      EQ_u8_u1_164_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_170_inst
    process(opcode_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_buffer, R_JMP_169_wire_constant, tmp_var);
      EQ_u8_u1_170_wire <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_132_inst
    process(is_rs1_neg_buffer) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", is_rs1_neg_buffer, tmp_var);
      NOT_u1_u1_132_wire <= tmp_var; -- 
    end process;
    -- unary operator NOT_u1_u1_151_inst
    process(OR_u1_u1_150_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", OR_u1_u1_150_wire, tmp_var);
      normalFlow_152 <= tmp_var; -- 
    end process;
    -- binary operator OR_u1_u1_139_inst
    process(AND_u1_u1_133_wire, AND_u1_u1_138_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(AND_u1_u1_133_wire, AND_u1_u1_138_wire, tmp_var);
      is_Branch_140 <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_146_inst
    process(is_Branch_140, EQ_u8_u1_145_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(is_Branch_140, EQ_u8_u1_145_wire, tmp_var);
      OR_u1_u1_146_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_150_inst
    process(OR_u1_u1_146_wire, EQ_u8_u1_149_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_146_wire, EQ_u8_u1_149_wire, tmp_var);
      OR_u1_u1_150_wire <= tmp_var; --
    end process;
    -- binary operator OR_u8_u8_174_inst
    process(MUX_167_wire, MUX_173_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_167_wire, MUX_173_wire, tmp_var);
      OR_u8_u8_174_wire <= tmp_var; --
    end process;
    -- binary operator OR_u8_u8_189_inst
    process(MUX_180_wire, MUX_188_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_180_wire, MUX_188_wire, tmp_var);
      OR_u8_u8_189_wire <= tmp_var; --
    end process;
    -- binary operator OR_u8_u8_190_inst
    process(OR_u8_u8_174_wire, OR_u8_u8_189_wire) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u8_u8_174_wire, OR_u8_u8_189_wire, tmp_var);
      n_program_cnt_buffer <= tmp_var; --
    end process;
    -- 
  end Block; -- data_path
  -- 
end cal_Next_program_cnt_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity processor is -- 
  generic (tag_length : integer); 
  port ( -- 
    mem_out_pipe_read_req : out  std_logic_vector(0 downto 0);
    mem_out_pipe_read_ack : in   std_logic_vector(0 downto 0);
    mem_out_pipe_read_data : in   std_logic_vector(31 downto 0);
    start_processor : in std_logic_vector(7 downto 0);
    mem_in_pipe_write_req : out  std_logic_vector(0 downto 0);
    mem_in_pipe_write_ack : in   std_logic_vector(0 downto 0);
    mem_in_pipe_write_data : out  std_logic_vector(63 downto 0);
    cal_Next_program_cnt_call_reqs : out  std_logic_vector(0 downto 0);
    cal_Next_program_cnt_call_acks : in   std_logic_vector(0 downto 0);
    cal_Next_program_cnt_call_data : out  std_logic_vector(80 downto 0);
    cal_Next_program_cnt_call_tag  :  out  std_logic_vector(0 downto 0);
    cal_Next_program_cnt_return_reqs : out  std_logic_vector(0 downto 0);
    cal_Next_program_cnt_return_acks : in   std_logic_vector(0 downto 0);
    cal_Next_program_cnt_return_data : in   std_logic_vector(7 downto 0);
    cal_Next_program_cnt_return_tag :  in   std_logic_vector(0 downto 0);
    registerFileModule_call_reqs : out  std_logic_vector(0 downto 0);
    registerFileModule_call_acks : in   std_logic_vector(0 downto 0);
    registerFileModule_call_data : out  std_logic_vector(58 downto 0);
    registerFileModule_call_tag  :  out  std_logic_vector(1 downto 0);
    registerFileModule_return_reqs : out  std_logic_vector(0 downto 0);
    registerFileModule_return_acks : in   std_logic_vector(0 downto 0);
    registerFileModule_return_data : in   std_logic_vector(63 downto 0);
    registerFileModule_return_tag :  in   std_logic_vector(1 downto 0);
    send_to_uart_call_reqs : out  std_logic_vector(0 downto 0);
    send_to_uart_call_acks : in   std_logic_vector(0 downto 0);
    send_to_uart_call_data : out  std_logic_vector(31 downto 0);
    send_to_uart_call_tag  :  out  std_logic_vector(0 downto 0);
    send_to_uart_return_reqs : out  std_logic_vector(0 downto 0);
    send_to_uart_return_acks : in   std_logic_vector(0 downto 0);
    send_to_uart_return_tag :  in   std_logic_vector(0 downto 0);
    receive_from_uart_call_reqs : out  std_logic_vector(0 downto 0);
    receive_from_uart_call_acks : in   std_logic_vector(0 downto 0);
    receive_from_uart_call_tag  :  out  std_logic_vector(0 downto 0);
    receive_from_uart_return_reqs : out  std_logic_vector(0 downto 0);
    receive_from_uart_return_acks : in   std_logic_vector(0 downto 0);
    receive_from_uart_return_data : in   std_logic_vector(31 downto 0);
    receive_from_uart_return_tag :  in   std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity processor;
architecture processor_arch of processor is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal processor_CP_545_start: Boolean;
  signal processor_CP_545_symbol: Boolean;
  -- volatile/operator module components. 
  component cal_Next_program_cnt is -- 
    generic (tag_length : integer); 
    port ( -- 
      opcode : in  std_logic_vector(7 downto 0);
      rd1 : in  std_logic_vector(31 downto 0);
      rd2 : in  std_logic_vector(31 downto 0);
      program_cnt : in  std_logic_vector(7 downto 0);
      is_rs1_neg : in  std_logic_vector(0 downto 0);
      n_program_cnt : out  std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component registerFileModule is -- 
    generic (tag_length : integer); 
    port ( -- 
      valid_1 : in  std_logic_vector(0 downto 0);
      addr_1 : in  std_logic_vector(7 downto 0);
      valid_2 : in  std_logic_vector(0 downto 0);
      addr_2 : in  std_logic_vector(7 downto 0);
      valid_w : in  std_logic_vector(0 downto 0);
      addr_w : in  std_logic_vector(7 downto 0);
      data_to_be_written : in  std_logic_vector(31 downto 0);
      read_data_1 : out  std_logic_vector(31 downto 0);
      read_data_2 : out  std_logic_vector(31 downto 0);
      memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lr_addr : out  std_logic_vector(5 downto 0);
      memory_space_0_lr_tag :  out  std_logic_vector(18 downto 0);
      memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lc_data : in   std_logic_vector(31 downto 0);
      memory_space_0_lc_tag :  in  std_logic_vector(1 downto 0);
      memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sr_addr : out  std_logic_vector(5 downto 0);
      memory_space_0_sr_data : out  std_logic_vector(31 downto 0);
      memory_space_0_sr_tag :  out  std_logic_vector(18 downto 0);
      memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sc_tag :  in  std_logic_vector(1 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component send_to_uart is -- 
    generic (tag_length : integer); 
    port ( -- 
      data_to_send : in  std_logic_vector(31 downto 0);
      out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_pipe_pipe_write_data : out  std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  component receive_from_uart is -- 
    generic (tag_length : integer); 
    port ( -- 
      receive_data_from_uart : out  std_logic_vector(31 downto 0);
      in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_pipe_pipe_read_data : in   std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- links between control-path and data-path
  signal EQ_u1_u1_696_inst_ack_1 : boolean;
  signal W_rs2_673_delayed_10_0_717_inst_req_1 : boolean;
  signal slice_639_inst_ack_1 : boolean;
  signal phi_stmt_326_ack_0 : boolean;
  signal W_regWrite_674_delayed_10_0_720_inst_ack_1 : boolean;
  signal phi_stmt_326_req_0 : boolean;
  signal phi_stmt_326_req_1 : boolean;
  signal W_rs1_imm_671_delayed_10_0_714_inst_req_1 : boolean;
  signal W_rs2_673_delayed_10_0_717_inst_req_0 : boolean;
  signal W_rd2_629_delayed_1_0_652_inst_req_1 : boolean;
  signal W_memWrite_625_delayed_8_0_649_inst_ack_0 : boolean;
  signal EQ_u8_u1_682_inst_req_1 : boolean;
  signal CONCAT_u9_u64_338_inst_req_0 : boolean;
  signal n_program_cnt_393_325_buf_req_0 : boolean;
  signal slice_639_inst_req_0 : boolean;
  signal MUX_706_inst_req_0 : boolean;
  signal W_rd_675_delayed_10_0_723_inst_ack_1 : boolean;
  signal phi_stmt_322_req_1 : boolean;
  signal EQ_u1_u1_696_inst_ack_0 : boolean;
  signal MUX_748_inst_ack_1 : boolean;
  signal MUX_712_inst_ack_1 : boolean;
  signal n_program_cnt_393_325_buf_ack_0 : boolean;
  signal n_program_cnt_393_325_buf_req_1 : boolean;
  signal W_rd2_629_delayed_1_0_652_inst_req_0 : boolean;
  signal MUX_706_inst_req_1 : boolean;
  signal MUX_706_inst_ack_0 : boolean;
  signal EQ_u8_u1_687_inst_req_0 : boolean;
  signal EQ_u8_u1_687_inst_ack_0 : boolean;
  signal W_memWrite_625_delayed_8_0_649_inst_req_1 : boolean;
  signal if_stmt_315_branch_ack_1 : boolean;
  signal WPIPE_mem_in_331_inst_req_0 : boolean;
  signal WPIPE_mem_in_331_inst_ack_0 : boolean;
  signal WPIPE_mem_in_331_inst_req_1 : boolean;
  signal WPIPE_mem_in_331_inst_ack_1 : boolean;
  signal W_rd2_629_delayed_1_0_652_inst_ack_0 : boolean;
  signal phi_stmt_322_req_0 : boolean;
  signal type_cast_691_inst_req_0 : boolean;
  signal W_rs2_673_delayed_10_0_717_inst_ack_1 : boolean;
  signal W_regWrite_674_delayed_10_0_720_inst_req_0 : boolean;
  signal W_rs2_673_delayed_10_0_717_inst_ack_0 : boolean;
  signal W_rd2_629_delayed_1_0_652_inst_ack_1 : boolean;
  signal W_memWrite_625_delayed_8_0_649_inst_req_0 : boolean;
  signal type_cast_691_inst_ack_0 : boolean;
  signal n_carry_376_329_buf_ack_0 : boolean;
  signal W_rd_675_delayed_10_0_723_inst_req_0 : boolean;
  signal n_carry_376_329_buf_req_0 : boolean;
  signal EQ_u1_u1_696_inst_req_0 : boolean;
  signal MUX_748_inst_ack_0 : boolean;
  signal call_stmt_751_call_req_0 : boolean;
  signal if_stmt_315_branch_req_0 : boolean;
  signal W_cmd_312_inst_ack_1 : boolean;
  signal W_rd_675_delayed_10_0_723_inst_ack_0 : boolean;
  signal EQ_u8_u1_682_inst_ack_1 : boolean;
  signal W_rd_675_delayed_10_0_723_inst_req_1 : boolean;
  signal slice_639_inst_ack_0 : boolean;
  signal W_memWrite_625_delayed_8_0_649_inst_ack_1 : boolean;
  signal W_cmd_312_inst_ack_0 : boolean;
  signal W_cmd_312_inst_req_0 : boolean;
  signal W_cmd_312_inst_req_1 : boolean;
  signal W_regWrite_674_delayed_10_0_720_inst_ack_0 : boolean;
  signal slice_639_inst_req_1 : boolean;
  signal CONCAT_u9_u64_338_inst_ack_0 : boolean;
  signal CONCAT_u9_u64_338_inst_req_1 : boolean;
  signal n_program_cnt_393_325_buf_ack_1 : boolean;
  signal W_rs1_imm_671_delayed_10_0_714_inst_ack_1 : boolean;
  signal MUX_748_inst_req_1 : boolean;
  signal do_while_stmt_320_branch_req_0 : boolean;
  signal if_stmt_315_branch_ack_0 : boolean;
  signal phi_stmt_322_ack_0 : boolean;
  signal CONCAT_u9_u64_338_inst_ack_1 : boolean;
  signal MUX_748_inst_req_0 : boolean;
  signal MUX_706_inst_ack_1 : boolean;
  signal EQ_u8_u1_682_inst_req_0 : boolean;
  signal RPIPE_mem_out_341_inst_req_1 : boolean;
  signal RPIPE_mem_out_341_inst_ack_1 : boolean;
  signal type_cast_691_inst_req_1 : boolean;
  signal EQ_u8_u1_682_inst_ack_0 : boolean;
  signal RPIPE_mem_out_341_inst_req_0 : boolean;
  signal RPIPE_mem_out_341_inst_ack_0 : boolean;
  signal call_stmt_751_call_ack_1 : boolean;
  signal type_cast_691_inst_ack_1 : boolean;
  signal CONCAT_u9_u64_663_inst_ack_1 : boolean;
  signal n_carry_376_329_buf_req_1 : boolean;
  signal n_carry_376_329_buf_ack_1 : boolean;
  signal EQ_u1_u1_696_inst_req_1 : boolean;
  signal CONCAT_u9_u64_663_inst_req_1 : boolean;
  signal CONCAT_u9_u64_663_inst_req_0 : boolean;
  signal CONCAT_u9_u64_663_inst_ack_0 : boolean;
  signal EQ_u8_u1_687_inst_req_1 : boolean;
  signal EQ_u8_u1_687_inst_ack_1 : boolean;
  signal call_stmt_751_call_req_1 : boolean;
  signal MUX_712_inst_req_1 : boolean;
  signal call_stmt_368_call_req_0 : boolean;
  signal call_stmt_368_call_ack_0 : boolean;
  signal call_stmt_368_call_req_1 : boolean;
  signal call_stmt_368_call_ack_1 : boolean;
  signal MUX_375_inst_req_0 : boolean;
  signal MUX_375_inst_ack_0 : boolean;
  signal MUX_375_inst_req_1 : boolean;
  signal MUX_375_inst_ack_1 : boolean;
  signal W_opcode_400_delayed_7_0_381_inst_req_0 : boolean;
  signal W_opcode_400_delayed_7_0_381_inst_ack_0 : boolean;
  signal call_stmt_671_call_ack_1 : boolean;
  signal W_opcode_400_delayed_7_0_381_inst_req_1 : boolean;
  signal W_opcode_400_delayed_7_0_381_inst_ack_1 : boolean;
  signal W_rd2_684_delayed_3_0_741_inst_ack_1 : boolean;
  signal call_stmt_671_call_req_1 : boolean;
  signal W_program_cnt_403_delayed_7_0_384_inst_req_0 : boolean;
  signal W_program_cnt_403_delayed_7_0_384_inst_ack_0 : boolean;
  signal W_program_cnt_403_delayed_7_0_384_inst_req_1 : boolean;
  signal W_program_cnt_403_delayed_7_0_384_inst_ack_1 : boolean;
  signal W_rd2_684_delayed_3_0_741_inst_req_1 : boolean;
  signal call_stmt_751_call_ack_0 : boolean;
  signal W_rs1_imm_671_delayed_10_0_714_inst_ack_0 : boolean;
  signal call_stmt_393_call_req_0 : boolean;
  signal call_stmt_393_call_ack_0 : boolean;
  signal call_stmt_671_call_ack_0 : boolean;
  signal call_stmt_393_call_req_1 : boolean;
  signal call_stmt_393_call_ack_1 : boolean;
  signal W_rd2_684_delayed_3_0_741_inst_ack_0 : boolean;
  signal W_rs1_imm_671_delayed_10_0_714_inst_req_0 : boolean;
  signal call_stmt_671_call_req_0 : boolean;
  signal EQ_u8_u1_402_inst_req_0 : boolean;
  signal EQ_u8_u1_402_inst_ack_0 : boolean;
  signal EQ_u8_u1_402_inst_req_1 : boolean;
  signal EQ_u8_u1_402_inst_ack_1 : boolean;
  signal W_rd2_684_delayed_3_0_741_inst_req_0 : boolean;
  signal EQ_u8_u1_407_inst_req_0 : boolean;
  signal EQ_u8_u1_407_inst_ack_0 : boolean;
  signal EQ_u8_u1_407_inst_req_1 : boolean;
  signal EQ_u8_u1_407_inst_ack_1 : boolean;
  signal MUX_417_inst_req_0 : boolean;
  signal MUX_417_inst_ack_0 : boolean;
  signal MUX_417_inst_req_1 : boolean;
  signal MUX_417_inst_ack_1 : boolean;
  signal MUX_712_inst_ack_0 : boolean;
  signal EQ_u8_u1_422_inst_req_0 : boolean;
  signal EQ_u8_u1_422_inst_ack_0 : boolean;
  signal RPIPE_mem_out_667_inst_ack_1 : boolean;
  signal EQ_u8_u1_422_inst_req_1 : boolean;
  signal EQ_u8_u1_422_inst_ack_1 : boolean;
  signal EQ_u8_u1_739_inst_ack_1 : boolean;
  signal EQ_u8_u1_739_inst_req_1 : boolean;
  signal MUX_712_inst_req_0 : boolean;
  signal RPIPE_mem_out_667_inst_req_1 : boolean;
  signal EQ_u8_u1_427_inst_req_0 : boolean;
  signal EQ_u8_u1_427_inst_ack_0 : boolean;
  signal EQ_u8_u1_427_inst_req_1 : boolean;
  signal EQ_u8_u1_427_inst_ack_1 : boolean;
  signal EQ_u8_u1_432_inst_req_0 : boolean;
  signal EQ_u8_u1_432_inst_ack_0 : boolean;
  signal RPIPE_mem_out_667_inst_ack_0 : boolean;
  signal EQ_u8_u1_432_inst_req_1 : boolean;
  signal EQ_u8_u1_432_inst_ack_1 : boolean;
  signal EQ_u8_u1_739_inst_ack_0 : boolean;
  signal EQ_u8_u1_739_inst_req_0 : boolean;
  signal RPIPE_mem_out_667_inst_req_0 : boolean;
  signal EQ_u8_u1_437_inst_req_0 : boolean;
  signal EQ_u8_u1_437_inst_ack_0 : boolean;
  signal EQ_u8_u1_437_inst_req_1 : boolean;
  signal EQ_u8_u1_437_inst_ack_1 : boolean;
  signal EQ_u8_u1_442_inst_req_0 : boolean;
  signal EQ_u8_u1_442_inst_ack_0 : boolean;
  signal EQ_u8_u1_442_inst_req_1 : boolean;
  signal EQ_u8_u1_442_inst_ack_1 : boolean;
  signal do_while_stmt_320_branch_ack_1 : boolean;
  signal EQ_u8_u1_447_inst_req_0 : boolean;
  signal EQ_u8_u1_447_inst_ack_0 : boolean;
  signal EQ_u8_u1_447_inst_req_1 : boolean;
  signal EQ_u8_u1_447_inst_ack_1 : boolean;
  signal call_stmt_735_call_ack_1 : boolean;
  signal call_stmt_735_call_req_1 : boolean;
  signal EQ_u8_u1_452_inst_req_0 : boolean;
  signal EQ_u8_u1_452_inst_ack_0 : boolean;
  signal WPIPE_mem_in_656_inst_ack_1 : boolean;
  signal EQ_u8_u1_452_inst_req_1 : boolean;
  signal EQ_u8_u1_452_inst_ack_1 : boolean;
  signal call_stmt_735_call_ack_0 : boolean;
  signal WPIPE_mem_in_656_inst_req_1 : boolean;
  signal EQ_u8_u1_457_inst_req_0 : boolean;
  signal EQ_u8_u1_457_inst_ack_0 : boolean;
  signal EQ_u8_u1_457_inst_req_1 : boolean;
  signal EQ_u8_u1_457_inst_ack_1 : boolean;
  signal call_stmt_735_call_req_0 : boolean;
  signal EQ_u8_u1_462_inst_req_0 : boolean;
  signal EQ_u8_u1_462_inst_ack_0 : boolean;
  signal WPIPE_mem_in_656_inst_ack_0 : boolean;
  signal EQ_u8_u1_462_inst_req_1 : boolean;
  signal EQ_u8_u1_462_inst_ack_1 : boolean;
  signal do_while_stmt_320_branch_ack_0 : boolean;
  signal W_regWrite_674_delayed_10_0_720_inst_req_1 : boolean;
  signal WPIPE_mem_in_656_inst_req_0 : boolean;
  signal OR_u32_u32_562_inst_req_0 : boolean;
  signal OR_u32_u32_562_inst_ack_0 : boolean;
  signal OR_u32_u32_562_inst_req_1 : boolean;
  signal OR_u32_u32_562_inst_ack_1 : boolean;
  signal EQ_u8_u1_567_inst_req_0 : boolean;
  signal EQ_u8_u1_567_inst_ack_0 : boolean;
  signal EQ_u8_u1_567_inst_req_1 : boolean;
  signal EQ_u8_u1_567_inst_ack_1 : boolean;
  signal W_carry_549_delayed_8_0_569_inst_req_0 : boolean;
  signal W_carry_549_delayed_8_0_569_inst_ack_0 : boolean;
  signal W_carry_549_delayed_8_0_569_inst_req_1 : boolean;
  signal W_carry_549_delayed_8_0_569_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "processor_input_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  processor_CP_545_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "processor_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= processor_CP_545_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= processor_CP_545_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= processor_CP_545_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  processor_CP_545: Block -- control-path 
    signal processor_CP_545_elements: BooleanArray(239 downto 0);
    -- 
  begin -- 
    processor_CP_545_elements(0) <= processor_CP_545_start;
    processor_CP_545_symbol <= processor_CP_545_elements(4);
    -- CP-element group 0:  branch  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	239 
    -- CP-element group 0:  members (7) 
      -- CP-element group 0: 	 branch_block_stmt_310/merge_stmt_311__entry__
      -- CP-element group 0: 	 branch_block_stmt_310/branch_block_stmt_310__entry__
      -- CP-element group 0: 	 branch_block_stmt_310/$entry
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_310/merge_stmt_311__entry___PhiReq/$exit
      -- CP-element group 0: 	 branch_block_stmt_310/merge_stmt_311_dead_link/$entry
      -- CP-element group 0: 	 branch_block_stmt_310/merge_stmt_311__entry___PhiReq/$entry
      -- 
    -- CP-element group 1:  transition  input  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	239 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_sample_completed_
      -- CP-element group 1: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Sample/$exit
      -- CP-element group 1: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Sample/ack
      -- 
    ack_584_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_cmd_312_inst_ack_0, ack => processor_CP_545_elements(1)); -- 
    -- CP-element group 2:  branch  transition  place  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	239 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	3 
    -- CP-element group 2: 	4 
    -- CP-element group 2:  members (27) 
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_if_link/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_dead_link/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_update_completed_
      -- CP-element group 2: 	 branch_block_stmt_310/assign_stmt_314/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Update/ca
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315__entry__
      -- CP-element group 2: 	 branch_block_stmt_310/assign_stmt_314__exit__
      -- CP-element group 2: 	 branch_block_stmt_310/EQ_u8_u1_318_place
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Sample/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Sample/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/branch_req
      -- CP-element group 2: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Update/ack
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/EQ_u8_u1_318_inputs/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/EQ_u8_u1_318_inputs/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Update/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Update/cr
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Update/$entry
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Update/$exit
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Sample/ra
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_eval_test/EQ_u8_u1_318/SplitProtocol/Sample/rr
      -- CP-element group 2: 	 branch_block_stmt_310/if_stmt_315_else_link/$entry
      -- 
    ack_589_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_cmd_312_inst_ack_1, ack => processor_CP_545_elements(2)); -- 
    branch_req_616_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " branch_req_616_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(2), ack => if_stmt_315_branch_req_0); -- 
    -- CP-element group 3:  transition  place  input  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	2 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	6 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 branch_block_stmt_310/if_stmt_315_if_link/$exit
      -- CP-element group 3: 	 branch_block_stmt_310/branch_block_stmt_319__entry__
      -- CP-element group 3: 	 branch_block_stmt_310/if_stmt_315_if_link/if_choice_transition
      -- CP-element group 3: 	 branch_block_stmt_310/branch_block_stmt_319/branch_block_stmt_319__entry__
      -- CP-element group 3: 	 branch_block_stmt_310/branch_block_stmt_319/$entry
      -- CP-element group 3: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320__entry__
      -- 
    if_choice_transition_621_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_315_branch_ack_1, ack => processor_CP_545_elements(3)); -- 
    -- CP-element group 4:  merge  transition  place  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	2 
    -- CP-element group 4: successors 
    -- CP-element group 4:  members (6) 
      -- CP-element group 4: 	 branch_block_stmt_310/if_stmt_315__exit__
      -- CP-element group 4: 	 branch_block_stmt_310/branch_block_stmt_310__exit__
      -- CP-element group 4: 	 branch_block_stmt_310/$exit
      -- CP-element group 4: 	 $exit
      -- CP-element group 4: 	 branch_block_stmt_310/if_stmt_315_else_link/else_choice_transition
      -- CP-element group 4: 	 branch_block_stmt_310/if_stmt_315_else_link/$exit
      -- 
    else_choice_transition_625_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_315_branch_ack_0, ack => processor_CP_545_elements(4)); -- 
    -- CP-element group 5:  transition  place  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	238 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	239 
    -- CP-element group 5:  members (7) 
      -- CP-element group 5: 	 branch_block_stmt_310/check_for_start_PhiReq/$exit
      -- CP-element group 5: 	 branch_block_stmt_310/check_for_start_PhiReq/$entry
      -- CP-element group 5: 	 branch_block_stmt_310/branch_block_stmt_319__exit__
      -- CP-element group 5: 	 branch_block_stmt_310/branch_block_stmt_319/branch_block_stmt_319__exit__
      -- CP-element group 5: 	 branch_block_stmt_310/branch_block_stmt_319/$exit
      -- CP-element group 5: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320__exit__
      -- CP-element group 5: 	 branch_block_stmt_310/check_for_start
      -- 
    processor_CP_545_elements(5) <= processor_CP_545_elements(238);
    -- CP-element group 6:  transition  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	3 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	12 
    -- CP-element group 6:  members (2) 
      -- CP-element group 6: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320__entry__
      -- CP-element group 6: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/$entry
      -- 
    processor_CP_545_elements(6) <= processor_CP_545_elements(3);
    -- CP-element group 7:  merge  place  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	238 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320__exit__
      -- 
    -- Element group processor_CP_545_elements(7) is bound as output of CP function.
    -- CP-element group 8:  merge  place  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	11 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_back
      -- 
    -- Element group processor_CP_545_elements(8) is bound as output of CP function.
    -- CP-element group 9:  branch  transition  place  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	14 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	236 
    -- CP-element group 9: 	237 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/condition_done
      -- CP-element group 9: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_exit/$entry
      -- CP-element group 9: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_taken/$entry
      -- 
    processor_CP_545_elements(9) <= processor_CP_545_elements(14);
    -- CP-element group 10:  branch  place  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	235 
    -- CP-element group 10: successors 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_body_done
      -- 
    processor_CP_545_elements(10) <= processor_CP_545_elements(235);
    -- CP-element group 11:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	8 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	42 
    -- CP-element group 11: 	25 
    -- CP-element group 11:  members (1) 
      -- CP-element group 11: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/back_edge_to_loop_body
      -- 
    processor_CP_545_elements(11) <= processor_CP_545_elements(8);
    -- CP-element group 12:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	6 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	27 
    -- CP-element group 12: 	44 
    -- CP-element group 12:  members (1) 
      -- CP-element group 12: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/first_time_through_loop_body
      -- 
    processor_CP_545_elements(12) <= processor_CP_545_elements(6);
    -- CP-element group 13:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	20 
    -- CP-element group 13: 	19 
    -- CP-element group 13: 	62 
    -- CP-element group 13: 	39 
    -- CP-element group 13: 	38 
    -- CP-element group 13: 	233 
    -- CP-element group 13:  members (2) 
      -- CP-element group 13: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/loop_body_start
      -- CP-element group 13: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/$entry
      -- 
    -- Element group processor_CP_545_elements(13) is bound as output of CP function.
    -- CP-element group 14:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	18 
    -- CP-element group 14: 	65 
    -- CP-element group 14: 	233 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	9 
    -- CP-element group 14:  members (1) 
      -- CP-element group 14: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/condition_evaluated
      -- 
    condition_evaluated_650_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " condition_evaluated_650_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(14), ack => do_while_stmt_320_branch_req_0); -- 
    processor_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 20,1 => 20,2 => 20);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 0);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(18) & processor_CP_545_elements(65) & processor_CP_545_elements(233);
      gj_processor_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	19 
    -- CP-element group 15: 	38 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	18 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	21 
    -- CP-element group 15:  members (2) 
      -- CP-element group 15: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_sample_start__ps
      -- CP-element group 15: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/aggregated_phi_sample_req
      -- 
    processor_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 20,1 => 20,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(19) & processor_CP_545_elements(38) & processor_CP_545_elements(18);
      gj_processor_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	40 
    -- CP-element group 16: 	22 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	83 
    -- CP-element group 16: 	71 
    -- CP-element group 16: marked-successors 
    -- CP-element group 16: 	19 
    -- CP-element group 16: 	38 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_sample_completed_
      -- CP-element group 16: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_sample_completed_
      -- CP-element group 16: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/aggregated_phi_sample_ack
      -- 
    processor_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 20);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(40) & processor_CP_545_elements(22);
      gj_processor_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	20 
    -- CP-element group 17: 	39 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	23 
    -- CP-element group 17:  members (2) 
      -- CP-element group 17: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_update_start__ps
      -- CP-element group 17: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/aggregated_phi_update_req
      -- 
    processor_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 20);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(20) & processor_CP_545_elements(39);
      gj_processor_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	41 
    -- CP-element group 18: 	24 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	14 
    -- CP-element group 18: marked-successors 
    -- CP-element group 18: 	15 
    -- CP-element group 18:  members (1) 
      -- CP-element group 18: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/aggregated_phi_update_ack
      -- 
    processor_cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 20);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_18"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(41) & processor_CP_545_elements(24);
      gj_processor_cp_element_group_18 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19:  join  transition  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	13 
    -- CP-element group 19: marked-predecessors 
    -- CP-element group 19: 	85 
    -- CP-element group 19: 	16 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	15 
    -- CP-element group 19:  members (1) 
      -- CP-element group 19: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_sample_start_
      -- 
    processor_cp_element_group_19: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 20,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_19"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(13) & processor_CP_545_elements(85) & processor_CP_545_elements(16);
      gj_processor_cp_element_group_19 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(19), clk => clk, reset => reset); --
    end block;
    -- CP-element group 20:  join  transition  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	13 
    -- CP-element group 20: marked-predecessors 
    -- CP-element group 20: 	80 
    -- CP-element group 20: 	57 
    -- CP-element group 20: 	24 
    -- CP-element group 20: 	72 
    -- CP-element group 20: 	183 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	17 
    -- CP-element group 20:  members (1) 
      -- CP-element group 20: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_update_start_
      -- 
    processor_cp_element_group_20: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 20,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_20"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= processor_CP_545_elements(13) & processor_CP_545_elements(80) & processor_CP_545_elements(57) & processor_CP_545_elements(24) & processor_CP_545_elements(72) & processor_CP_545_elements(183);
      gj_processor_cp_element_group_20 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(20), clk => clk, reset => reset); --
    end block;
    -- CP-element group 21:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	15 
    -- CP-element group 21: successors 
    -- CP-element group 21:  members (1) 
      -- CP-element group 21: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_sample_start__ps
      -- 
    processor_CP_545_elements(21) <= processor_CP_545_elements(15);
    -- CP-element group 22:  join  transition  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	16 
    -- CP-element group 22:  members (1) 
      -- CP-element group 22: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_sample_completed__ps
      -- 
    -- Element group processor_CP_545_elements(22) is bound as output of CP function.
    -- CP-element group 23:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	17 
    -- CP-element group 23: successors 
    -- CP-element group 23:  members (1) 
      -- CP-element group 23: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_update_start__ps
      -- 
    processor_CP_545_elements(23) <= processor_CP_545_elements(17);
    -- CP-element group 24:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	18 
    -- CP-element group 24: 	70 
    -- CP-element group 24: 	78 
    -- CP-element group 24: 	55 
    -- CP-element group 24: 	181 
    -- CP-element group 24: marked-successors 
    -- CP-element group 24: 	20 
    -- CP-element group 24:  members (2) 
      -- CP-element group 24: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_update_completed__ps
      -- CP-element group 24: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_update_completed_
      -- 
    -- Element group processor_CP_545_elements(24) is bound as output of CP function.
    -- CP-element group 25:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	11 
    -- CP-element group 25: successors 
    -- CP-element group 25:  members (1) 
      -- CP-element group 25: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_loopback_trigger
      -- 
    processor_CP_545_elements(25) <= processor_CP_545_elements(11);
    -- CP-element group 26:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: successors 
    -- CP-element group 26:  members (2) 
      -- CP-element group 26: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_loopback_sample_req_ps
      -- CP-element group 26: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_loopback_sample_req
      -- 
    phi_stmt_322_loopback_sample_req_665_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_322_loopback_sample_req_665_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(26), ack => phi_stmt_322_req_1); -- 
    -- Element group processor_CP_545_elements(26) is bound as output of CP function.
    -- CP-element group 27:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	12 
    -- CP-element group 27: successors 
    -- CP-element group 27:  members (1) 
      -- CP-element group 27: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_entry_trigger
      -- 
    processor_CP_545_elements(27) <= processor_CP_545_elements(12);
    -- CP-element group 28:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: successors 
    -- CP-element group 28:  members (2) 
      -- CP-element group 28: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_entry_sample_req
      -- CP-element group 28: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_entry_sample_req_ps
      -- 
    phi_stmt_322_entry_sample_req_668_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_322_entry_sample_req_668_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(28), ack => phi_stmt_322_req_0); -- 
    -- Element group processor_CP_545_elements(28) is bound as output of CP function.
    -- CP-element group 29:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: successors 
    -- CP-element group 29:  members (2) 
      -- CP-element group 29: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_phi_mux_ack_ps
      -- CP-element group 29: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_322_phi_mux_ack
      -- 
    phi_stmt_322_phi_mux_ack_671_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 29_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_322_ack_0, ack => processor_CP_545_elements(29)); -- 
    -- CP-element group 30:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: successors 
    -- CP-element group 30:  members (4) 
      -- CP-element group 30: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_sample_completed_
      -- CP-element group 30: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_sample_start_
      -- CP-element group 30: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_sample_completed__ps
      -- CP-element group 30: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_sample_start__ps
      -- 
    -- Element group processor_CP_545_elements(30) is bound as output of CP function.
    -- CP-element group 31:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	33 
    -- CP-element group 31:  members (2) 
      -- CP-element group 31: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_update_start_
      -- CP-element group 31: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_update_start__ps
      -- 
    -- Element group processor_CP_545_elements(31) is bound as output of CP function.
    -- CP-element group 32:  join  transition  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	33 
    -- CP-element group 32: successors 
    -- CP-element group 32:  members (1) 
      -- CP-element group 32: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_update_completed__ps
      -- 
    processor_CP_545_elements(32) <= processor_CP_545_elements(33);
    -- CP-element group 33:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	31 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	32 
    -- CP-element group 33:  members (1) 
      -- CP-element group 33: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/konst_324_update_completed_
      -- 
    -- Element group processor_CP_545_elements(33) is a control-delay.
    cp_element_33_delay: control_delay_element  generic map(name => " 33_delay", delay_value => 1)  port map(req => processor_CP_545_elements(31), ack => processor_CP_545_elements(33), clk => clk, reset =>reset);
    -- CP-element group 34:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (4) 
      -- CP-element group 34: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Sample/req
      -- CP-element group 34: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Sample/$entry
      -- CP-element group 34: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_sample_start_
      -- CP-element group 34: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_sample_start__ps
      -- 
    req_692_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_692_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(34), ack => n_program_cnt_393_325_buf_req_0); -- 
    -- Element group processor_CP_545_elements(34) is bound as output of CP function.
    -- CP-element group 35:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35:  members (4) 
      -- CP-element group 35: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Update/$entry
      -- CP-element group 35: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Update/req
      -- CP-element group 35: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_update_start_
      -- CP-element group 35: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_update_start__ps
      -- 
    req_697_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_697_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(35), ack => n_program_cnt_393_325_buf_req_1); -- 
    -- Element group processor_CP_545_elements(35) is bound as output of CP function.
    -- CP-element group 36:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36:  members (4) 
      -- CP-element group 36: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Sample/$exit
      -- CP-element group 36: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Sample/ack
      -- CP-element group 36: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_sample_completed_
      -- CP-element group 36: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_sample_completed__ps
      -- 
    ack_693_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 36_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_program_cnt_393_325_buf_ack_0, ack => processor_CP_545_elements(36)); -- 
    -- CP-element group 37:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37:  members (4) 
      -- CP-element group 37: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Update/$exit
      -- CP-element group 37: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_update_completed_
      -- CP-element group 37: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_update_completed__ps
      -- CP-element group 37: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_program_cnt_325_Update/ack
      -- 
    ack_698_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 37_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_program_cnt_393_325_buf_ack_1, ack => processor_CP_545_elements(37)); -- 
    -- CP-element group 38:  join  transition  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	13 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	16 
    -- CP-element group 38: 	73 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	15 
    -- CP-element group 38:  members (1) 
      -- CP-element group 38: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_sample_start_
      -- 
    processor_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 20,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(13) & processor_CP_545_elements(16) & processor_CP_545_elements(73);
      gj_processor_cp_element_group_38 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  join  transition  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	13 
    -- CP-element group 39: marked-predecessors 
    -- CP-element group 39: 	41 
    -- CP-element group 39: 	144 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	17 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_update_start_
      -- 
    processor_cp_element_group_39: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 20,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_39"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(13) & processor_CP_545_elements(41) & processor_CP_545_elements(144);
      gj_processor_cp_element_group_39 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(39), clk => clk, reset => reset); --
    end block;
    -- CP-element group 40:  join  transition  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	16 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_sample_completed__ps
      -- 
    -- Element group processor_CP_545_elements(40) is bound as output of CP function.
    -- CP-element group 41:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	18 
    -- CP-element group 41: 	142 
    -- CP-element group 41: marked-successors 
    -- CP-element group 41: 	39 
    -- CP-element group 41:  members (2) 
      -- CP-element group 41: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_update_completed_
      -- CP-element group 41: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_update_completed__ps
      -- 
    -- Element group processor_CP_545_elements(41) is bound as output of CP function.
    -- CP-element group 42:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	11 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_loopback_trigger
      -- 
    processor_CP_545_elements(42) <= processor_CP_545_elements(11);
    -- CP-element group 43:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (2) 
      -- CP-element group 43: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_loopback_sample_req_ps
      -- CP-element group 43: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_loopback_sample_req
      -- 
    phi_stmt_326_loopback_sample_req_709_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_326_loopback_sample_req_709_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(43), ack => phi_stmt_326_req_1); -- 
    -- Element group processor_CP_545_elements(43) is bound as output of CP function.
    -- CP-element group 44:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	12 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_entry_trigger
      -- 
    processor_CP_545_elements(44) <= processor_CP_545_elements(12);
    -- CP-element group 45:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (2) 
      -- CP-element group 45: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_entry_sample_req_ps
      -- CP-element group 45: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_entry_sample_req
      -- 
    phi_stmt_326_entry_sample_req_712_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " phi_stmt_326_entry_sample_req_712_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(45), ack => phi_stmt_326_req_0); -- 
    -- Element group processor_CP_545_elements(45) is bound as output of CP function.
    -- CP-element group 46:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_phi_mux_ack_ps
      -- CP-element group 46: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/phi_stmt_326_phi_mux_ack
      -- 
    phi_stmt_326_phi_mux_ack_715_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 46_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_326_ack_0, ack => processor_CP_545_elements(46)); -- 
    -- CP-element group 47:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: successors 
    -- CP-element group 47:  members (4) 
      -- CP-element group 47: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_sample_completed__ps
      -- CP-element group 47: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_sample_start_
      -- CP-element group 47: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_sample_completed_
      -- CP-element group 47: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_sample_start__ps
      -- 
    -- Element group processor_CP_545_elements(47) is bound as output of CP function.
    -- CP-element group 48:  join  fork  transition  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: successors 
    -- CP-element group 48: 	50 
    -- CP-element group 48:  members (2) 
      -- CP-element group 48: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_update_start__ps
      -- CP-element group 48: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_update_start_
      -- 
    -- Element group processor_CP_545_elements(48) is bound as output of CP function.
    -- CP-element group 49:  join  transition  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: 	50 
    -- CP-element group 49: successors 
    -- CP-element group 49:  members (1) 
      -- CP-element group 49: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_update_completed__ps
      -- 
    processor_CP_545_elements(49) <= processor_CP_545_elements(50);
    -- CP-element group 50:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: 	48 
    -- CP-element group 50: successors 
    -- CP-element group 50: 	49 
    -- CP-element group 50:  members (1) 
      -- CP-element group 50: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_zero_32_328_update_completed_
      -- 
    -- Element group processor_CP_545_elements(50) is a control-delay.
    cp_element_50_delay: control_delay_element  generic map(name => " 50_delay", delay_value => 1)  port map(req => processor_CP_545_elements(48), ack => processor_CP_545_elements(50), clk => clk, reset =>reset);
    -- CP-element group 51:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: successors 
    -- CP-element group 51: 	53 
    -- CP-element group 51:  members (4) 
      -- CP-element group 51: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_sample_start__ps
      -- CP-element group 51: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Sample/req
      -- CP-element group 51: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_sample_start_
      -- CP-element group 51: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Sample/$entry
      -- 
    req_736_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_736_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(51), ack => n_carry_376_329_buf_req_0); -- 
    -- Element group processor_CP_545_elements(51) is bound as output of CP function.
    -- CP-element group 52:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 52: predecessors 
    -- CP-element group 52: successors 
    -- CP-element group 52: 	54 
    -- CP-element group 52:  members (4) 
      -- CP-element group 52: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_update_start_
      -- CP-element group 52: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Update/$entry
      -- CP-element group 52: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_update_start__ps
      -- CP-element group 52: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Update/req
      -- 
    req_741_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_741_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(52), ack => n_carry_376_329_buf_req_1); -- 
    -- Element group processor_CP_545_elements(52) is bound as output of CP function.
    -- CP-element group 53:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 53: predecessors 
    -- CP-element group 53: 	51 
    -- CP-element group 53: successors 
    -- CP-element group 53:  members (4) 
      -- CP-element group 53: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_sample_completed__ps
      -- CP-element group 53: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_sample_completed_
      -- CP-element group 53: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Sample/ack
      -- CP-element group 53: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Sample/$exit
      -- 
    ack_737_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 53_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_carry_376_329_buf_ack_0, ack => processor_CP_545_elements(53)); -- 
    -- CP-element group 54:  join  transition  input  bypass  pipeline-parent 
    -- CP-element group 54: predecessors 
    -- CP-element group 54: 	52 
    -- CP-element group 54: successors 
    -- CP-element group 54:  members (4) 
      -- CP-element group 54: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_update_completed__ps
      -- CP-element group 54: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_update_completed_
      -- CP-element group 54: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Update/$exit
      -- CP-element group 54: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/R_n_carry_329_Update/ack
      -- 
    ack_742_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 54_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => n_carry_376_329_buf_ack_1, ack => processor_CP_545_elements(54)); -- 
    -- CP-element group 55:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 55: predecessors 
    -- CP-element group 55: 	24 
    -- CP-element group 55: marked-predecessors 
    -- CP-element group 55: 	57 
    -- CP-element group 55: successors 
    -- CP-element group 55: 	57 
    -- CP-element group 55:  members (3) 
      -- CP-element group 55: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Sample/$entry
      -- CP-element group 55: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Sample/rr
      -- CP-element group 55: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_sample_start_
      -- 
    rr_751_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_751_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(55), ack => CONCAT_u9_u64_338_inst_req_0); -- 
    processor_cp_element_group_55: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_55"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(24) & processor_CP_545_elements(57);
      gj_processor_cp_element_group_55 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(55), clk => clk, reset => reset); --
    end block;
    -- CP-element group 56:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 56: predecessors 
    -- CP-element group 56: marked-predecessors 
    -- CP-element group 56: 	60 
    -- CP-element group 56: 	58 
    -- CP-element group 56: successors 
    -- CP-element group 56: 	58 
    -- CP-element group 56:  members (3) 
      -- CP-element group 56: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_update_start_
      -- CP-element group 56: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Update/cr
      -- CP-element group 56: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Update/$entry
      -- 
    cr_756_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_756_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(56), ack => CONCAT_u9_u64_338_inst_req_1); -- 
    processor_cp_element_group_56: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_56"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(60) & processor_CP_545_elements(58);
      gj_processor_cp_element_group_56 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(56), clk => clk, reset => reset); --
    end block;
    -- CP-element group 57:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 57: predecessors 
    -- CP-element group 57: 	55 
    -- CP-element group 57: successors 
    -- CP-element group 57: marked-successors 
    -- CP-element group 57: 	20 
    -- CP-element group 57: 	55 
    -- CP-element group 57:  members (3) 
      -- CP-element group 57: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Sample/$exit
      -- CP-element group 57: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_sample_completed_
      -- CP-element group 57: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Sample/ra
      -- 
    ra_752_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 57_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u9_u64_338_inst_ack_0, ack => processor_CP_545_elements(57)); -- 
    -- CP-element group 58:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 58: predecessors 
    -- CP-element group 58: 	56 
    -- CP-element group 58: successors 
    -- CP-element group 58: 	59 
    -- CP-element group 58: marked-successors 
    -- CP-element group 58: 	56 
    -- CP-element group 58:  members (3) 
      -- CP-element group 58: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_update_completed_
      -- CP-element group 58: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Update/ca
      -- CP-element group 58: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_338_Update/$exit
      -- 
    ca_757_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 58_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u9_u64_338_inst_ack_1, ack => processor_CP_545_elements(58)); -- 
    -- CP-element group 59:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 59: predecessors 
    -- CP-element group 59: 	58 
    -- CP-element group 59: marked-predecessors 
    -- CP-element group 59: 	61 
    -- CP-element group 59: 	164 
    -- CP-element group 59: successors 
    -- CP-element group 59: 	60 
    -- CP-element group 59:  members (3) 
      -- CP-element group 59: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Sample/$entry
      -- CP-element group 59: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Sample/req
      -- CP-element group 59: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_sample_start_
      -- 
    req_765_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_765_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(59), ack => WPIPE_mem_in_331_inst_req_0); -- 
    processor_cp_element_group_59: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_59"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(58) & processor_CP_545_elements(61) & processor_CP_545_elements(164);
      gj_processor_cp_element_group_59 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(59), clk => clk, reset => reset); --
    end block;
    -- CP-element group 60:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 60: predecessors 
    -- CP-element group 60: 	59 
    -- CP-element group 60: successors 
    -- CP-element group 60: 	61 
    -- CP-element group 60: marked-successors 
    -- CP-element group 60: 	56 
    -- CP-element group 60:  members (6) 
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_sample_completed_
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_update_start_
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Sample/$exit
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Sample/ack
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Update/$entry
      -- CP-element group 60: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Update/req
      -- 
    ack_766_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 60_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mem_in_331_inst_ack_0, ack => processor_CP_545_elements(60)); -- 
    req_770_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_770_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(60), ack => WPIPE_mem_in_331_inst_req_1); -- 
    -- CP-element group 61:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 61: predecessors 
    -- CP-element group 61: 	60 
    -- CP-element group 61: successors 
    -- CP-element group 61: 	162 
    -- CP-element group 61: marked-successors 
    -- CP-element group 61: 	59 
    -- CP-element group 61:  members (3) 
      -- CP-element group 61: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_update_completed_
      -- CP-element group 61: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Update/$exit
      -- CP-element group 61: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_331_Update/ack
      -- 
    ack_771_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 61_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mem_in_331_inst_ack_1, ack => processor_CP_545_elements(61)); -- 
    -- CP-element group 62:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 62: predecessors 
    -- CP-element group 62: 	13 
    -- CP-element group 62: marked-predecessors 
    -- CP-element group 62: 	65 
    -- CP-element group 62: successors 
    -- CP-element group 62: 	64 
    -- CP-element group 62:  members (3) 
      -- CP-element group 62: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Sample/$entry
      -- CP-element group 62: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Sample/rr
      -- CP-element group 62: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_sample_start_
      -- 
    rr_779_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_779_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(62), ack => RPIPE_mem_out_341_inst_req_0); -- 
    processor_cp_element_group_62: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_62"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(13) & processor_CP_545_elements(65);
      gj_processor_cp_element_group_62 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(62), clk => clk, reset => reset); --
    end block;
    -- CP-element group 63:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 63: predecessors 
    -- CP-element group 63: 	64 
    -- CP-element group 63: marked-predecessors 
    -- CP-element group 63: 	88 
    -- CP-element group 63: 	92 
    -- CP-element group 63: 	96 
    -- CP-element group 63: 	100 
    -- CP-element group 63: 	104 
    -- CP-element group 63: 	108 
    -- CP-element group 63: 	112 
    -- CP-element group 63: 	116 
    -- CP-element group 63: 	120 
    -- CP-element group 63: 	124 
    -- CP-element group 63: 	68 
    -- CP-element group 63: 	76 
    -- CP-element group 63: 	128 
    -- CP-element group 63: 	132 
    -- CP-element group 63: 	140 
    -- CP-element group 63: 	152 
    -- CP-element group 63: 	168 
    -- CP-element group 63: 	175 
    -- CP-element group 63: 	179 
    -- CP-element group 63: 	187 
    -- CP-element group 63: 	199 
    -- CP-element group 63: 	203 
    -- CP-element group 63: 	207 
    -- CP-element group 63: 	211 
    -- CP-element group 63: 	219 
    -- CP-element group 63: successors 
    -- CP-element group 63: 	65 
    -- CP-element group 63:  members (3) 
      -- CP-element group 63: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Update/$entry
      -- CP-element group 63: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Update/cr
      -- CP-element group 63: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_update_start_
      -- 
    cr_784_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_784_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(63), ack => RPIPE_mem_out_341_inst_req_1); -- 
    processor_cp_element_group_63: block -- 
      constant place_capacities: IntegerArray(0 to 25) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1,9 => 1,10 => 1,11 => 1,12 => 1,13 => 1,14 => 1,15 => 1,16 => 1,17 => 1,18 => 1,19 => 1,20 => 1,21 => 1,22 => 1,23 => 1,24 => 1,25 => 1);
      constant place_markings: IntegerArray(0 to 25)  := (0 => 0,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1,9 => 1,10 => 1,11 => 1,12 => 1,13 => 1,14 => 1,15 => 1,16 => 1,17 => 1,18 => 1,19 => 1,20 => 1,21 => 1,22 => 1,23 => 1,24 => 1,25 => 1);
      constant place_delays: IntegerArray(0 to 25) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0,9 => 0,10 => 0,11 => 0,12 => 0,13 => 0,14 => 0,15 => 0,16 => 0,17 => 0,18 => 0,19 => 0,20 => 0,21 => 0,22 => 0,23 => 0,24 => 0,25 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_63"; 
      signal preds: BooleanArray(1 to 26); -- 
    begin -- 
      preds <= processor_CP_545_elements(64) & processor_CP_545_elements(88) & processor_CP_545_elements(92) & processor_CP_545_elements(96) & processor_CP_545_elements(100) & processor_CP_545_elements(104) & processor_CP_545_elements(108) & processor_CP_545_elements(112) & processor_CP_545_elements(116) & processor_CP_545_elements(120) & processor_CP_545_elements(124) & processor_CP_545_elements(68) & processor_CP_545_elements(76) & processor_CP_545_elements(128) & processor_CP_545_elements(132) & processor_CP_545_elements(140) & processor_CP_545_elements(152) & processor_CP_545_elements(168) & processor_CP_545_elements(175) & processor_CP_545_elements(179) & processor_CP_545_elements(187) & processor_CP_545_elements(199) & processor_CP_545_elements(203) & processor_CP_545_elements(207) & processor_CP_545_elements(211) & processor_CP_545_elements(219);
      gj_processor_cp_element_group_63 : generic_join generic map(name => joinName, number_of_predecessors => 26, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(63), clk => clk, reset => reset); --
    end block;
    -- CP-element group 64:  transition  input  bypass  pipeline-parent 
    -- CP-element group 64: predecessors 
    -- CP-element group 64: 	62 
    -- CP-element group 64: successors 
    -- CP-element group 64: 	63 
    -- CP-element group 64:  members (3) 
      -- CP-element group 64: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Sample/$exit
      -- CP-element group 64: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Sample/ra
      -- CP-element group 64: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_sample_completed_
      -- 
    ra_780_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 64_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mem_out_341_inst_ack_0, ack => processor_CP_545_elements(64)); -- 
    -- CP-element group 65:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 65: predecessors 
    -- CP-element group 65: 	63 
    -- CP-element group 65: successors 
    -- CP-element group 65: 	86 
    -- CP-element group 65: 	90 
    -- CP-element group 65: 	94 
    -- CP-element group 65: 	98 
    -- CP-element group 65: 	102 
    -- CP-element group 65: 	106 
    -- CP-element group 65: 	110 
    -- CP-element group 65: 	114 
    -- CP-element group 65: 	118 
    -- CP-element group 65: 	122 
    -- CP-element group 65: 	126 
    -- CP-element group 65: 	14 
    -- CP-element group 65: 	66 
    -- CP-element group 65: 	74 
    -- CP-element group 65: 	130 
    -- CP-element group 65: 	138 
    -- CP-element group 65: 	150 
    -- CP-element group 65: 	165 
    -- CP-element group 65: 	173 
    -- CP-element group 65: 	177 
    -- CP-element group 65: 	185 
    -- CP-element group 65: 	197 
    -- CP-element group 65: 	201 
    -- CP-element group 65: 	205 
    -- CP-element group 65: 	209 
    -- CP-element group 65: 	217 
    -- CP-element group 65: marked-successors 
    -- CP-element group 65: 	62 
    -- CP-element group 65:  members (3) 
      -- CP-element group 65: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Update/$exit
      -- CP-element group 65: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_Update/ca
      -- CP-element group 65: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_341_update_completed_
      -- 
    ca_785_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 65_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mem_out_341_inst_ack_1, ack => processor_CP_545_elements(65)); -- 
    -- CP-element group 66:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 66: predecessors 
    -- CP-element group 66: 	65 
    -- CP-element group 66: marked-predecessors 
    -- CP-element group 66: 	68 
    -- CP-element group 66: 	216 
    -- CP-element group 66: successors 
    -- CP-element group 66: 	68 
    -- CP-element group 66:  members (3) 
      -- CP-element group 66: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_sample_start_
      -- CP-element group 66: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Sample/$entry
      -- CP-element group 66: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Sample/crr
      -- 
    crr_793_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_793_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(66), ack => call_stmt_368_call_req_0); -- 
    processor_cp_element_group_66: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_66"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(68) & processor_CP_545_elements(216);
      gj_processor_cp_element_group_66 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(66), clk => clk, reset => reset); --
    end block;
    -- CP-element group 67:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 67: predecessors 
    -- CP-element group 67: marked-predecessors 
    -- CP-element group 67: 	84 
    -- CP-element group 67: 	69 
    -- CP-element group 67: 	136 
    -- CP-element group 67: 	148 
    -- CP-element group 67: 	156 
    -- CP-element group 67: 	223 
    -- CP-element group 67: successors 
    -- CP-element group 67: 	69 
    -- CP-element group 67:  members (3) 
      -- CP-element group 67: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_update_start_
      -- CP-element group 67: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Update/$entry
      -- CP-element group 67: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Update/ccr
      -- 
    ccr_798_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_798_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(67), ack => call_stmt_368_call_req_1); -- 
    processor_cp_element_group_67: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_67"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= processor_CP_545_elements(84) & processor_CP_545_elements(69) & processor_CP_545_elements(136) & processor_CP_545_elements(148) & processor_CP_545_elements(156) & processor_CP_545_elements(223);
      gj_processor_cp_element_group_67 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(67), clk => clk, reset => reset); --
    end block;
    -- CP-element group 68:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 68: predecessors 
    -- CP-element group 68: 	66 
    -- CP-element group 68: successors 
    -- CP-element group 68: marked-successors 
    -- CP-element group 68: 	66 
    -- CP-element group 68: 	63 
    -- CP-element group 68:  members (3) 
      -- CP-element group 68: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_sample_completed_
      -- CP-element group 68: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Sample/$exit
      -- CP-element group 68: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Sample/cra
      -- 
    cra_794_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 68_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_368_call_ack_0, ack => processor_CP_545_elements(68)); -- 
    -- CP-element group 69:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 69: predecessors 
    -- CP-element group 69: 	67 
    -- CP-element group 69: successors 
    -- CP-element group 69: 	82 
    -- CP-element group 69: 	134 
    -- CP-element group 69: 	146 
    -- CP-element group 69: 	154 
    -- CP-element group 69: 	221 
    -- CP-element group 69: 	234 
    -- CP-element group 69: marked-successors 
    -- CP-element group 69: 	67 
    -- CP-element group 69:  members (3) 
      -- CP-element group 69: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_update_completed_
      -- CP-element group 69: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Update/$exit
      -- CP-element group 69: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_Update/cca
      -- 
    cca_799_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 69_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_368_call_ack_1, ack => processor_CP_545_elements(69)); -- 
    -- CP-element group 70:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 70: predecessors 
    -- CP-element group 70: 	24 
    -- CP-element group 70: marked-predecessors 
    -- CP-element group 70: 	72 
    -- CP-element group 70: successors 
    -- CP-element group 70: 	72 
    -- CP-element group 70:  members (3) 
      -- CP-element group 70: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_sample_start_
      -- CP-element group 70: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_start/$entry
      -- CP-element group 70: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_start/req
      -- 
    req_807_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_807_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(70), ack => MUX_375_inst_req_0); -- 
    processor_cp_element_group_70: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_70"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(24) & processor_CP_545_elements(72);
      gj_processor_cp_element_group_70 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(70), clk => clk, reset => reset); --
    end block;
    -- CP-element group 71:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 71: predecessors 
    -- CP-element group 71: 	16 
    -- CP-element group 71: marked-predecessors 
    -- CP-element group 71: 	73 
    -- CP-element group 71: successors 
    -- CP-element group 71: 	73 
    -- CP-element group 71:  members (3) 
      -- CP-element group 71: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_update_start_
      -- CP-element group 71: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_complete/$entry
      -- CP-element group 71: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_complete/req
      -- 
    req_812_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_812_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(71), ack => MUX_375_inst_req_1); -- 
    processor_cp_element_group_71: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_71"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(16) & processor_CP_545_elements(73);
      gj_processor_cp_element_group_71 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(71), clk => clk, reset => reset); --
    end block;
    -- CP-element group 72:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 72: predecessors 
    -- CP-element group 72: 	70 
    -- CP-element group 72: successors 
    -- CP-element group 72: marked-successors 
    -- CP-element group 72: 	20 
    -- CP-element group 72: 	70 
    -- CP-element group 72:  members (3) 
      -- CP-element group 72: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_sample_completed_
      -- CP-element group 72: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_start/$exit
      -- CP-element group 72: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_start/ack
      -- 
    ack_808_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 72_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_375_inst_ack_0, ack => processor_CP_545_elements(72)); -- 
    -- CP-element group 73:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 73: predecessors 
    -- CP-element group 73: 	71 
    -- CP-element group 73: successors 
    -- CP-element group 73: 	235 
    -- CP-element group 73: marked-successors 
    -- CP-element group 73: 	71 
    -- CP-element group 73: 	38 
    -- CP-element group 73:  members (3) 
      -- CP-element group 73: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_update_completed_
      -- CP-element group 73: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_complete/$exit
      -- CP-element group 73: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_375_complete/ack
      -- 
    ack_813_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 73_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_375_inst_ack_1, ack => processor_CP_545_elements(73)); -- 
    -- CP-element group 74:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 74: predecessors 
    -- CP-element group 74: 	65 
    -- CP-element group 74: marked-predecessors 
    -- CP-element group 74: 	76 
    -- CP-element group 74: successors 
    -- CP-element group 74: 	76 
    -- CP-element group 74:  members (3) 
      -- CP-element group 74: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_sample_start_
      -- CP-element group 74: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Sample/$entry
      -- CP-element group 74: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Sample/req
      -- 
    req_821_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_821_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(74), ack => W_opcode_400_delayed_7_0_381_inst_req_0); -- 
    processor_cp_element_group_74: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_74"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(76);
      gj_processor_cp_element_group_74 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(74), clk => clk, reset => reset); --
    end block;
    -- CP-element group 75:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 75: predecessors 
    -- CP-element group 75: marked-predecessors 
    -- CP-element group 75: 	84 
    -- CP-element group 75: 	77 
    -- CP-element group 75: successors 
    -- CP-element group 75: 	77 
    -- CP-element group 75:  members (3) 
      -- CP-element group 75: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_update_start_
      -- CP-element group 75: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Update/$entry
      -- CP-element group 75: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Update/req
      -- 
    req_826_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_826_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(75), ack => W_opcode_400_delayed_7_0_381_inst_req_1); -- 
    processor_cp_element_group_75: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_75"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(84) & processor_CP_545_elements(77);
      gj_processor_cp_element_group_75 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(75), clk => clk, reset => reset); --
    end block;
    -- CP-element group 76:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 76: predecessors 
    -- CP-element group 76: 	74 
    -- CP-element group 76: successors 
    -- CP-element group 76: marked-successors 
    -- CP-element group 76: 	63 
    -- CP-element group 76: 	74 
    -- CP-element group 76:  members (3) 
      -- CP-element group 76: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_sample_completed_
      -- CP-element group 76: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Sample/$exit
      -- CP-element group 76: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Sample/ack
      -- 
    ack_822_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 76_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_opcode_400_delayed_7_0_381_inst_ack_0, ack => processor_CP_545_elements(76)); -- 
    -- CP-element group 77:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 77: predecessors 
    -- CP-element group 77: 	75 
    -- CP-element group 77: successors 
    -- CP-element group 77: 	82 
    -- CP-element group 77: marked-successors 
    -- CP-element group 77: 	75 
    -- CP-element group 77:  members (3) 
      -- CP-element group 77: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_update_completed_
      -- CP-element group 77: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Update/$exit
      -- CP-element group 77: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_383_Update/ack
      -- 
    ack_827_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 77_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_opcode_400_delayed_7_0_381_inst_ack_1, ack => processor_CP_545_elements(77)); -- 
    -- CP-element group 78:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 78: predecessors 
    -- CP-element group 78: 	24 
    -- CP-element group 78: marked-predecessors 
    -- CP-element group 78: 	80 
    -- CP-element group 78: successors 
    -- CP-element group 78: 	80 
    -- CP-element group 78:  members (3) 
      -- CP-element group 78: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_sample_start_
      -- CP-element group 78: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Sample/$entry
      -- CP-element group 78: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Sample/req
      -- 
    req_835_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_835_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(78), ack => W_program_cnt_403_delayed_7_0_384_inst_req_0); -- 
    processor_cp_element_group_78: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_78"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(24) & processor_CP_545_elements(80);
      gj_processor_cp_element_group_78 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(78), clk => clk, reset => reset); --
    end block;
    -- CP-element group 79:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 79: predecessors 
    -- CP-element group 79: marked-predecessors 
    -- CP-element group 79: 	81 
    -- CP-element group 79: 	84 
    -- CP-element group 79: successors 
    -- CP-element group 79: 	81 
    -- CP-element group 79:  members (3) 
      -- CP-element group 79: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_update_start_
      -- CP-element group 79: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Update/$entry
      -- CP-element group 79: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Update/req
      -- 
    req_840_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_840_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(79), ack => W_program_cnt_403_delayed_7_0_384_inst_req_1); -- 
    processor_cp_element_group_79: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_79"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(81) & processor_CP_545_elements(84);
      gj_processor_cp_element_group_79 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(79), clk => clk, reset => reset); --
    end block;
    -- CP-element group 80:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 80: predecessors 
    -- CP-element group 80: 	78 
    -- CP-element group 80: successors 
    -- CP-element group 80: marked-successors 
    -- CP-element group 80: 	20 
    -- CP-element group 80: 	78 
    -- CP-element group 80:  members (3) 
      -- CP-element group 80: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_sample_completed_
      -- CP-element group 80: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Sample/$exit
      -- CP-element group 80: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Sample/ack
      -- 
    ack_836_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 80_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_program_cnt_403_delayed_7_0_384_inst_ack_0, ack => processor_CP_545_elements(80)); -- 
    -- CP-element group 81:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 81: predecessors 
    -- CP-element group 81: 	79 
    -- CP-element group 81: successors 
    -- CP-element group 81: 	82 
    -- CP-element group 81: marked-successors 
    -- CP-element group 81: 	79 
    -- CP-element group 81:  members (3) 
      -- CP-element group 81: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_update_completed_
      -- CP-element group 81: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Update/$exit
      -- CP-element group 81: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_386_Update/ack
      -- 
    ack_841_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 81_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_program_cnt_403_delayed_7_0_384_inst_ack_1, ack => processor_CP_545_elements(81)); -- 
    -- CP-element group 82:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 82: predecessors 
    -- CP-element group 82: 	81 
    -- CP-element group 82: 	69 
    -- CP-element group 82: 	77 
    -- CP-element group 82: marked-predecessors 
    -- CP-element group 82: 	84 
    -- CP-element group 82: successors 
    -- CP-element group 82: 	84 
    -- CP-element group 82:  members (3) 
      -- CP-element group 82: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_sample_start_
      -- CP-element group 82: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Sample/$entry
      -- CP-element group 82: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Sample/crr
      -- 
    crr_849_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_849_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(82), ack => call_stmt_393_call_req_0); -- 
    processor_cp_element_group_82: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_82"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= processor_CP_545_elements(81) & processor_CP_545_elements(69) & processor_CP_545_elements(77) & processor_CP_545_elements(84);
      gj_processor_cp_element_group_82 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(82), clk => clk, reset => reset); --
    end block;
    -- CP-element group 83:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 83: predecessors 
    -- CP-element group 83: 	16 
    -- CP-element group 83: marked-predecessors 
    -- CP-element group 83: 	85 
    -- CP-element group 83: successors 
    -- CP-element group 83: 	85 
    -- CP-element group 83:  members (3) 
      -- CP-element group 83: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_update_start_
      -- CP-element group 83: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Update/$entry
      -- CP-element group 83: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Update/ccr
      -- 
    ccr_854_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_854_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(83), ack => call_stmt_393_call_req_1); -- 
    processor_cp_element_group_83: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_83"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(16) & processor_CP_545_elements(85);
      gj_processor_cp_element_group_83 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(83), clk => clk, reset => reset); --
    end block;
    -- CP-element group 84:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 84: predecessors 
    -- CP-element group 84: 	82 
    -- CP-element group 84: successors 
    -- CP-element group 84: marked-successors 
    -- CP-element group 84: 	79 
    -- CP-element group 84: 	82 
    -- CP-element group 84: 	67 
    -- CP-element group 84: 	75 
    -- CP-element group 84:  members (3) 
      -- CP-element group 84: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_sample_completed_
      -- CP-element group 84: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Sample/$exit
      -- CP-element group 84: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Sample/cra
      -- 
    cra_850_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 84_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_393_call_ack_0, ack => processor_CP_545_elements(84)); -- 
    -- CP-element group 85:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 85: predecessors 
    -- CP-element group 85: 	83 
    -- CP-element group 85: successors 
    -- CP-element group 85: 	235 
    -- CP-element group 85: marked-successors 
    -- CP-element group 85: 	83 
    -- CP-element group 85: 	19 
    -- CP-element group 85:  members (3) 
      -- CP-element group 85: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_update_completed_
      -- CP-element group 85: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Update/$exit
      -- CP-element group 85: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_393_Update/cca
      -- 
    cca_855_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 85_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_393_call_ack_1, ack => processor_CP_545_elements(85)); -- 
    -- CP-element group 86:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 86: predecessors 
    -- CP-element group 86: 	65 
    -- CP-element group 86: marked-predecessors 
    -- CP-element group 86: 	88 
    -- CP-element group 86: successors 
    -- CP-element group 86: 	88 
    -- CP-element group 86:  members (3) 
      -- CP-element group 86: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_sample_start_
      -- CP-element group 86: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Sample/$entry
      -- CP-element group 86: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Sample/rr
      -- 
    rr_863_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_863_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(86), ack => EQ_u8_u1_402_inst_req_0); -- 
    processor_cp_element_group_86: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_86"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(88);
      gj_processor_cp_element_group_86 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(86), clk => clk, reset => reset); --
    end block;
    -- CP-element group 87:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 87: predecessors 
    -- CP-element group 87: marked-predecessors 
    -- CP-element group 87: 	89 
    -- CP-element group 87: 	136 
    -- CP-element group 87: successors 
    -- CP-element group 87: 	89 
    -- CP-element group 87:  members (3) 
      -- CP-element group 87: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_update_start_
      -- CP-element group 87: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Update/$entry
      -- CP-element group 87: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Update/cr
      -- 
    cr_868_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_868_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(87), ack => EQ_u8_u1_402_inst_req_1); -- 
    processor_cp_element_group_87: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_87"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(89) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_87 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(87), clk => clk, reset => reset); --
    end block;
    -- CP-element group 88:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 88: predecessors 
    -- CP-element group 88: 	86 
    -- CP-element group 88: successors 
    -- CP-element group 88: marked-successors 
    -- CP-element group 88: 	86 
    -- CP-element group 88: 	63 
    -- CP-element group 88:  members (3) 
      -- CP-element group 88: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_sample_completed_
      -- CP-element group 88: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Sample/$exit
      -- CP-element group 88: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Sample/ra
      -- 
    ra_864_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 88_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_402_inst_ack_0, ack => processor_CP_545_elements(88)); -- 
    -- CP-element group 89:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 89: predecessors 
    -- CP-element group 89: 	87 
    -- CP-element group 89: successors 
    -- CP-element group 89: 	134 
    -- CP-element group 89: marked-successors 
    -- CP-element group 89: 	87 
    -- CP-element group 89:  members (3) 
      -- CP-element group 89: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_update_completed_
      -- CP-element group 89: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Update/$exit
      -- CP-element group 89: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_402_Update/ca
      -- 
    ca_869_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 89_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_402_inst_ack_1, ack => processor_CP_545_elements(89)); -- 
    -- CP-element group 90:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 90: predecessors 
    -- CP-element group 90: 	65 
    -- CP-element group 90: marked-predecessors 
    -- CP-element group 90: 	92 
    -- CP-element group 90: successors 
    -- CP-element group 90: 	92 
    -- CP-element group 90:  members (3) 
      -- CP-element group 90: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_sample_start_
      -- CP-element group 90: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Sample/$entry
      -- CP-element group 90: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Sample/rr
      -- 
    rr_877_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_877_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(90), ack => EQ_u8_u1_407_inst_req_0); -- 
    processor_cp_element_group_90: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_90"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(92);
      gj_processor_cp_element_group_90 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(90), clk => clk, reset => reset); --
    end block;
    -- CP-element group 91:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 91: predecessors 
    -- CP-element group 91: marked-predecessors 
    -- CP-element group 91: 	93 
    -- CP-element group 91: 	136 
    -- CP-element group 91: successors 
    -- CP-element group 91: 	93 
    -- CP-element group 91:  members (3) 
      -- CP-element group 91: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_update_start_
      -- CP-element group 91: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Update/$entry
      -- CP-element group 91: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Update/cr
      -- 
    cr_882_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_882_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(91), ack => EQ_u8_u1_407_inst_req_1); -- 
    processor_cp_element_group_91: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_91"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(93) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_91 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(91), clk => clk, reset => reset); --
    end block;
    -- CP-element group 92:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 92: predecessors 
    -- CP-element group 92: 	90 
    -- CP-element group 92: successors 
    -- CP-element group 92: marked-successors 
    -- CP-element group 92: 	90 
    -- CP-element group 92: 	63 
    -- CP-element group 92:  members (3) 
      -- CP-element group 92: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_sample_completed_
      -- CP-element group 92: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Sample/$exit
      -- CP-element group 92: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Sample/ra
      -- 
    ra_878_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 92_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_407_inst_ack_0, ack => processor_CP_545_elements(92)); -- 
    -- CP-element group 93:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 93: predecessors 
    -- CP-element group 93: 	91 
    -- CP-element group 93: successors 
    -- CP-element group 93: 	134 
    -- CP-element group 93: marked-successors 
    -- CP-element group 93: 	91 
    -- CP-element group 93:  members (3) 
      -- CP-element group 93: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_update_completed_
      -- CP-element group 93: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Update/$exit
      -- CP-element group 93: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_407_Update/ca
      -- 
    ca_883_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 93_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_407_inst_ack_1, ack => processor_CP_545_elements(93)); -- 
    -- CP-element group 94:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 94: predecessors 
    -- CP-element group 94: 	65 
    -- CP-element group 94: marked-predecessors 
    -- CP-element group 94: 	96 
    -- CP-element group 94: successors 
    -- CP-element group 94: 	96 
    -- CP-element group 94:  members (3) 
      -- CP-element group 94: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_sample_start_
      -- CP-element group 94: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_start/$entry
      -- CP-element group 94: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_start/req
      -- 
    req_891_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_891_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(94), ack => MUX_417_inst_req_0); -- 
    processor_cp_element_group_94: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_94"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(96);
      gj_processor_cp_element_group_94 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(94), clk => clk, reset => reset); --
    end block;
    -- CP-element group 95:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 95: predecessors 
    -- CP-element group 95: marked-predecessors 
    -- CP-element group 95: 	97 
    -- CP-element group 95: 	136 
    -- CP-element group 95: successors 
    -- CP-element group 95: 	97 
    -- CP-element group 95:  members (3) 
      -- CP-element group 95: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_update_start_
      -- CP-element group 95: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_complete/$entry
      -- CP-element group 95: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_complete/req
      -- 
    req_896_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_896_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(95), ack => MUX_417_inst_req_1); -- 
    processor_cp_element_group_95: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_95"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(97) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_95 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(95), clk => clk, reset => reset); --
    end block;
    -- CP-element group 96:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 96: predecessors 
    -- CP-element group 96: 	94 
    -- CP-element group 96: successors 
    -- CP-element group 96: marked-successors 
    -- CP-element group 96: 	94 
    -- CP-element group 96: 	63 
    -- CP-element group 96:  members (3) 
      -- CP-element group 96: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_sample_completed_
      -- CP-element group 96: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_start/$exit
      -- CP-element group 96: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_start/ack
      -- 
    ack_892_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 96_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_417_inst_ack_0, ack => processor_CP_545_elements(96)); -- 
    -- CP-element group 97:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 97: predecessors 
    -- CP-element group 97: 	95 
    -- CP-element group 97: successors 
    -- CP-element group 97: 	134 
    -- CP-element group 97: marked-successors 
    -- CP-element group 97: 	95 
    -- CP-element group 97:  members (3) 
      -- CP-element group 97: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_update_completed_
      -- CP-element group 97: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_complete/$exit
      -- CP-element group 97: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_417_complete/ack
      -- 
    ack_897_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 97_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_417_inst_ack_1, ack => processor_CP_545_elements(97)); -- 
    -- CP-element group 98:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 98: predecessors 
    -- CP-element group 98: 	65 
    -- CP-element group 98: marked-predecessors 
    -- CP-element group 98: 	100 
    -- CP-element group 98: successors 
    -- CP-element group 98: 	100 
    -- CP-element group 98:  members (3) 
      -- CP-element group 98: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_sample_start_
      -- CP-element group 98: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Sample/$entry
      -- CP-element group 98: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Sample/rr
      -- 
    rr_905_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_905_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(98), ack => EQ_u8_u1_422_inst_req_0); -- 
    processor_cp_element_group_98: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 29) := "processor_cp_element_group_98"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(100);
      gj_processor_cp_element_group_98 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(98), clk => clk, reset => reset); --
    end block;
    -- CP-element group 99:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 99: predecessors 
    -- CP-element group 99: marked-predecessors 
    -- CP-element group 99: 	101 
    -- CP-element group 99: 	136 
    -- CP-element group 99: successors 
    -- CP-element group 99: 	101 
    -- CP-element group 99:  members (3) 
      -- CP-element group 99: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_update_start_
      -- CP-element group 99: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Update/$entry
      -- CP-element group 99: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Update/cr
      -- 
    cr_910_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_910_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(99), ack => EQ_u8_u1_422_inst_req_1); -- 
    processor_cp_element_group_99: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 29) := "processor_cp_element_group_99"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(101) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_99 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(99), clk => clk, reset => reset); --
    end block;
    -- CP-element group 100:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 100: predecessors 
    -- CP-element group 100: 	98 
    -- CP-element group 100: successors 
    -- CP-element group 100: marked-successors 
    -- CP-element group 100: 	98 
    -- CP-element group 100: 	63 
    -- CP-element group 100:  members (3) 
      -- CP-element group 100: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_sample_completed_
      -- CP-element group 100: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Sample/$exit
      -- CP-element group 100: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Sample/ra
      -- 
    ra_906_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 100_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_422_inst_ack_0, ack => processor_CP_545_elements(100)); -- 
    -- CP-element group 101:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 101: predecessors 
    -- CP-element group 101: 	99 
    -- CP-element group 101: successors 
    -- CP-element group 101: 	134 
    -- CP-element group 101: marked-successors 
    -- CP-element group 101: 	99 
    -- CP-element group 101:  members (3) 
      -- CP-element group 101: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_update_completed_
      -- CP-element group 101: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Update/$exit
      -- CP-element group 101: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_422_Update/ca
      -- 
    ca_911_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 101_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_422_inst_ack_1, ack => processor_CP_545_elements(101)); -- 
    -- CP-element group 102:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 102: predecessors 
    -- CP-element group 102: 	65 
    -- CP-element group 102: marked-predecessors 
    -- CP-element group 102: 	104 
    -- CP-element group 102: successors 
    -- CP-element group 102: 	104 
    -- CP-element group 102:  members (3) 
      -- CP-element group 102: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_sample_start_
      -- CP-element group 102: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Sample/$entry
      -- CP-element group 102: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Sample/rr
      -- 
    rr_919_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_919_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(102), ack => EQ_u8_u1_427_inst_req_0); -- 
    processor_cp_element_group_102: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_102"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(104);
      gj_processor_cp_element_group_102 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(102), clk => clk, reset => reset); --
    end block;
    -- CP-element group 103:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 103: predecessors 
    -- CP-element group 103: marked-predecessors 
    -- CP-element group 103: 	105 
    -- CP-element group 103: 	136 
    -- CP-element group 103: successors 
    -- CP-element group 103: 	105 
    -- CP-element group 103:  members (3) 
      -- CP-element group 103: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_update_start_
      -- CP-element group 103: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Update/$entry
      -- CP-element group 103: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Update/cr
      -- 
    cr_924_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_924_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(103), ack => EQ_u8_u1_427_inst_req_1); -- 
    processor_cp_element_group_103: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_103"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(105) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_103 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(103), clk => clk, reset => reset); --
    end block;
    -- CP-element group 104:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 104: predecessors 
    -- CP-element group 104: 	102 
    -- CP-element group 104: successors 
    -- CP-element group 104: marked-successors 
    -- CP-element group 104: 	102 
    -- CP-element group 104: 	63 
    -- CP-element group 104:  members (3) 
      -- CP-element group 104: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_sample_completed_
      -- CP-element group 104: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Sample/$exit
      -- CP-element group 104: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Sample/ra
      -- 
    ra_920_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 104_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_427_inst_ack_0, ack => processor_CP_545_elements(104)); -- 
    -- CP-element group 105:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 105: predecessors 
    -- CP-element group 105: 	103 
    -- CP-element group 105: successors 
    -- CP-element group 105: 	134 
    -- CP-element group 105: marked-successors 
    -- CP-element group 105: 	103 
    -- CP-element group 105:  members (3) 
      -- CP-element group 105: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_update_completed_
      -- CP-element group 105: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Update/$exit
      -- CP-element group 105: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_427_Update/ca
      -- 
    ca_925_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 105_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_427_inst_ack_1, ack => processor_CP_545_elements(105)); -- 
    -- CP-element group 106:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 106: predecessors 
    -- CP-element group 106: 	65 
    -- CP-element group 106: marked-predecessors 
    -- CP-element group 106: 	108 
    -- CP-element group 106: successors 
    -- CP-element group 106: 	108 
    -- CP-element group 106:  members (3) 
      -- CP-element group 106: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_sample_start_
      -- CP-element group 106: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Sample/$entry
      -- CP-element group 106: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Sample/rr
      -- 
    rr_933_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_933_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(106), ack => EQ_u8_u1_432_inst_req_0); -- 
    processor_cp_element_group_106: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_106"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(108);
      gj_processor_cp_element_group_106 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(106), clk => clk, reset => reset); --
    end block;
    -- CP-element group 107:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 107: predecessors 
    -- CP-element group 107: marked-predecessors 
    -- CP-element group 107: 	109 
    -- CP-element group 107: 	136 
    -- CP-element group 107: successors 
    -- CP-element group 107: 	109 
    -- CP-element group 107:  members (3) 
      -- CP-element group 107: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_update_start_
      -- CP-element group 107: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Update/$entry
      -- CP-element group 107: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Update/cr
      -- 
    cr_938_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_938_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(107), ack => EQ_u8_u1_432_inst_req_1); -- 
    processor_cp_element_group_107: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_107"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(109) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_107 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(107), clk => clk, reset => reset); --
    end block;
    -- CP-element group 108:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 108: predecessors 
    -- CP-element group 108: 	106 
    -- CP-element group 108: successors 
    -- CP-element group 108: marked-successors 
    -- CP-element group 108: 	106 
    -- CP-element group 108: 	63 
    -- CP-element group 108:  members (3) 
      -- CP-element group 108: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_sample_completed_
      -- CP-element group 108: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Sample/$exit
      -- CP-element group 108: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Sample/ra
      -- 
    ra_934_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 108_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_432_inst_ack_0, ack => processor_CP_545_elements(108)); -- 
    -- CP-element group 109:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 109: predecessors 
    -- CP-element group 109: 	107 
    -- CP-element group 109: successors 
    -- CP-element group 109: 	134 
    -- CP-element group 109: marked-successors 
    -- CP-element group 109: 	107 
    -- CP-element group 109:  members (3) 
      -- CP-element group 109: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_update_completed_
      -- CP-element group 109: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Update/$exit
      -- CP-element group 109: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_432_Update/ca
      -- 
    ca_939_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 109_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_432_inst_ack_1, ack => processor_CP_545_elements(109)); -- 
    -- CP-element group 110:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 110: predecessors 
    -- CP-element group 110: 	65 
    -- CP-element group 110: marked-predecessors 
    -- CP-element group 110: 	112 
    -- CP-element group 110: successors 
    -- CP-element group 110: 	112 
    -- CP-element group 110:  members (3) 
      -- CP-element group 110: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_sample_start_
      -- CP-element group 110: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Sample/$entry
      -- CP-element group 110: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Sample/rr
      -- 
    rr_947_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_947_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(110), ack => EQ_u8_u1_437_inst_req_0); -- 
    processor_cp_element_group_110: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_110"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(112);
      gj_processor_cp_element_group_110 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(110), clk => clk, reset => reset); --
    end block;
    -- CP-element group 111:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 111: predecessors 
    -- CP-element group 111: marked-predecessors 
    -- CP-element group 111: 	113 
    -- CP-element group 111: 	136 
    -- CP-element group 111: successors 
    -- CP-element group 111: 	113 
    -- CP-element group 111:  members (3) 
      -- CP-element group 111: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_update_start_
      -- CP-element group 111: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Update/$entry
      -- CP-element group 111: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Update/cr
      -- 
    cr_952_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_952_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(111), ack => EQ_u8_u1_437_inst_req_1); -- 
    processor_cp_element_group_111: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_111"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(113) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_111 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(111), clk => clk, reset => reset); --
    end block;
    -- CP-element group 112:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 112: predecessors 
    -- CP-element group 112: 	110 
    -- CP-element group 112: successors 
    -- CP-element group 112: marked-successors 
    -- CP-element group 112: 	110 
    -- CP-element group 112: 	63 
    -- CP-element group 112:  members (3) 
      -- CP-element group 112: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_sample_completed_
      -- CP-element group 112: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Sample/$exit
      -- CP-element group 112: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Sample/ra
      -- 
    ra_948_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 112_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_437_inst_ack_0, ack => processor_CP_545_elements(112)); -- 
    -- CP-element group 113:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 113: predecessors 
    -- CP-element group 113: 	111 
    -- CP-element group 113: successors 
    -- CP-element group 113: 	134 
    -- CP-element group 113: marked-successors 
    -- CP-element group 113: 	111 
    -- CP-element group 113:  members (3) 
      -- CP-element group 113: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_update_completed_
      -- CP-element group 113: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Update/$exit
      -- CP-element group 113: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_437_Update/ca
      -- 
    ca_953_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 113_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_437_inst_ack_1, ack => processor_CP_545_elements(113)); -- 
    -- CP-element group 114:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 114: predecessors 
    -- CP-element group 114: 	65 
    -- CP-element group 114: marked-predecessors 
    -- CP-element group 114: 	116 
    -- CP-element group 114: successors 
    -- CP-element group 114: 	116 
    -- CP-element group 114:  members (3) 
      -- CP-element group 114: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_sample_start_
      -- CP-element group 114: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Sample/$entry
      -- CP-element group 114: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Sample/rr
      -- 
    rr_961_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_961_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(114), ack => EQ_u8_u1_442_inst_req_0); -- 
    processor_cp_element_group_114: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_114"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(116);
      gj_processor_cp_element_group_114 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(114), clk => clk, reset => reset); --
    end block;
    -- CP-element group 115:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 115: predecessors 
    -- CP-element group 115: marked-predecessors 
    -- CP-element group 115: 	117 
    -- CP-element group 115: 	136 
    -- CP-element group 115: successors 
    -- CP-element group 115: 	117 
    -- CP-element group 115:  members (3) 
      -- CP-element group 115: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_update_start_
      -- CP-element group 115: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Update/$entry
      -- CP-element group 115: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Update/cr
      -- 
    cr_966_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_966_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(115), ack => EQ_u8_u1_442_inst_req_1); -- 
    processor_cp_element_group_115: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_115"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(117) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_115 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(115), clk => clk, reset => reset); --
    end block;
    -- CP-element group 116:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 116: predecessors 
    -- CP-element group 116: 	114 
    -- CP-element group 116: successors 
    -- CP-element group 116: marked-successors 
    -- CP-element group 116: 	114 
    -- CP-element group 116: 	63 
    -- CP-element group 116:  members (3) 
      -- CP-element group 116: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_sample_completed_
      -- CP-element group 116: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Sample/$exit
      -- CP-element group 116: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Sample/ra
      -- 
    ra_962_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 116_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_442_inst_ack_0, ack => processor_CP_545_elements(116)); -- 
    -- CP-element group 117:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 117: predecessors 
    -- CP-element group 117: 	115 
    -- CP-element group 117: successors 
    -- CP-element group 117: 	134 
    -- CP-element group 117: marked-successors 
    -- CP-element group 117: 	115 
    -- CP-element group 117:  members (3) 
      -- CP-element group 117: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_update_completed_
      -- CP-element group 117: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Update/$exit
      -- CP-element group 117: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_442_Update/ca
      -- 
    ca_967_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 117_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_442_inst_ack_1, ack => processor_CP_545_elements(117)); -- 
    -- CP-element group 118:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 118: predecessors 
    -- CP-element group 118: 	65 
    -- CP-element group 118: marked-predecessors 
    -- CP-element group 118: 	120 
    -- CP-element group 118: successors 
    -- CP-element group 118: 	120 
    -- CP-element group 118:  members (3) 
      -- CP-element group 118: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_sample_start_
      -- CP-element group 118: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Sample/$entry
      -- CP-element group 118: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Sample/rr
      -- 
    rr_975_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_975_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(118), ack => EQ_u8_u1_447_inst_req_0); -- 
    processor_cp_element_group_118: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_118"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(120);
      gj_processor_cp_element_group_118 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(118), clk => clk, reset => reset); --
    end block;
    -- CP-element group 119:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 119: predecessors 
    -- CP-element group 119: marked-predecessors 
    -- CP-element group 119: 	121 
    -- CP-element group 119: 	136 
    -- CP-element group 119: successors 
    -- CP-element group 119: 	121 
    -- CP-element group 119:  members (3) 
      -- CP-element group 119: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_update_start_
      -- CP-element group 119: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Update/$entry
      -- CP-element group 119: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Update/cr
      -- 
    cr_980_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_980_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(119), ack => EQ_u8_u1_447_inst_req_1); -- 
    processor_cp_element_group_119: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_119"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(121) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_119 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(119), clk => clk, reset => reset); --
    end block;
    -- CP-element group 120:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 120: predecessors 
    -- CP-element group 120: 	118 
    -- CP-element group 120: successors 
    -- CP-element group 120: marked-successors 
    -- CP-element group 120: 	118 
    -- CP-element group 120: 	63 
    -- CP-element group 120:  members (3) 
      -- CP-element group 120: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_sample_completed_
      -- CP-element group 120: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Sample/$exit
      -- CP-element group 120: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Sample/ra
      -- 
    ra_976_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 120_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_447_inst_ack_0, ack => processor_CP_545_elements(120)); -- 
    -- CP-element group 121:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 121: predecessors 
    -- CP-element group 121: 	119 
    -- CP-element group 121: successors 
    -- CP-element group 121: 	134 
    -- CP-element group 121: marked-successors 
    -- CP-element group 121: 	119 
    -- CP-element group 121:  members (3) 
      -- CP-element group 121: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_update_completed_
      -- CP-element group 121: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Update/$exit
      -- CP-element group 121: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_447_Update/ca
      -- 
    ca_981_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 121_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_447_inst_ack_1, ack => processor_CP_545_elements(121)); -- 
    -- CP-element group 122:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 122: predecessors 
    -- CP-element group 122: 	65 
    -- CP-element group 122: marked-predecessors 
    -- CP-element group 122: 	124 
    -- CP-element group 122: successors 
    -- CP-element group 122: 	124 
    -- CP-element group 122:  members (3) 
      -- CP-element group 122: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_sample_start_
      -- CP-element group 122: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Sample/$entry
      -- CP-element group 122: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Sample/rr
      -- 
    rr_989_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_989_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(122), ack => EQ_u8_u1_452_inst_req_0); -- 
    processor_cp_element_group_122: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_122"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(124);
      gj_processor_cp_element_group_122 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(122), clk => clk, reset => reset); --
    end block;
    -- CP-element group 123:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 123: predecessors 
    -- CP-element group 123: marked-predecessors 
    -- CP-element group 123: 	125 
    -- CP-element group 123: 	136 
    -- CP-element group 123: successors 
    -- CP-element group 123: 	125 
    -- CP-element group 123:  members (3) 
      -- CP-element group 123: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_update_start_
      -- CP-element group 123: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Update/$entry
      -- CP-element group 123: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Update/cr
      -- 
    cr_994_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_994_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(123), ack => EQ_u8_u1_452_inst_req_1); -- 
    processor_cp_element_group_123: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_123"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(125) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_123 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(123), clk => clk, reset => reset); --
    end block;
    -- CP-element group 124:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 124: predecessors 
    -- CP-element group 124: 	122 
    -- CP-element group 124: successors 
    -- CP-element group 124: marked-successors 
    -- CP-element group 124: 	122 
    -- CP-element group 124: 	63 
    -- CP-element group 124:  members (3) 
      -- CP-element group 124: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_sample_completed_
      -- CP-element group 124: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Sample/$exit
      -- CP-element group 124: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Sample/ra
      -- 
    ra_990_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 124_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_452_inst_ack_0, ack => processor_CP_545_elements(124)); -- 
    -- CP-element group 125:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 125: predecessors 
    -- CP-element group 125: 	123 
    -- CP-element group 125: successors 
    -- CP-element group 125: 	134 
    -- CP-element group 125: marked-successors 
    -- CP-element group 125: 	123 
    -- CP-element group 125:  members (3) 
      -- CP-element group 125: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_update_completed_
      -- CP-element group 125: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Update/$exit
      -- CP-element group 125: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_452_Update/ca
      -- 
    ca_995_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 125_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_452_inst_ack_1, ack => processor_CP_545_elements(125)); -- 
    -- CP-element group 126:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 126: predecessors 
    -- CP-element group 126: 	65 
    -- CP-element group 126: marked-predecessors 
    -- CP-element group 126: 	128 
    -- CP-element group 126: successors 
    -- CP-element group 126: 	128 
    -- CP-element group 126:  members (3) 
      -- CP-element group 126: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_sample_start_
      -- CP-element group 126: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Sample/$entry
      -- CP-element group 126: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Sample/rr
      -- 
    rr_1003_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1003_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(126), ack => EQ_u8_u1_457_inst_req_0); -- 
    processor_cp_element_group_126: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_126"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(128);
      gj_processor_cp_element_group_126 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(126), clk => clk, reset => reset); --
    end block;
    -- CP-element group 127:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 127: predecessors 
    -- CP-element group 127: marked-predecessors 
    -- CP-element group 127: 	129 
    -- CP-element group 127: 	136 
    -- CP-element group 127: successors 
    -- CP-element group 127: 	129 
    -- CP-element group 127:  members (3) 
      -- CP-element group 127: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_update_start_
      -- CP-element group 127: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Update/$entry
      -- CP-element group 127: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Update/cr
      -- 
    cr_1008_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1008_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(127), ack => EQ_u8_u1_457_inst_req_1); -- 
    processor_cp_element_group_127: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_127"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(129) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_127 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(127), clk => clk, reset => reset); --
    end block;
    -- CP-element group 128:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 128: predecessors 
    -- CP-element group 128: 	126 
    -- CP-element group 128: successors 
    -- CP-element group 128: marked-successors 
    -- CP-element group 128: 	126 
    -- CP-element group 128: 	63 
    -- CP-element group 128:  members (3) 
      -- CP-element group 128: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_sample_completed_
      -- CP-element group 128: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Sample/$exit
      -- CP-element group 128: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Sample/ra
      -- 
    ra_1004_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 128_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_457_inst_ack_0, ack => processor_CP_545_elements(128)); -- 
    -- CP-element group 129:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 129: predecessors 
    -- CP-element group 129: 	127 
    -- CP-element group 129: successors 
    -- CP-element group 129: 	134 
    -- CP-element group 129: marked-successors 
    -- CP-element group 129: 	127 
    -- CP-element group 129:  members (3) 
      -- CP-element group 129: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_update_completed_
      -- CP-element group 129: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Update/$exit
      -- CP-element group 129: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_457_Update/ca
      -- 
    ca_1009_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 129_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_457_inst_ack_1, ack => processor_CP_545_elements(129)); -- 
    -- CP-element group 130:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 130: predecessors 
    -- CP-element group 130: 	65 
    -- CP-element group 130: marked-predecessors 
    -- CP-element group 130: 	132 
    -- CP-element group 130: successors 
    -- CP-element group 130: 	132 
    -- CP-element group 130:  members (3) 
      -- CP-element group 130: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_sample_start_
      -- CP-element group 130: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Sample/$entry
      -- CP-element group 130: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Sample/rr
      -- 
    rr_1017_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1017_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(130), ack => EQ_u8_u1_462_inst_req_0); -- 
    processor_cp_element_group_130: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_130"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(132);
      gj_processor_cp_element_group_130 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(130), clk => clk, reset => reset); --
    end block;
    -- CP-element group 131:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 131: predecessors 
    -- CP-element group 131: marked-predecessors 
    -- CP-element group 131: 	133 
    -- CP-element group 131: 	136 
    -- CP-element group 131: successors 
    -- CP-element group 131: 	133 
    -- CP-element group 131:  members (3) 
      -- CP-element group 131: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_update_start_
      -- CP-element group 131: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Update/$entry
      -- CP-element group 131: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Update/cr
      -- 
    cr_1022_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1022_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(131), ack => EQ_u8_u1_462_inst_req_1); -- 
    processor_cp_element_group_131: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_131"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(133) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_131 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(131), clk => clk, reset => reset); --
    end block;
    -- CP-element group 132:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 132: predecessors 
    -- CP-element group 132: 	130 
    -- CP-element group 132: successors 
    -- CP-element group 132: marked-successors 
    -- CP-element group 132: 	63 
    -- CP-element group 132: 	130 
    -- CP-element group 132:  members (3) 
      -- CP-element group 132: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_sample_completed_
      -- CP-element group 132: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Sample/$exit
      -- CP-element group 132: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Sample/ra
      -- 
    ra_1018_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 132_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_462_inst_ack_0, ack => processor_CP_545_elements(132)); -- 
    -- CP-element group 133:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 133: predecessors 
    -- CP-element group 133: 	131 
    -- CP-element group 133: successors 
    -- CP-element group 133: 	134 
    -- CP-element group 133: marked-successors 
    -- CP-element group 133: 	131 
    -- CP-element group 133:  members (3) 
      -- CP-element group 133: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_update_completed_
      -- CP-element group 133: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Update/$exit
      -- CP-element group 133: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_462_Update/ca
      -- 
    ca_1023_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 133_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_462_inst_ack_1, ack => processor_CP_545_elements(133)); -- 
    -- CP-element group 134:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 134: predecessors 
    -- CP-element group 134: 	89 
    -- CP-element group 134: 	93 
    -- CP-element group 134: 	97 
    -- CP-element group 134: 	101 
    -- CP-element group 134: 	105 
    -- CP-element group 134: 	109 
    -- CP-element group 134: 	113 
    -- CP-element group 134: 	117 
    -- CP-element group 134: 	121 
    -- CP-element group 134: 	125 
    -- CP-element group 134: 	69 
    -- CP-element group 134: 	129 
    -- CP-element group 134: 	133 
    -- CP-element group 134: marked-predecessors 
    -- CP-element group 134: 	136 
    -- CP-element group 134: successors 
    -- CP-element group 134: 	136 
    -- CP-element group 134:  members (3) 
      -- CP-element group 134: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_sample_start_
      -- CP-element group 134: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Sample/$entry
      -- CP-element group 134: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Sample/rr
      -- 
    rr_1031_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1031_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(134), ack => OR_u32_u32_562_inst_req_0); -- 
    processor_cp_element_group_134: block -- 
      constant place_capacities: IntegerArray(0 to 13) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1,7 => 1,8 => 1,9 => 1,10 => 1,11 => 1,12 => 1,13 => 1);
      constant place_markings: IntegerArray(0 to 13)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0,9 => 0,10 => 0,11 => 0,12 => 0,13 => 1);
      constant place_delays: IntegerArray(0 to 13) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 0,9 => 0,10 => 0,11 => 0,12 => 0,13 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_134"; 
      signal preds: BooleanArray(1 to 14); -- 
    begin -- 
      preds <= processor_CP_545_elements(89) & processor_CP_545_elements(93) & processor_CP_545_elements(97) & processor_CP_545_elements(101) & processor_CP_545_elements(105) & processor_CP_545_elements(109) & processor_CP_545_elements(113) & processor_CP_545_elements(117) & processor_CP_545_elements(121) & processor_CP_545_elements(125) & processor_CP_545_elements(69) & processor_CP_545_elements(129) & processor_CP_545_elements(133) & processor_CP_545_elements(136);
      gj_processor_cp_element_group_134 : generic_join generic map(name => joinName, number_of_predecessors => 14, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(134), clk => clk, reset => reset); --
    end block;
    -- CP-element group 135:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 135: predecessors 
    -- CP-element group 135: marked-predecessors 
    -- CP-element group 135: 	137 
    -- CP-element group 135: 	191 
    -- CP-element group 135: successors 
    -- CP-element group 135: 	137 
    -- CP-element group 135:  members (3) 
      -- CP-element group 135: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_update_start_
      -- CP-element group 135: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Update/$entry
      -- CP-element group 135: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Update/cr
      -- 
    cr_1036_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1036_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(135), ack => OR_u32_u32_562_inst_req_1); -- 
    processor_cp_element_group_135: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_135"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(137) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_135 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(135), clk => clk, reset => reset); --
    end block;
    -- CP-element group 136:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 136: predecessors 
    -- CP-element group 136: 	134 
    -- CP-element group 136: successors 
    -- CP-element group 136: marked-successors 
    -- CP-element group 136: 	87 
    -- CP-element group 136: 	91 
    -- CP-element group 136: 	95 
    -- CP-element group 136: 	99 
    -- CP-element group 136: 	103 
    -- CP-element group 136: 	107 
    -- CP-element group 136: 	111 
    -- CP-element group 136: 	115 
    -- CP-element group 136: 	119 
    -- CP-element group 136: 	123 
    -- CP-element group 136: 	127 
    -- CP-element group 136: 	67 
    -- CP-element group 136: 	131 
    -- CP-element group 136: 	134 
    -- CP-element group 136:  members (3) 
      -- CP-element group 136: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_sample_completed_
      -- CP-element group 136: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Sample/$exit
      -- CP-element group 136: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Sample/ra
      -- 
    ra_1032_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 136_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u32_u32_562_inst_ack_0, ack => processor_CP_545_elements(136)); -- 
    -- CP-element group 137:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 137: predecessors 
    -- CP-element group 137: 	135 
    -- CP-element group 137: successors 
    -- CP-element group 137: 	189 
    -- CP-element group 137: marked-successors 
    -- CP-element group 137: 	135 
    -- CP-element group 137:  members (3) 
      -- CP-element group 137: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_update_completed_
      -- CP-element group 137: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Update/$exit
      -- CP-element group 137: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/OR_u32_u32_562_Update/ca
      -- 
    ca_1037_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 137_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => OR_u32_u32_562_inst_ack_1, ack => processor_CP_545_elements(137)); -- 
    -- CP-element group 138:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 138: predecessors 
    -- CP-element group 138: 	65 
    -- CP-element group 138: marked-predecessors 
    -- CP-element group 138: 	140 
    -- CP-element group 138: successors 
    -- CP-element group 138: 	140 
    -- CP-element group 138:  members (3) 
      -- CP-element group 138: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_sample_start_
      -- CP-element group 138: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Sample/$entry
      -- CP-element group 138: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Sample/rr
      -- 
    rr_1045_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1045_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(138), ack => EQ_u8_u1_567_inst_req_0); -- 
    processor_cp_element_group_138: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_138"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(140);
      gj_processor_cp_element_group_138 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(138), clk => clk, reset => reset); --
    end block;
    -- CP-element group 139:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 139: predecessors 
    -- CP-element group 139: marked-predecessors 
    -- CP-element group 139: 	141 
    -- CP-element group 139: 	191 
    -- CP-element group 139: successors 
    -- CP-element group 139: 	141 
    -- CP-element group 139:  members (3) 
      -- CP-element group 139: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_update_start_
      -- CP-element group 139: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Update/$entry
      -- CP-element group 139: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Update/cr
      -- 
    cr_1050_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1050_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(139), ack => EQ_u8_u1_567_inst_req_1); -- 
    processor_cp_element_group_139: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_139"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(141) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_139 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(139), clk => clk, reset => reset); --
    end block;
    -- CP-element group 140:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 140: predecessors 
    -- CP-element group 140: 	138 
    -- CP-element group 140: successors 
    -- CP-element group 140: marked-successors 
    -- CP-element group 140: 	63 
    -- CP-element group 140: 	138 
    -- CP-element group 140:  members (3) 
      -- CP-element group 140: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_sample_completed_
      -- CP-element group 140: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Sample/$exit
      -- CP-element group 140: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Sample/ra
      -- 
    ra_1046_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 140_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_567_inst_ack_0, ack => processor_CP_545_elements(140)); -- 
    -- CP-element group 141:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 141: predecessors 
    -- CP-element group 141: 	139 
    -- CP-element group 141: successors 
    -- CP-element group 141: 	189 
    -- CP-element group 141: marked-successors 
    -- CP-element group 141: 	139 
    -- CP-element group 141:  members (3) 
      -- CP-element group 141: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_update_completed_
      -- CP-element group 141: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Update/$exit
      -- CP-element group 141: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_567_Update/ca
      -- 
    ca_1051_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 141_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_567_inst_ack_1, ack => processor_CP_545_elements(141)); -- 
    -- CP-element group 142:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 142: predecessors 
    -- CP-element group 142: 	41 
    -- CP-element group 142: marked-predecessors 
    -- CP-element group 142: 	144 
    -- CP-element group 142: successors 
    -- CP-element group 142: 	144 
    -- CP-element group 142:  members (3) 
      -- CP-element group 142: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_sample_start_
      -- CP-element group 142: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Sample/$entry
      -- CP-element group 142: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Sample/req
      -- 
    req_1059_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1059_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(142), ack => W_carry_549_delayed_8_0_569_inst_req_0); -- 
    processor_cp_element_group_142: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_142"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(41) & processor_CP_545_elements(144);
      gj_processor_cp_element_group_142 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(142), clk => clk, reset => reset); --
    end block;
    -- CP-element group 143:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 143: predecessors 
    -- CP-element group 143: marked-predecessors 
    -- CP-element group 143: 	145 
    -- CP-element group 143: 	191 
    -- CP-element group 143: successors 
    -- CP-element group 143: 	145 
    -- CP-element group 143:  members (3) 
      -- CP-element group 143: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_update_start_
      -- CP-element group 143: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Update/$entry
      -- CP-element group 143: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Update/req
      -- 
    req_1064_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1064_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(143), ack => W_carry_549_delayed_8_0_569_inst_req_1); -- 
    processor_cp_element_group_143: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_143"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(145) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_143 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(143), clk => clk, reset => reset); --
    end block;
    -- CP-element group 144:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 144: predecessors 
    -- CP-element group 144: 	142 
    -- CP-element group 144: successors 
    -- CP-element group 144: marked-successors 
    -- CP-element group 144: 	39 
    -- CP-element group 144: 	142 
    -- CP-element group 144:  members (3) 
      -- CP-element group 144: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_sample_completed_
      -- CP-element group 144: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Sample/$exit
      -- CP-element group 144: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Sample/ack
      -- 
    ack_1060_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 144_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_carry_549_delayed_8_0_569_inst_ack_0, ack => processor_CP_545_elements(144)); -- 
    -- CP-element group 145:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 145: predecessors 
    -- CP-element group 145: 	143 
    -- CP-element group 145: successors 
    -- CP-element group 145: 	189 
    -- CP-element group 145: marked-successors 
    -- CP-element group 145: 	143 
    -- CP-element group 145:  members (3) 
      -- CP-element group 145: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_update_completed_
      -- CP-element group 145: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Update/$exit
      -- CP-element group 145: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_571_Update/ack
      -- 
    ack_1065_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 145_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_carry_549_delayed_8_0_569_inst_ack_1, ack => processor_CP_545_elements(145)); -- 
    -- CP-element group 146:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 146: predecessors 
    -- CP-element group 146: 	69 
    -- CP-element group 146: marked-predecessors 
    -- CP-element group 146: 	148 
    -- CP-element group 146: successors 
    -- CP-element group 146: 	148 
    -- CP-element group 146:  members (3) 
      -- CP-element group 146: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Sample/rr
      -- CP-element group 146: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_sample_start_
      -- CP-element group 146: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Sample/$entry
      -- 
    rr_1073_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1073_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(146), ack => slice_639_inst_req_0); -- 
    processor_cp_element_group_146: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_146"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(69) & processor_CP_545_elements(148);
      gj_processor_cp_element_group_146 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(146), clk => clk, reset => reset); --
    end block;
    -- CP-element group 147:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 147: predecessors 
    -- CP-element group 147: marked-predecessors 
    -- CP-element group 147: 	149 
    -- CP-element group 147: 	160 
    -- CP-element group 147: 	163 
    -- CP-element group 147: 	166 
    -- CP-element group 147: 	171 
    -- CP-element group 147: successors 
    -- CP-element group 147: 	149 
    -- CP-element group 147:  members (3) 
      -- CP-element group 147: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Update/$entry
      -- CP-element group 147: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_update_start_
      -- CP-element group 147: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Update/cr
      -- 
    cr_1078_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1078_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(147), ack => slice_639_inst_req_1); -- 
    processor_cp_element_group_147: block -- 
      constant place_capacities: IntegerArray(0 to 4) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1);
      constant place_markings: IntegerArray(0 to 4)  := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1);
      constant place_delays: IntegerArray(0 to 4) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_147"; 
      signal preds: BooleanArray(1 to 5); -- 
    begin -- 
      preds <= processor_CP_545_elements(149) & processor_CP_545_elements(160) & processor_CP_545_elements(163) & processor_CP_545_elements(166) & processor_CP_545_elements(171);
      gj_processor_cp_element_group_147 : generic_join generic map(name => joinName, number_of_predecessors => 5, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(147), clk => clk, reset => reset); --
    end block;
    -- CP-element group 148:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 148: predecessors 
    -- CP-element group 148: 	146 
    -- CP-element group 148: successors 
    -- CP-element group 148: marked-successors 
    -- CP-element group 148: 	67 
    -- CP-element group 148: 	146 
    -- CP-element group 148:  members (3) 
      -- CP-element group 148: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Sample/ra
      -- CP-element group 148: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_sample_completed_
      -- CP-element group 148: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Sample/$exit
      -- 
    ra_1074_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 148_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_639_inst_ack_0, ack => processor_CP_545_elements(148)); -- 
    -- CP-element group 149:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 149: predecessors 
    -- CP-element group 149: 	147 
    -- CP-element group 149: successors 
    -- CP-element group 149: 	158 
    -- CP-element group 149: 	162 
    -- CP-element group 149: 	166 
    -- CP-element group 149: 	169 
    -- CP-element group 149: marked-successors 
    -- CP-element group 149: 	147 
    -- CP-element group 149:  members (3) 
      -- CP-element group 149: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Update/ca
      -- CP-element group 149: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_update_completed_
      -- CP-element group 149: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/slice_639_Update/$exit
      -- 
    ca_1079_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 149_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_639_inst_ack_1, ack => processor_CP_545_elements(149)); -- 
    -- CP-element group 150:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 150: predecessors 
    -- CP-element group 150: 	65 
    -- CP-element group 150: marked-predecessors 
    -- CP-element group 150: 	152 
    -- CP-element group 150: successors 
    -- CP-element group 150: 	152 
    -- CP-element group 150:  members (3) 
      -- CP-element group 150: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Sample/$entry
      -- CP-element group 150: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Sample/req
      -- CP-element group 150: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_sample_start_
      -- 
    req_1087_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1087_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(150), ack => W_memWrite_625_delayed_8_0_649_inst_req_0); -- 
    processor_cp_element_group_150: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_150"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(152);
      gj_processor_cp_element_group_150 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(150), clk => clk, reset => reset); --
    end block;
    -- CP-element group 151:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 151: predecessors 
    -- CP-element group 151: marked-predecessors 
    -- CP-element group 151: 	153 
    -- CP-element group 151: 	160 
    -- CP-element group 151: successors 
    -- CP-element group 151: 	153 
    -- CP-element group 151:  members (3) 
      -- CP-element group 151: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Update/req
      -- CP-element group 151: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_update_start_
      -- CP-element group 151: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Update/$entry
      -- 
    req_1092_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1092_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(151), ack => W_memWrite_625_delayed_8_0_649_inst_req_1); -- 
    processor_cp_element_group_151: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_151"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(153) & processor_CP_545_elements(160);
      gj_processor_cp_element_group_151 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(151), clk => clk, reset => reset); --
    end block;
    -- CP-element group 152:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 152: predecessors 
    -- CP-element group 152: 	150 
    -- CP-element group 152: successors 
    -- CP-element group 152: marked-successors 
    -- CP-element group 152: 	63 
    -- CP-element group 152: 	150 
    -- CP-element group 152:  members (3) 
      -- CP-element group 152: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Sample/ack
      -- CP-element group 152: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_sample_completed_
      -- CP-element group 152: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Sample/$exit
      -- 
    ack_1088_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 152_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_memWrite_625_delayed_8_0_649_inst_ack_0, ack => processor_CP_545_elements(152)); -- 
    -- CP-element group 153:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 153: predecessors 
    -- CP-element group 153: 	151 
    -- CP-element group 153: successors 
    -- CP-element group 153: 	158 
    -- CP-element group 153: marked-successors 
    -- CP-element group 153: 	151 
    -- CP-element group 153:  members (3) 
      -- CP-element group 153: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_update_completed_
      -- CP-element group 153: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Update/ack
      -- CP-element group 153: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_651_Update/$exit
      -- 
    ack_1093_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 153_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_memWrite_625_delayed_8_0_649_inst_ack_1, ack => processor_CP_545_elements(153)); -- 
    -- CP-element group 154:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 154: predecessors 
    -- CP-element group 154: 	69 
    -- CP-element group 154: marked-predecessors 
    -- CP-element group 154: 	156 
    -- CP-element group 154: successors 
    -- CP-element group 154: 	156 
    -- CP-element group 154:  members (3) 
      -- CP-element group 154: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Sample/req
      -- CP-element group 154: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Sample/$entry
      -- CP-element group 154: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_sample_start_
      -- 
    req_1101_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1101_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(154), ack => W_rd2_629_delayed_1_0_652_inst_req_0); -- 
    processor_cp_element_group_154: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_154"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(69) & processor_CP_545_elements(156);
      gj_processor_cp_element_group_154 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(154), clk => clk, reset => reset); --
    end block;
    -- CP-element group 155:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 155: predecessors 
    -- CP-element group 155: marked-predecessors 
    -- CP-element group 155: 	157 
    -- CP-element group 155: 	160 
    -- CP-element group 155: successors 
    -- CP-element group 155: 	157 
    -- CP-element group 155:  members (3) 
      -- CP-element group 155: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_update_start_
      -- CP-element group 155: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Update/req
      -- CP-element group 155: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Update/$entry
      -- 
    req_1106_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1106_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(155), ack => W_rd2_629_delayed_1_0_652_inst_req_1); -- 
    processor_cp_element_group_155: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_155"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(157) & processor_CP_545_elements(160);
      gj_processor_cp_element_group_155 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(155), clk => clk, reset => reset); --
    end block;
    -- CP-element group 156:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 156: predecessors 
    -- CP-element group 156: 	154 
    -- CP-element group 156: successors 
    -- CP-element group 156: marked-successors 
    -- CP-element group 156: 	67 
    -- CP-element group 156: 	154 
    -- CP-element group 156:  members (3) 
      -- CP-element group 156: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_sample_completed_
      -- CP-element group 156: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Sample/ack
      -- CP-element group 156: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Sample/$exit
      -- 
    ack_1102_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 156_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd2_629_delayed_1_0_652_inst_ack_0, ack => processor_CP_545_elements(156)); -- 
    -- CP-element group 157:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 157: predecessors 
    -- CP-element group 157: 	155 
    -- CP-element group 157: successors 
    -- CP-element group 157: 	158 
    -- CP-element group 157: marked-successors 
    -- CP-element group 157: 	155 
    -- CP-element group 157:  members (3) 
      -- CP-element group 157: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Update/$exit
      -- CP-element group 157: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_Update/ack
      -- CP-element group 157: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_654_update_completed_
      -- 
    ack_1107_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 157_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd2_629_delayed_1_0_652_inst_ack_1, ack => processor_CP_545_elements(157)); -- 
    -- CP-element group 158:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 158: predecessors 
    -- CP-element group 158: 	149 
    -- CP-element group 158: 	153 
    -- CP-element group 158: 	157 
    -- CP-element group 158: marked-predecessors 
    -- CP-element group 158: 	160 
    -- CP-element group 158: successors 
    -- CP-element group 158: 	160 
    -- CP-element group 158:  members (3) 
      -- CP-element group 158: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_sample_start_
      -- CP-element group 158: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Sample/$entry
      -- CP-element group 158: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Sample/rr
      -- 
    rr_1115_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1115_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(158), ack => CONCAT_u9_u64_663_inst_req_0); -- 
    processor_cp_element_group_158: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_158"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= processor_CP_545_elements(149) & processor_CP_545_elements(153) & processor_CP_545_elements(157) & processor_CP_545_elements(160);
      gj_processor_cp_element_group_158 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(158), clk => clk, reset => reset); --
    end block;
    -- CP-element group 159:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 159: predecessors 
    -- CP-element group 159: marked-predecessors 
    -- CP-element group 159: 	161 
    -- CP-element group 159: 	163 
    -- CP-element group 159: successors 
    -- CP-element group 159: 	161 
    -- CP-element group 159:  members (3) 
      -- CP-element group 159: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Update/cr
      -- CP-element group 159: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Update/$entry
      -- CP-element group 159: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_update_start_
      -- 
    cr_1120_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1120_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(159), ack => CONCAT_u9_u64_663_inst_req_1); -- 
    processor_cp_element_group_159: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_159"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(161) & processor_CP_545_elements(163);
      gj_processor_cp_element_group_159 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(159), clk => clk, reset => reset); --
    end block;
    -- CP-element group 160:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 160: predecessors 
    -- CP-element group 160: 	158 
    -- CP-element group 160: successors 
    -- CP-element group 160: marked-successors 
    -- CP-element group 160: 	147 
    -- CP-element group 160: 	151 
    -- CP-element group 160: 	155 
    -- CP-element group 160: 	158 
    -- CP-element group 160:  members (3) 
      -- CP-element group 160: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Sample/$exit
      -- CP-element group 160: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_sample_completed_
      -- CP-element group 160: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Sample/ra
      -- 
    ra_1116_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 160_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u9_u64_663_inst_ack_0, ack => processor_CP_545_elements(160)); -- 
    -- CP-element group 161:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 161: predecessors 
    -- CP-element group 161: 	159 
    -- CP-element group 161: successors 
    -- CP-element group 161: 	162 
    -- CP-element group 161: marked-successors 
    -- CP-element group 161: 	159 
    -- CP-element group 161:  members (3) 
      -- CP-element group 161: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_update_completed_
      -- CP-element group 161: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Update/ca
      -- CP-element group 161: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/CONCAT_u9_u64_663_Update/$exit
      -- 
    ca_1121_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 161_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u9_u64_663_inst_ack_1, ack => processor_CP_545_elements(161)); -- 
    -- CP-element group 162:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 162: predecessors 
    -- CP-element group 162: 	61 
    -- CP-element group 162: 	149 
    -- CP-element group 162: 	161 
    -- CP-element group 162: marked-predecessors 
    -- CP-element group 162: 	164 
    -- CP-element group 162: successors 
    -- CP-element group 162: 	163 
    -- CP-element group 162:  members (3) 
      -- CP-element group 162: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_sample_start_
      -- CP-element group 162: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Sample/$entry
      -- CP-element group 162: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Sample/req
      -- 
    req_1129_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1129_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(162), ack => WPIPE_mem_in_656_inst_req_0); -- 
    processor_cp_element_group_162: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_162"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= processor_CP_545_elements(61) & processor_CP_545_elements(149) & processor_CP_545_elements(161) & processor_CP_545_elements(164);
      gj_processor_cp_element_group_162 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(162), clk => clk, reset => reset); --
    end block;
    -- CP-element group 163:  fork  transition  input  output  bypass  pipeline-parent 
    -- CP-element group 163: predecessors 
    -- CP-element group 163: 	162 
    -- CP-element group 163: successors 
    -- CP-element group 163: 	164 
    -- CP-element group 163: marked-successors 
    -- CP-element group 163: 	147 
    -- CP-element group 163: 	159 
    -- CP-element group 163:  members (6) 
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_update_start_
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_sample_completed_
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Update/req
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Update/$entry
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Sample/ack
      -- CP-element group 163: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Sample/$exit
      -- 
    ack_1130_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 163_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mem_in_656_inst_ack_0, ack => processor_CP_545_elements(163)); -- 
    req_1134_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1134_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(163), ack => WPIPE_mem_in_656_inst_req_1); -- 
    -- CP-element group 164:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 164: predecessors 
    -- CP-element group 164: 	163 
    -- CP-element group 164: successors 
    -- CP-element group 164: 	235 
    -- CP-element group 164: marked-successors 
    -- CP-element group 164: 	59 
    -- CP-element group 164: 	162 
    -- CP-element group 164:  members (3) 
      -- CP-element group 164: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_update_completed_
      -- CP-element group 164: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Update/ack
      -- CP-element group 164: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/WPIPE_mem_in_656_Update/$exit
      -- 
    ack_1135_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 164_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_mem_in_656_inst_ack_1, ack => processor_CP_545_elements(164)); -- 
    -- CP-element group 165:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 165: predecessors 
    -- CP-element group 165: 	65 
    -- CP-element group 165: marked-predecessors 
    -- CP-element group 165: 	168 
    -- CP-element group 165: successors 
    -- CP-element group 165: 	167 
    -- CP-element group 165:  members (3) 
      -- CP-element group 165: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Sample/rr
      -- CP-element group 165: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Sample/$entry
      -- CP-element group 165: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_sample_start_
      -- 
    rr_1143_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1143_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(165), ack => RPIPE_mem_out_667_inst_req_0); -- 
    processor_cp_element_group_165: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_165"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(168);
      gj_processor_cp_element_group_165 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(165), clk => clk, reset => reset); --
    end block;
    -- CP-element group 166:  join  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 166: predecessors 
    -- CP-element group 166: 	149 
    -- CP-element group 166: 	167 
    -- CP-element group 166: marked-predecessors 
    -- CP-element group 166: 	195 
    -- CP-element group 166: successors 
    -- CP-element group 166: 	168 
    -- CP-element group 166: marked-successors 
    -- CP-element group 166: 	147 
    -- CP-element group 166:  members (3) 
      -- CP-element group 166: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Update/cr
      -- CP-element group 166: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Update/$entry
      -- CP-element group 166: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_update_start_
      -- 
    cr_1148_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1148_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(166), ack => RPIPE_mem_out_667_inst_req_1); -- 
    processor_cp_element_group_166: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_166"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(149) & processor_CP_545_elements(167) & processor_CP_545_elements(195);
      gj_processor_cp_element_group_166 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(166), clk => clk, reset => reset); --
    end block;
    -- CP-element group 167:  transition  input  bypass  pipeline-parent 
    -- CP-element group 167: predecessors 
    -- CP-element group 167: 	165 
    -- CP-element group 167: successors 
    -- CP-element group 167: 	166 
    -- CP-element group 167:  members (3) 
      -- CP-element group 167: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Sample/ra
      -- CP-element group 167: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Sample/$exit
      -- CP-element group 167: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_sample_completed_
      -- 
    ra_1144_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 167_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mem_out_667_inst_ack_0, ack => processor_CP_545_elements(167)); -- 
    -- CP-element group 168:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 168: predecessors 
    -- CP-element group 168: 	166 
    -- CP-element group 168: successors 
    -- CP-element group 168: 	193 
    -- CP-element group 168: marked-successors 
    -- CP-element group 168: 	63 
    -- CP-element group 168: 	165 
    -- CP-element group 168:  members (3) 
      -- CP-element group 168: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Update/ca
      -- CP-element group 168: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_Update/$exit
      -- CP-element group 168: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/RPIPE_mem_out_667_update_completed_
      -- 
    ca_1149_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 168_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_mem_out_667_inst_ack_1, ack => processor_CP_545_elements(168)); -- 
    -- CP-element group 169:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 169: predecessors 
    -- CP-element group 169: 	149 
    -- CP-element group 169: marked-predecessors 
    -- CP-element group 169: 	171 
    -- CP-element group 169: successors 
    -- CP-element group 169: 	171 
    -- CP-element group 169:  members (3) 
      -- CP-element group 169: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Sample/crr
      -- CP-element group 169: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Sample/$entry
      -- CP-element group 169: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_sample_start_
      -- 
    crr_1157_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1157_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(169), ack => call_stmt_671_call_req_0); -- 
    processor_cp_element_group_169: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_169"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(149) & processor_CP_545_elements(171);
      gj_processor_cp_element_group_169 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(169), clk => clk, reset => reset); --
    end block;
    -- CP-element group 170:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 170: predecessors 
    -- CP-element group 170: marked-predecessors 
    -- CP-element group 170: 	172 
    -- CP-element group 170: successors 
    -- CP-element group 170: 	172 
    -- CP-element group 170:  members (3) 
      -- CP-element group 170: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Update/ccr
      -- CP-element group 170: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Update/$entry
      -- CP-element group 170: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_update_start_
      -- 
    ccr_1162_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1162_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(170), ack => call_stmt_671_call_req_1); -- 
    processor_cp_element_group_170: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_170"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= processor_CP_545_elements(172);
      gj_processor_cp_element_group_170 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(170), clk => clk, reset => reset); --
    end block;
    -- CP-element group 171:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 171: predecessors 
    -- CP-element group 171: 	169 
    -- CP-element group 171: successors 
    -- CP-element group 171: marked-successors 
    -- CP-element group 171: 	147 
    -- CP-element group 171: 	169 
    -- CP-element group 171:  members (3) 
      -- CP-element group 171: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Sample/cra
      -- CP-element group 171: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Sample/$exit
      -- CP-element group 171: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_sample_completed_
      -- 
    cra_1158_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 171_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_671_call_ack_0, ack => processor_CP_545_elements(171)); -- 
    -- CP-element group 172:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 172: predecessors 
    -- CP-element group 172: 	170 
    -- CP-element group 172: successors 
    -- CP-element group 172: 	235 
    -- CP-element group 172: marked-successors 
    -- CP-element group 172: 	170 
    -- CP-element group 172:  members (3) 
      -- CP-element group 172: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Update/cca
      -- CP-element group 172: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_Update/$exit
      -- CP-element group 172: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_671_update_completed_
      -- 
    cca_1163_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 172_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_671_call_ack_1, ack => processor_CP_545_elements(172)); -- 
    -- CP-element group 173:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 173: predecessors 
    -- CP-element group 173: 	65 
    -- CP-element group 173: marked-predecessors 
    -- CP-element group 173: 	175 
    -- CP-element group 173: successors 
    -- CP-element group 173: 	175 
    -- CP-element group 173:  members (3) 
      -- CP-element group 173: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Sample/rr
      -- CP-element group 173: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_sample_start_
      -- CP-element group 173: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Sample/$entry
      -- 
    rr_1171_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1171_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(173), ack => EQ_u8_u1_682_inst_req_0); -- 
    processor_cp_element_group_173: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_173"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(175);
      gj_processor_cp_element_group_173 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(173), clk => clk, reset => reset); --
    end block;
    -- CP-element group 174:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 174: predecessors 
    -- CP-element group 174: marked-predecessors 
    -- CP-element group 174: 	176 
    -- CP-element group 174: 	195 
    -- CP-element group 174: successors 
    -- CP-element group 174: 	176 
    -- CP-element group 174:  members (3) 
      -- CP-element group 174: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Update/cr
      -- CP-element group 174: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Update/$entry
      -- CP-element group 174: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_update_start_
      -- 
    cr_1176_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1176_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(174), ack => EQ_u8_u1_682_inst_req_1); -- 
    processor_cp_element_group_174: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_174"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(176) & processor_CP_545_elements(195);
      gj_processor_cp_element_group_174 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(174), clk => clk, reset => reset); --
    end block;
    -- CP-element group 175:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 175: predecessors 
    -- CP-element group 175: 	173 
    -- CP-element group 175: successors 
    -- CP-element group 175: marked-successors 
    -- CP-element group 175: 	63 
    -- CP-element group 175: 	173 
    -- CP-element group 175:  members (3) 
      -- CP-element group 175: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Sample/ra
      -- CP-element group 175: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Sample/$exit
      -- CP-element group 175: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_sample_completed_
      -- 
    ra_1172_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 175_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_682_inst_ack_0, ack => processor_CP_545_elements(175)); -- 
    -- CP-element group 176:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 176: predecessors 
    -- CP-element group 176: 	174 
    -- CP-element group 176: successors 
    -- CP-element group 176: 	193 
    -- CP-element group 176: marked-successors 
    -- CP-element group 176: 	174 
    -- CP-element group 176:  members (3) 
      -- CP-element group 176: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Update/ca
      -- CP-element group 176: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_Update/$exit
      -- CP-element group 176: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_682_update_completed_
      -- 
    ca_1177_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 176_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_682_inst_ack_1, ack => processor_CP_545_elements(176)); -- 
    -- CP-element group 177:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 177: predecessors 
    -- CP-element group 177: 	65 
    -- CP-element group 177: marked-predecessors 
    -- CP-element group 177: 	179 
    -- CP-element group 177: successors 
    -- CP-element group 177: 	179 
    -- CP-element group 177:  members (3) 
      -- CP-element group 177: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Sample/rr
      -- CP-element group 177: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Sample/$entry
      -- CP-element group 177: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_sample_start_
      -- 
    rr_1185_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1185_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(177), ack => EQ_u8_u1_687_inst_req_0); -- 
    processor_cp_element_group_177: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_177"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(179);
      gj_processor_cp_element_group_177 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(177), clk => clk, reset => reset); --
    end block;
    -- CP-element group 178:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 178: predecessors 
    -- CP-element group 178: marked-predecessors 
    -- CP-element group 178: 	180 
    -- CP-element group 178: 	191 
    -- CP-element group 178: successors 
    -- CP-element group 178: 	180 
    -- CP-element group 178:  members (3) 
      -- CP-element group 178: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Update/$entry
      -- CP-element group 178: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_update_start_
      -- CP-element group 178: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Update/cr
      -- 
    cr_1190_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1190_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(178), ack => EQ_u8_u1_687_inst_req_1); -- 
    processor_cp_element_group_178: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_178"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(180) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_178 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(178), clk => clk, reset => reset); --
    end block;
    -- CP-element group 179:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 179: predecessors 
    -- CP-element group 179: 	177 
    -- CP-element group 179: successors 
    -- CP-element group 179: marked-successors 
    -- CP-element group 179: 	63 
    -- CP-element group 179: 	177 
    -- CP-element group 179:  members (3) 
      -- CP-element group 179: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_sample_completed_
      -- CP-element group 179: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Sample/ra
      -- CP-element group 179: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Sample/$exit
      -- 
    ra_1186_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 179_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_687_inst_ack_0, ack => processor_CP_545_elements(179)); -- 
    -- CP-element group 180:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 180: predecessors 
    -- CP-element group 180: 	178 
    -- CP-element group 180: successors 
    -- CP-element group 180: 	189 
    -- CP-element group 180: marked-successors 
    -- CP-element group 180: 	178 
    -- CP-element group 180:  members (3) 
      -- CP-element group 180: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_update_completed_
      -- CP-element group 180: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Update/$exit
      -- CP-element group 180: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_687_Update/ca
      -- 
    ca_1191_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 180_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_687_inst_ack_1, ack => processor_CP_545_elements(180)); -- 
    -- CP-element group 181:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 181: predecessors 
    -- CP-element group 181: 	24 
    -- CP-element group 181: marked-predecessors 
    -- CP-element group 181: 	183 
    -- CP-element group 181: successors 
    -- CP-element group 181: 	183 
    -- CP-element group 181:  members (3) 
      -- CP-element group 181: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Sample/$entry
      -- CP-element group 181: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Sample/rr
      -- CP-element group 181: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_sample_start_
      -- 
    rr_1199_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1199_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(181), ack => type_cast_691_inst_req_0); -- 
    processor_cp_element_group_181: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 20,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_181"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(24) & processor_CP_545_elements(183);
      gj_processor_cp_element_group_181 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(181), clk => clk, reset => reset); --
    end block;
    -- CP-element group 182:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 182: predecessors 
    -- CP-element group 182: marked-predecessors 
    -- CP-element group 182: 	184 
    -- CP-element group 182: 	191 
    -- CP-element group 182: successors 
    -- CP-element group 182: 	184 
    -- CP-element group 182:  members (3) 
      -- CP-element group 182: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Update/$entry
      -- CP-element group 182: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Update/cr
      -- CP-element group 182: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_update_start_
      -- 
    cr_1204_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1204_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(182), ack => type_cast_691_inst_req_1); -- 
    processor_cp_element_group_182: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_182"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(184) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_182 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(182), clk => clk, reset => reset); --
    end block;
    -- CP-element group 183:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 183: predecessors 
    -- CP-element group 183: 	181 
    -- CP-element group 183: successors 
    -- CP-element group 183: marked-successors 
    -- CP-element group 183: 	20 
    -- CP-element group 183: 	181 
    -- CP-element group 183:  members (3) 
      -- CP-element group 183: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Sample/$exit
      -- CP-element group 183: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Sample/ra
      -- CP-element group 183: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_sample_completed_
      -- 
    ra_1200_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 183_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_691_inst_ack_0, ack => processor_CP_545_elements(183)); -- 
    -- CP-element group 184:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 184: predecessors 
    -- CP-element group 184: 	182 
    -- CP-element group 184: successors 
    -- CP-element group 184: 	189 
    -- CP-element group 184: marked-successors 
    -- CP-element group 184: 	182 
    -- CP-element group 184:  members (3) 
      -- CP-element group 184: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Update/$exit
      -- CP-element group 184: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_update_completed_
      -- CP-element group 184: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/type_cast_691_Update/ca
      -- 
    ca_1205_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 184_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_691_inst_ack_1, ack => processor_CP_545_elements(184)); -- 
    -- CP-element group 185:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 185: predecessors 
    -- CP-element group 185: 	65 
    -- CP-element group 185: marked-predecessors 
    -- CP-element group 185: 	187 
    -- CP-element group 185: successors 
    -- CP-element group 185: 	187 
    -- CP-element group 185:  members (3) 
      -- CP-element group 185: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Sample/$entry
      -- CP-element group 185: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_sample_start_
      -- CP-element group 185: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Sample/rr
      -- 
    rr_1213_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1213_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(185), ack => EQ_u1_u1_696_inst_req_0); -- 
    processor_cp_element_group_185: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_185"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(187);
      gj_processor_cp_element_group_185 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(185), clk => clk, reset => reset); --
    end block;
    -- CP-element group 186:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 186: predecessors 
    -- CP-element group 186: marked-predecessors 
    -- CP-element group 186: 	188 
    -- CP-element group 186: 	191 
    -- CP-element group 186: successors 
    -- CP-element group 186: 	188 
    -- CP-element group 186:  members (3) 
      -- CP-element group 186: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_update_start_
      -- CP-element group 186: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Update/$entry
      -- CP-element group 186: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Update/cr
      -- 
    cr_1218_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1218_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(186), ack => EQ_u1_u1_696_inst_req_1); -- 
    processor_cp_element_group_186: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_186"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(188) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_186 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(186), clk => clk, reset => reset); --
    end block;
    -- CP-element group 187:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 187: predecessors 
    -- CP-element group 187: 	185 
    -- CP-element group 187: successors 
    -- CP-element group 187: marked-successors 
    -- CP-element group 187: 	63 
    -- CP-element group 187: 	185 
    -- CP-element group 187:  members (3) 
      -- CP-element group 187: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_sample_completed_
      -- CP-element group 187: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Sample/ra
      -- CP-element group 187: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Sample/$exit
      -- 
    ra_1214_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 187_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u1_u1_696_inst_ack_0, ack => processor_CP_545_elements(187)); -- 
    -- CP-element group 188:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 188: predecessors 
    -- CP-element group 188: 	186 
    -- CP-element group 188: successors 
    -- CP-element group 188: 	189 
    -- CP-element group 188: marked-successors 
    -- CP-element group 188: 	186 
    -- CP-element group 188:  members (3) 
      -- CP-element group 188: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Update/ca
      -- CP-element group 188: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_update_completed_
      -- CP-element group 188: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u1_u1_696_Update/$exit
      -- 
    ca_1219_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 188_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u1_u1_696_inst_ack_1, ack => processor_CP_545_elements(188)); -- 
    -- CP-element group 189:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 189: predecessors 
    -- CP-element group 189: 	137 
    -- CP-element group 189: 	141 
    -- CP-element group 189: 	145 
    -- CP-element group 189: 	180 
    -- CP-element group 189: 	184 
    -- CP-element group 189: 	188 
    -- CP-element group 189: marked-predecessors 
    -- CP-element group 189: 	191 
    -- CP-element group 189: successors 
    -- CP-element group 189: 	191 
    -- CP-element group 189:  members (3) 
      -- CP-element group 189: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_start/req
      -- CP-element group 189: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_start/$entry
      -- CP-element group 189: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_sample_start_
      -- 
    req_1227_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1227_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(189), ack => MUX_706_inst_req_0); -- 
    processor_cp_element_group_189: block -- 
      constant place_capacities: IntegerArray(0 to 6) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 1,6 => 1);
      constant place_markings: IntegerArray(0 to 6)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 1);
      constant place_delays: IntegerArray(0 to 6) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_189"; 
      signal preds: BooleanArray(1 to 7); -- 
    begin -- 
      preds <= processor_CP_545_elements(137) & processor_CP_545_elements(141) & processor_CP_545_elements(145) & processor_CP_545_elements(180) & processor_CP_545_elements(184) & processor_CP_545_elements(188) & processor_CP_545_elements(191);
      gj_processor_cp_element_group_189 : generic_join generic map(name => joinName, number_of_predecessors => 7, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(189), clk => clk, reset => reset); --
    end block;
    -- CP-element group 190:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 190: predecessors 
    -- CP-element group 190: marked-predecessors 
    -- CP-element group 190: 	192 
    -- CP-element group 190: 	195 
    -- CP-element group 190: successors 
    -- CP-element group 190: 	192 
    -- CP-element group 190:  members (3) 
      -- CP-element group 190: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_complete/req
      -- CP-element group 190: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_complete/$entry
      -- CP-element group 190: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_update_start_
      -- 
    req_1232_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1232_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(190), ack => MUX_706_inst_req_1); -- 
    processor_cp_element_group_190: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_190"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(192) & processor_CP_545_elements(195);
      gj_processor_cp_element_group_190 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(190), clk => clk, reset => reset); --
    end block;
    -- CP-element group 191:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 191: predecessors 
    -- CP-element group 191: 	189 
    -- CP-element group 191: successors 
    -- CP-element group 191: marked-successors 
    -- CP-element group 191: 	135 
    -- CP-element group 191: 	139 
    -- CP-element group 191: 	143 
    -- CP-element group 191: 	178 
    -- CP-element group 191: 	182 
    -- CP-element group 191: 	186 
    -- CP-element group 191: 	189 
    -- CP-element group 191:  members (3) 
      -- CP-element group 191: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_start/$exit
      -- CP-element group 191: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_sample_completed_
      -- CP-element group 191: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_start/ack
      -- 
    ack_1228_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 191_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_706_inst_ack_0, ack => processor_CP_545_elements(191)); -- 
    -- CP-element group 192:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 192: predecessors 
    -- CP-element group 192: 	190 
    -- CP-element group 192: successors 
    -- CP-element group 192: 	193 
    -- CP-element group 192: marked-successors 
    -- CP-element group 192: 	190 
    -- CP-element group 192:  members (3) 
      -- CP-element group 192: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_complete/$exit
      -- CP-element group 192: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_complete/ack
      -- CP-element group 192: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_706_update_completed_
      -- 
    ack_1233_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 192_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_706_inst_ack_1, ack => processor_CP_545_elements(192)); -- 
    -- CP-element group 193:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 193: predecessors 
    -- CP-element group 193: 	168 
    -- CP-element group 193: 	176 
    -- CP-element group 193: 	192 
    -- CP-element group 193: marked-predecessors 
    -- CP-element group 193: 	195 
    -- CP-element group 193: successors 
    -- CP-element group 193: 	195 
    -- CP-element group 193:  members (3) 
      -- CP-element group 193: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_start/req
      -- CP-element group 193: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_start/$entry
      -- CP-element group 193: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_sample_start_
      -- 
    req_1241_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1241_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(193), ack => MUX_712_inst_req_0); -- 
    processor_cp_element_group_193: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_193"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= processor_CP_545_elements(168) & processor_CP_545_elements(176) & processor_CP_545_elements(192) & processor_CP_545_elements(195);
      gj_processor_cp_element_group_193 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(193), clk => clk, reset => reset); --
    end block;
    -- CP-element group 194:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 194: predecessors 
    -- CP-element group 194: marked-predecessors 
    -- CP-element group 194: 	196 
    -- CP-element group 194: 	215 
    -- CP-element group 194: 	227 
    -- CP-element group 194: successors 
    -- CP-element group 194: 	196 
    -- CP-element group 194:  members (3) 
      -- CP-element group 194: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_complete/req
      -- CP-element group 194: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_complete/$entry
      -- CP-element group 194: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_update_start_
      -- 
    req_1246_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1246_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(194), ack => MUX_712_inst_req_1); -- 
    processor_cp_element_group_194: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 1,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_194"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= processor_CP_545_elements(196) & processor_CP_545_elements(215) & processor_CP_545_elements(227);
      gj_processor_cp_element_group_194 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(194), clk => clk, reset => reset); --
    end block;
    -- CP-element group 195:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 195: predecessors 
    -- CP-element group 195: 	193 
    -- CP-element group 195: successors 
    -- CP-element group 195: marked-successors 
    -- CP-element group 195: 	166 
    -- CP-element group 195: 	174 
    -- CP-element group 195: 	190 
    -- CP-element group 195: 	193 
    -- CP-element group 195:  members (3) 
      -- CP-element group 195: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_start/ack
      -- CP-element group 195: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_start/$exit
      -- CP-element group 195: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_sample_completed_
      -- 
    ack_1242_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 195_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_712_inst_ack_0, ack => processor_CP_545_elements(195)); -- 
    -- CP-element group 196:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 196: predecessors 
    -- CP-element group 196: 	194 
    -- CP-element group 196: successors 
    -- CP-element group 196: 	213 
    -- CP-element group 196: 	225 
    -- CP-element group 196: marked-successors 
    -- CP-element group 196: 	194 
    -- CP-element group 196:  members (3) 
      -- CP-element group 196: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_complete/ack
      -- CP-element group 196: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_complete/$exit
      -- CP-element group 196: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_712_update_completed_
      -- 
    ack_1247_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 196_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_712_inst_ack_1, ack => processor_CP_545_elements(196)); -- 
    -- CP-element group 197:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 197: predecessors 
    -- CP-element group 197: 	65 
    -- CP-element group 197: marked-predecessors 
    -- CP-element group 197: 	199 
    -- CP-element group 197: successors 
    -- CP-element group 197: 	199 
    -- CP-element group 197:  members (3) 
      -- CP-element group 197: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_sample_start_
      -- CP-element group 197: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Sample/$entry
      -- CP-element group 197: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Sample/req
      -- 
    req_1255_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1255_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(197), ack => W_rs1_imm_671_delayed_10_0_714_inst_req_0); -- 
    processor_cp_element_group_197: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_197"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(199);
      gj_processor_cp_element_group_197 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(197), clk => clk, reset => reset); --
    end block;
    -- CP-element group 198:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 198: predecessors 
    -- CP-element group 198: marked-predecessors 
    -- CP-element group 198: 	200 
    -- CP-element group 198: 	215 
    -- CP-element group 198: successors 
    -- CP-element group 198: 	200 
    -- CP-element group 198:  members (3) 
      -- CP-element group 198: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Update/req
      -- CP-element group 198: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Update/$entry
      -- CP-element group 198: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_update_start_
      -- 
    req_1260_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1260_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(198), ack => W_rs1_imm_671_delayed_10_0_714_inst_req_1); -- 
    processor_cp_element_group_198: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_198"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(200) & processor_CP_545_elements(215);
      gj_processor_cp_element_group_198 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(198), clk => clk, reset => reset); --
    end block;
    -- CP-element group 199:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 199: predecessors 
    -- CP-element group 199: 	197 
    -- CP-element group 199: successors 
    -- CP-element group 199: marked-successors 
    -- CP-element group 199: 	63 
    -- CP-element group 199: 	197 
    -- CP-element group 199:  members (3) 
      -- CP-element group 199: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_sample_completed_
      -- CP-element group 199: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Sample/$exit
      -- CP-element group 199: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Sample/ack
      -- 
    ack_1256_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 199_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rs1_imm_671_delayed_10_0_714_inst_ack_0, ack => processor_CP_545_elements(199)); -- 
    -- CP-element group 200:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 200: predecessors 
    -- CP-element group 200: 	198 
    -- CP-element group 200: successors 
    -- CP-element group 200: 	213 
    -- CP-element group 200: marked-successors 
    -- CP-element group 200: 	198 
    -- CP-element group 200:  members (3) 
      -- CP-element group 200: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_update_completed_
      -- CP-element group 200: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Update/$exit
      -- CP-element group 200: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_716_Update/ack
      -- 
    ack_1261_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 200_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rs1_imm_671_delayed_10_0_714_inst_ack_1, ack => processor_CP_545_elements(200)); -- 
    -- CP-element group 201:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 201: predecessors 
    -- CP-element group 201: 	65 
    -- CP-element group 201: marked-predecessors 
    -- CP-element group 201: 	203 
    -- CP-element group 201: successors 
    -- CP-element group 201: 	203 
    -- CP-element group 201:  members (3) 
      -- CP-element group 201: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Sample/$entry
      -- CP-element group 201: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Sample/req
      -- CP-element group 201: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_sample_start_
      -- 
    req_1269_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1269_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(201), ack => W_rs2_673_delayed_10_0_717_inst_req_0); -- 
    processor_cp_element_group_201: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_201"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(203);
      gj_processor_cp_element_group_201 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(201), clk => clk, reset => reset); --
    end block;
    -- CP-element group 202:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 202: predecessors 
    -- CP-element group 202: marked-predecessors 
    -- CP-element group 202: 	204 
    -- CP-element group 202: 	215 
    -- CP-element group 202: successors 
    -- CP-element group 202: 	204 
    -- CP-element group 202:  members (3) 
      -- CP-element group 202: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Update/req
      -- CP-element group 202: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_update_start_
      -- CP-element group 202: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Update/$entry
      -- 
    req_1274_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1274_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(202), ack => W_rs2_673_delayed_10_0_717_inst_req_1); -- 
    processor_cp_element_group_202: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_202"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(204) & processor_CP_545_elements(215);
      gj_processor_cp_element_group_202 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(202), clk => clk, reset => reset); --
    end block;
    -- CP-element group 203:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 203: predecessors 
    -- CP-element group 203: 	201 
    -- CP-element group 203: successors 
    -- CP-element group 203: marked-successors 
    -- CP-element group 203: 	63 
    -- CP-element group 203: 	201 
    -- CP-element group 203:  members (3) 
      -- CP-element group 203: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Sample/$exit
      -- CP-element group 203: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_sample_completed_
      -- CP-element group 203: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Sample/ack
      -- 
    ack_1270_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 203_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rs2_673_delayed_10_0_717_inst_ack_0, ack => processor_CP_545_elements(203)); -- 
    -- CP-element group 204:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 204: predecessors 
    -- CP-element group 204: 	202 
    -- CP-element group 204: successors 
    -- CP-element group 204: 	213 
    -- CP-element group 204: marked-successors 
    -- CP-element group 204: 	202 
    -- CP-element group 204:  members (3) 
      -- CP-element group 204: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Update/ack
      -- CP-element group 204: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_update_completed_
      -- CP-element group 204: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_719_Update/$exit
      -- 
    ack_1275_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 204_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rs2_673_delayed_10_0_717_inst_ack_1, ack => processor_CP_545_elements(204)); -- 
    -- CP-element group 205:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 205: predecessors 
    -- CP-element group 205: 	65 
    -- CP-element group 205: marked-predecessors 
    -- CP-element group 205: 	207 
    -- CP-element group 205: successors 
    -- CP-element group 205: 	207 
    -- CP-element group 205:  members (3) 
      -- CP-element group 205: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Sample/$entry
      -- CP-element group 205: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Sample/req
      -- CP-element group 205: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_sample_start_
      -- 
    req_1283_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1283_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(205), ack => W_regWrite_674_delayed_10_0_720_inst_req_0); -- 
    processor_cp_element_group_205: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_205"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(207);
      gj_processor_cp_element_group_205 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(205), clk => clk, reset => reset); --
    end block;
    -- CP-element group 206:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 206: predecessors 
    -- CP-element group 206: marked-predecessors 
    -- CP-element group 206: 	208 
    -- CP-element group 206: 	215 
    -- CP-element group 206: successors 
    -- CP-element group 206: 	208 
    -- CP-element group 206:  members (3) 
      -- CP-element group 206: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Update/$entry
      -- CP-element group 206: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_update_start_
      -- CP-element group 206: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Update/req
      -- 
    req_1288_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1288_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(206), ack => W_regWrite_674_delayed_10_0_720_inst_req_1); -- 
    processor_cp_element_group_206: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_206"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(208) & processor_CP_545_elements(215);
      gj_processor_cp_element_group_206 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(206), clk => clk, reset => reset); --
    end block;
    -- CP-element group 207:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 207: predecessors 
    -- CP-element group 207: 	205 
    -- CP-element group 207: successors 
    -- CP-element group 207: marked-successors 
    -- CP-element group 207: 	63 
    -- CP-element group 207: 	205 
    -- CP-element group 207:  members (3) 
      -- CP-element group 207: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Sample/$exit
      -- CP-element group 207: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Sample/ack
      -- CP-element group 207: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_sample_completed_
      -- 
    ack_1284_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 207_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_regWrite_674_delayed_10_0_720_inst_ack_0, ack => processor_CP_545_elements(207)); -- 
    -- CP-element group 208:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 208: predecessors 
    -- CP-element group 208: 	206 
    -- CP-element group 208: successors 
    -- CP-element group 208: 	213 
    -- CP-element group 208: marked-successors 
    -- CP-element group 208: 	206 
    -- CP-element group 208:  members (3) 
      -- CP-element group 208: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Update/ack
      -- CP-element group 208: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_update_completed_
      -- CP-element group 208: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_722_Update/$exit
      -- 
    ack_1289_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 208_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_regWrite_674_delayed_10_0_720_inst_ack_1, ack => processor_CP_545_elements(208)); -- 
    -- CP-element group 209:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 209: predecessors 
    -- CP-element group 209: 	65 
    -- CP-element group 209: marked-predecessors 
    -- CP-element group 209: 	211 
    -- CP-element group 209: successors 
    -- CP-element group 209: 	211 
    -- CP-element group 209:  members (3) 
      -- CP-element group 209: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_sample_start_
      -- CP-element group 209: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Sample/req
      -- CP-element group 209: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Sample/$entry
      -- 
    req_1297_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1297_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(209), ack => W_rd_675_delayed_10_0_723_inst_req_0); -- 
    processor_cp_element_group_209: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_209"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(211);
      gj_processor_cp_element_group_209 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(209), clk => clk, reset => reset); --
    end block;
    -- CP-element group 210:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 210: predecessors 
    -- CP-element group 210: marked-predecessors 
    -- CP-element group 210: 	212 
    -- CP-element group 210: 	215 
    -- CP-element group 210: successors 
    -- CP-element group 210: 	212 
    -- CP-element group 210:  members (3) 
      -- CP-element group 210: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_update_start_
      -- CP-element group 210: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Update/$entry
      -- CP-element group 210: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Update/req
      -- 
    req_1302_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1302_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(210), ack => W_rd_675_delayed_10_0_723_inst_req_1); -- 
    processor_cp_element_group_210: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_210"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(212) & processor_CP_545_elements(215);
      gj_processor_cp_element_group_210 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(210), clk => clk, reset => reset); --
    end block;
    -- CP-element group 211:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 211: predecessors 
    -- CP-element group 211: 	209 
    -- CP-element group 211: successors 
    -- CP-element group 211: marked-successors 
    -- CP-element group 211: 	63 
    -- CP-element group 211: 	209 
    -- CP-element group 211:  members (3) 
      -- CP-element group 211: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Sample/ack
      -- CP-element group 211: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_sample_completed_
      -- CP-element group 211: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Sample/$exit
      -- 
    ack_1298_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 211_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd_675_delayed_10_0_723_inst_ack_0, ack => processor_CP_545_elements(211)); -- 
    -- CP-element group 212:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 212: predecessors 
    -- CP-element group 212: 	210 
    -- CP-element group 212: successors 
    -- CP-element group 212: 	213 
    -- CP-element group 212: marked-successors 
    -- CP-element group 212: 	210 
    -- CP-element group 212:  members (3) 
      -- CP-element group 212: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Update/ack
      -- CP-element group 212: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_Update/$exit
      -- CP-element group 212: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_725_update_completed_
      -- 
    ack_1303_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 212_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd_675_delayed_10_0_723_inst_ack_1, ack => processor_CP_545_elements(212)); -- 
    -- CP-element group 213:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 213: predecessors 
    -- CP-element group 213: 	196 
    -- CP-element group 213: 	200 
    -- CP-element group 213: 	204 
    -- CP-element group 213: 	208 
    -- CP-element group 213: 	212 
    -- CP-element group 213: 	234 
    -- CP-element group 213: marked-predecessors 
    -- CP-element group 213: 	215 
    -- CP-element group 213: successors 
    -- CP-element group 213: 	215 
    -- CP-element group 213:  members (3) 
      -- CP-element group 213: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Sample/crr
      -- CP-element group 213: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Sample/$entry
      -- CP-element group 213: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_sample_start_
      -- 
    crr_1311_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1311_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(213), ack => call_stmt_735_call_req_0); -- 
    processor_cp_element_group_213: block -- 
      constant place_capacities: IntegerArray(0 to 6) := (0 => 1,1 => 1,2 => 1,3 => 1,4 => 1,5 => 20,6 => 1);
      constant place_markings: IntegerArray(0 to 6)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 1);
      constant place_delays: IntegerArray(0 to 6) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_213"; 
      signal preds: BooleanArray(1 to 7); -- 
    begin -- 
      preds <= processor_CP_545_elements(196) & processor_CP_545_elements(200) & processor_CP_545_elements(204) & processor_CP_545_elements(208) & processor_CP_545_elements(212) & processor_CP_545_elements(234) & processor_CP_545_elements(215);
      gj_processor_cp_element_group_213 : generic_join generic map(name => joinName, number_of_predecessors => 7, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(213), clk => clk, reset => reset); --
    end block;
    -- CP-element group 214:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 214: predecessors 
    -- CP-element group 214: marked-predecessors 
    -- CP-element group 214: 	216 
    -- CP-element group 214: successors 
    -- CP-element group 214: 	216 
    -- CP-element group 214:  members (3) 
      -- CP-element group 214: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Update/ccr
      -- CP-element group 214: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Update/$entry
      -- CP-element group 214: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_update_start_
      -- 
    ccr_1316_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1316_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(214), ack => call_stmt_735_call_req_1); -- 
    processor_cp_element_group_214: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_214"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= processor_CP_545_elements(216);
      gj_processor_cp_element_group_214 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(214), clk => clk, reset => reset); --
    end block;
    -- CP-element group 215:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 215: predecessors 
    -- CP-element group 215: 	213 
    -- CP-element group 215: successors 
    -- CP-element group 215: marked-successors 
    -- CP-element group 215: 	194 
    -- CP-element group 215: 	198 
    -- CP-element group 215: 	202 
    -- CP-element group 215: 	206 
    -- CP-element group 215: 	210 
    -- CP-element group 215: 	213 
    -- CP-element group 215:  members (3) 
      -- CP-element group 215: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Sample/cra
      -- CP-element group 215: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Sample/$exit
      -- CP-element group 215: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_sample_completed_
      -- 
    cra_1312_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 215_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_735_call_ack_0, ack => processor_CP_545_elements(215)); -- 
    -- CP-element group 216:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 216: predecessors 
    -- CP-element group 216: 	214 
    -- CP-element group 216: successors 
    -- CP-element group 216: 	235 
    -- CP-element group 216: marked-successors 
    -- CP-element group 216: 	66 
    -- CP-element group 216: 	214 
    -- CP-element group 216:  members (4) 
      -- CP-element group 216: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/ring_reenable_memory_space_0
      -- CP-element group 216: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Update/cca
      -- CP-element group 216: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_Update/$exit
      -- CP-element group 216: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_735_update_completed_
      -- 
    cca_1317_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 216_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_735_call_ack_1, ack => processor_CP_545_elements(216)); -- 
    -- CP-element group 217:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 217: predecessors 
    -- CP-element group 217: 	65 
    -- CP-element group 217: marked-predecessors 
    -- CP-element group 217: 	219 
    -- CP-element group 217: successors 
    -- CP-element group 217: 	219 
    -- CP-element group 217:  members (3) 
      -- CP-element group 217: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Sample/rr
      -- CP-element group 217: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Sample/$entry
      -- CP-element group 217: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_sample_start_
      -- 
    rr_1325_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_1325_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(217), ack => EQ_u8_u1_739_inst_req_0); -- 
    processor_cp_element_group_217: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_217"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(65) & processor_CP_545_elements(219);
      gj_processor_cp_element_group_217 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(217), clk => clk, reset => reset); --
    end block;
    -- CP-element group 218:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 218: predecessors 
    -- CP-element group 218: marked-predecessors 
    -- CP-element group 218: 	220 
    -- CP-element group 218: 	227 
    -- CP-element group 218: successors 
    -- CP-element group 218: 	220 
    -- CP-element group 218:  members (3) 
      -- CP-element group 218: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Update/cr
      -- CP-element group 218: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Update/$entry
      -- CP-element group 218: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_update_start_
      -- 
    cr_1330_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_1330_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(218), ack => EQ_u8_u1_739_inst_req_1); -- 
    processor_cp_element_group_218: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_218"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(220) & processor_CP_545_elements(227);
      gj_processor_cp_element_group_218 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(218), clk => clk, reset => reset); --
    end block;
    -- CP-element group 219:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 219: predecessors 
    -- CP-element group 219: 	217 
    -- CP-element group 219: successors 
    -- CP-element group 219: marked-successors 
    -- CP-element group 219: 	63 
    -- CP-element group 219: 	217 
    -- CP-element group 219:  members (3) 
      -- CP-element group 219: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Sample/ra
      -- CP-element group 219: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Sample/$exit
      -- CP-element group 219: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_sample_completed_
      -- 
    ra_1326_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 219_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_739_inst_ack_0, ack => processor_CP_545_elements(219)); -- 
    -- CP-element group 220:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 220: predecessors 
    -- CP-element group 220: 	218 
    -- CP-element group 220: successors 
    -- CP-element group 220: 	225 
    -- CP-element group 220: marked-successors 
    -- CP-element group 220: 	218 
    -- CP-element group 220:  members (3) 
      -- CP-element group 220: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Update/ca
      -- CP-element group 220: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_Update/$exit
      -- CP-element group 220: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/EQ_u8_u1_739_update_completed_
      -- 
    ca_1331_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 220_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => EQ_u8_u1_739_inst_ack_1, ack => processor_CP_545_elements(220)); -- 
    -- CP-element group 221:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 221: predecessors 
    -- CP-element group 221: 	69 
    -- CP-element group 221: marked-predecessors 
    -- CP-element group 221: 	223 
    -- CP-element group 221: successors 
    -- CP-element group 221: 	223 
    -- CP-element group 221:  members (3) 
      -- CP-element group 221: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Sample/req
      -- CP-element group 221: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Sample/$entry
      -- CP-element group 221: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_sample_start_
      -- 
    req_1339_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1339_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(221), ack => W_rd2_684_delayed_3_0_741_inst_req_0); -- 
    processor_cp_element_group_221: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_221"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(69) & processor_CP_545_elements(223);
      gj_processor_cp_element_group_221 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(221), clk => clk, reset => reset); --
    end block;
    -- CP-element group 222:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 222: predecessors 
    -- CP-element group 222: marked-predecessors 
    -- CP-element group 222: 	224 
    -- CP-element group 222: 	227 
    -- CP-element group 222: successors 
    -- CP-element group 222: 	224 
    -- CP-element group 222:  members (3) 
      -- CP-element group 222: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Update/req
      -- CP-element group 222: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Update/$entry
      -- CP-element group 222: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_update_start_
      -- 
    req_1344_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1344_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(222), ack => W_rd2_684_delayed_3_0_741_inst_req_1); -- 
    processor_cp_element_group_222: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_222"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(224) & processor_CP_545_elements(227);
      gj_processor_cp_element_group_222 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(222), clk => clk, reset => reset); --
    end block;
    -- CP-element group 223:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 223: predecessors 
    -- CP-element group 223: 	221 
    -- CP-element group 223: successors 
    -- CP-element group 223: marked-successors 
    -- CP-element group 223: 	67 
    -- CP-element group 223: 	221 
    -- CP-element group 223:  members (3) 
      -- CP-element group 223: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Sample/ack
      -- CP-element group 223: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Sample/$exit
      -- CP-element group 223: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_sample_completed_
      -- 
    ack_1340_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 223_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd2_684_delayed_3_0_741_inst_ack_0, ack => processor_CP_545_elements(223)); -- 
    -- CP-element group 224:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 224: predecessors 
    -- CP-element group 224: 	222 
    -- CP-element group 224: successors 
    -- CP-element group 224: 	225 
    -- CP-element group 224: marked-successors 
    -- CP-element group 224: 	222 
    -- CP-element group 224:  members (3) 
      -- CP-element group 224: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Update/ack
      -- CP-element group 224: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_Update/$exit
      -- CP-element group 224: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/assign_stmt_743_update_completed_
      -- 
    ack_1345_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 224_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_rd2_684_delayed_3_0_741_inst_ack_1, ack => processor_CP_545_elements(224)); -- 
    -- CP-element group 225:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 225: predecessors 
    -- CP-element group 225: 	196 
    -- CP-element group 225: 	220 
    -- CP-element group 225: 	224 
    -- CP-element group 225: marked-predecessors 
    -- CP-element group 225: 	227 
    -- CP-element group 225: successors 
    -- CP-element group 225: 	227 
    -- CP-element group 225:  members (3) 
      -- CP-element group 225: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_start/req
      -- CP-element group 225: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_start/$entry
      -- CP-element group 225: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_sample_start_
      -- 
    req_1353_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1353_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(225), ack => MUX_748_inst_req_0); -- 
    processor_cp_element_group_225: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 1,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_225"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= processor_CP_545_elements(196) & processor_CP_545_elements(220) & processor_CP_545_elements(224) & processor_CP_545_elements(227);
      gj_processor_cp_element_group_225 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(225), clk => clk, reset => reset); --
    end block;
    -- CP-element group 226:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 226: predecessors 
    -- CP-element group 226: marked-predecessors 
    -- CP-element group 226: 	228 
    -- CP-element group 226: 	231 
    -- CP-element group 226: successors 
    -- CP-element group 226: 	228 
    -- CP-element group 226:  members (3) 
      -- CP-element group 226: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_complete/$entry
      -- CP-element group 226: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_complete/req
      -- CP-element group 226: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_update_start_
      -- 
    req_1358_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_1358_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(226), ack => MUX_748_inst_req_1); -- 
    processor_cp_element_group_226: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_226"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(228) & processor_CP_545_elements(231);
      gj_processor_cp_element_group_226 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(226), clk => clk, reset => reset); --
    end block;
    -- CP-element group 227:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 227: predecessors 
    -- CP-element group 227: 	225 
    -- CP-element group 227: successors 
    -- CP-element group 227: marked-successors 
    -- CP-element group 227: 	194 
    -- CP-element group 227: 	218 
    -- CP-element group 227: 	222 
    -- CP-element group 227: 	225 
    -- CP-element group 227:  members (3) 
      -- CP-element group 227: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_start/ack
      -- CP-element group 227: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_start/$exit
      -- CP-element group 227: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_sample_completed_
      -- 
    ack_1354_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 227_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_748_inst_ack_0, ack => processor_CP_545_elements(227)); -- 
    -- CP-element group 228:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 228: predecessors 
    -- CP-element group 228: 	226 
    -- CP-element group 228: successors 
    -- CP-element group 228: 	229 
    -- CP-element group 228: marked-successors 
    -- CP-element group 228: 	226 
    -- CP-element group 228:  members (3) 
      -- CP-element group 228: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_complete/ack
      -- CP-element group 228: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_complete/$exit
      -- CP-element group 228: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/MUX_748_update_completed_
      -- 
    ack_1359_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 228_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_748_inst_ack_1, ack => processor_CP_545_elements(228)); -- 
    -- CP-element group 229:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 229: predecessors 
    -- CP-element group 229: 	228 
    -- CP-element group 229: marked-predecessors 
    -- CP-element group 229: 	231 
    -- CP-element group 229: successors 
    -- CP-element group 229: 	231 
    -- CP-element group 229:  members (3) 
      -- CP-element group 229: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_sample_start_
      -- CP-element group 229: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Sample/$entry
      -- CP-element group 229: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Sample/crr
      -- 
    crr_1367_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " crr_1367_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(229), ack => call_stmt_751_call_req_0); -- 
    processor_cp_element_group_229: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 30) := "processor_cp_element_group_229"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= processor_CP_545_elements(228) & processor_CP_545_elements(231);
      gj_processor_cp_element_group_229 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(229), clk => clk, reset => reset); --
    end block;
    -- CP-element group 230:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 230: predecessors 
    -- CP-element group 230: marked-predecessors 
    -- CP-element group 230: 	232 
    -- CP-element group 230: successors 
    -- CP-element group 230: 	232 
    -- CP-element group 230:  members (3) 
      -- CP-element group 230: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_update_start_
      -- CP-element group 230: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Update/ccr
      -- CP-element group 230: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Update/$entry
      -- 
    ccr_1372_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " ccr_1372_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(230), ack => call_stmt_751_call_req_1); -- 
    processor_cp_element_group_230: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_230"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= processor_CP_545_elements(232);
      gj_processor_cp_element_group_230 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(230), clk => clk, reset => reset); --
    end block;
    -- CP-element group 231:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 231: predecessors 
    -- CP-element group 231: 	229 
    -- CP-element group 231: successors 
    -- CP-element group 231: marked-successors 
    -- CP-element group 231: 	226 
    -- CP-element group 231: 	229 
    -- CP-element group 231:  members (3) 
      -- CP-element group 231: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_sample_completed_
      -- CP-element group 231: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Sample/$exit
      -- CP-element group 231: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Sample/cra
      -- 
    cra_1368_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 231_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_751_call_ack_0, ack => processor_CP_545_elements(231)); -- 
    -- CP-element group 232:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 232: predecessors 
    -- CP-element group 232: 	230 
    -- CP-element group 232: successors 
    -- CP-element group 232: 	235 
    -- CP-element group 232: marked-successors 
    -- CP-element group 232: 	230 
    -- CP-element group 232:  members (3) 
      -- CP-element group 232: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_update_completed_
      -- CP-element group 232: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Update/cca
      -- CP-element group 232: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_751_Update/$exit
      -- 
    cca_1373_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 232_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => call_stmt_751_call_ack_1, ack => processor_CP_545_elements(232)); -- 
    -- CP-element group 233:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 233: predecessors 
    -- CP-element group 233: 	13 
    -- CP-element group 233: successors 
    -- CP-element group 233: 	14 
    -- CP-element group 233:  members (1) 
      -- CP-element group 233: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/loop_body_delay_to_condition_start
      -- 
    -- Element group processor_CP_545_elements(233) is a control-delay.
    cp_element_233_delay: control_delay_element  generic map(name => " 233_delay", delay_value => 1)  port map(req => processor_CP_545_elements(13), ack => processor_CP_545_elements(233), clk => clk, reset =>reset);
    -- CP-element group 234:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 234: predecessors 
    -- CP-element group 234: 	69 
    -- CP-element group 234: successors 
    -- CP-element group 234: 	213 
    -- CP-element group 234:  members (1) 
      -- CP-element group 234: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/call_stmt_368_call_stmt_735_delay
      -- 
    -- Element group processor_CP_545_elements(234) is a control-delay.
    cp_element_234_delay: control_delay_element  generic map(name => " 234_delay", delay_value => 1)  port map(req => processor_CP_545_elements(69), ack => processor_CP_545_elements(234), clk => clk, reset =>reset);
    -- CP-element group 235:  join  transition  bypass  pipeline-parent 
    -- CP-element group 235: predecessors 
    -- CP-element group 235: 	85 
    -- CP-element group 235: 	73 
    -- CP-element group 235: 	164 
    -- CP-element group 235: 	172 
    -- CP-element group 235: 	216 
    -- CP-element group 235: 	232 
    -- CP-element group 235: successors 
    -- CP-element group 235: 	10 
    -- CP-element group 235:  members (1) 
      -- CP-element group 235: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/do_while_stmt_320_loop_body/$exit
      -- 
    processor_cp_element_group_235: block -- 
      constant place_capacities: IntegerArray(0 to 5) := (0 => 20,1 => 20,2 => 20,3 => 20,4 => 20,5 => 20);
      constant place_markings: IntegerArray(0 to 5)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant place_delays: IntegerArray(0 to 5) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0);
      constant joinName: string(1 to 30) := "processor_cp_element_group_235"; 
      signal preds: BooleanArray(1 to 6); -- 
    begin -- 
      preds <= processor_CP_545_elements(85) & processor_CP_545_elements(73) & processor_CP_545_elements(164) & processor_CP_545_elements(172) & processor_CP_545_elements(216) & processor_CP_545_elements(232);
      gj_processor_cp_element_group_235 : generic_join generic map(name => joinName, number_of_predecessors => 6, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => processor_CP_545_elements(235), clk => clk, reset => reset); --
    end block;
    -- CP-element group 236:  transition  input  bypass  pipeline-parent 
    -- CP-element group 236: predecessors 
    -- CP-element group 236: 	9 
    -- CP-element group 236: successors 
    -- CP-element group 236:  members (2) 
      -- CP-element group 236: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_exit/$exit
      -- CP-element group 236: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_exit/ack
      -- 
    ack_1380_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 236_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_320_branch_ack_0, ack => processor_CP_545_elements(236)); -- 
    -- CP-element group 237:  transition  input  bypass  pipeline-parent 
    -- CP-element group 237: predecessors 
    -- CP-element group 237: 	9 
    -- CP-element group 237: successors 
    -- CP-element group 237:  members (2) 
      -- CP-element group 237: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_taken/ack
      -- CP-element group 237: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/loop_taken/$exit
      -- 
    ack_1384_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 237_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_320_branch_ack_1, ack => processor_CP_545_elements(237)); -- 
    -- CP-element group 238:  transition  bypass  pipeline-parent 
    -- CP-element group 238: predecessors 
    -- CP-element group 238: 	7 
    -- CP-element group 238: successors 
    -- CP-element group 238: 	5 
    -- CP-element group 238:  members (1) 
      -- CP-element group 238: 	 branch_block_stmt_310/branch_block_stmt_319/do_while_stmt_320/$exit
      -- 
    processor_CP_545_elements(238) <= processor_CP_545_elements(7);
    -- CP-element group 239:  merge  fork  transition  place  output  bypass 
    -- CP-element group 239: predecessors 
    -- CP-element group 239: 	5 
    -- CP-element group 239: 	0 
    -- CP-element group 239: successors 
    -- CP-element group 239: 	1 
    -- CP-element group 239: 	2 
    -- CP-element group 239:  members (25) 
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_update_start_
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_sample_start_
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_sample_completed_
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314__entry__
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Update/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/merge_stmt_311__exit__
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Update/ca
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Update/cr
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Update/$exit
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Sample/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Update/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Sample/ra
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Sample/rr
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Sample/$exit
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_Sample/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Sample/req
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_update_completed_
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/assign_stmt_314_Update/req
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_sample_start_
      -- CP-element group 239: 	 branch_block_stmt_310/assign_stmt_314/RPIPE_start_processor_313_update_start_
      -- CP-element group 239: 	 branch_block_stmt_310/merge_stmt_311_PhiAck/dummy
      -- CP-element group 239: 	 branch_block_stmt_310/merge_stmt_311_PhiAck/$entry
      -- CP-element group 239: 	 branch_block_stmt_310/merge_stmt_311_PhiAck/$exit
      -- CP-element group 239: 	 branch_block_stmt_310/merge_stmt_311_PhiReqMerge
      -- 
    req_583_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_583_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(239), ack => W_cmd_312_inst_req_0); -- 
    req_588_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_588_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => processor_CP_545_elements(239), ack => W_cmd_312_inst_req_1); -- 
    processor_CP_545_elements(239) <= OrReduce(processor_CP_545_elements(5) & processor_CP_545_elements(0));
    processor_do_while_stmt_320_terminator_1385: loop_terminator -- 
      generic map (name => " processor_do_while_stmt_320_terminator_1385", max_iterations_in_flight =>20) 
      port map(loop_body_exit => processor_CP_545_elements(10),loop_continue => processor_CP_545_elements(237),loop_terminate => processor_CP_545_elements(236),loop_back => processor_CP_545_elements(8),loop_exit => processor_CP_545_elements(7),clk => clk, reset => reset); -- 
    phi_stmt_322_phi_seq_699_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= processor_CP_545_elements(27);
      processor_CP_545_elements(30)<= src_sample_reqs(0);
      src_sample_acks(0)  <= processor_CP_545_elements(30);
      processor_CP_545_elements(31)<= src_update_reqs(0);
      src_update_acks(0)  <= processor_CP_545_elements(32);
      processor_CP_545_elements(28) <= phi_mux_reqs(0);
      triggers(1)  <= processor_CP_545_elements(25);
      processor_CP_545_elements(34)<= src_sample_reqs(1);
      src_sample_acks(1)  <= processor_CP_545_elements(36);
      processor_CP_545_elements(35)<= src_update_reqs(1);
      src_update_acks(1)  <= processor_CP_545_elements(37);
      processor_CP_545_elements(26) <= phi_mux_reqs(1);
      phi_stmt_322_phi_seq_699 : phi_sequencer_v2-- 
        generic map (place_capacity => 20, ntriggers => 2, name => "phi_stmt_322_phi_seq_699") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => processor_CP_545_elements(21), 
          phi_sample_ack => processor_CP_545_elements(22), 
          phi_update_req => processor_CP_545_elements(23), 
          phi_update_ack => processor_CP_545_elements(24), 
          phi_mux_ack => processor_CP_545_elements(29), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    phi_stmt_326_phi_seq_743_block : block -- 
      signal triggers, src_sample_reqs, src_sample_acks, src_update_reqs, src_update_acks : BooleanArray(0 to 1);
      signal phi_mux_reqs : BooleanArray(0 to 1); -- 
    begin -- 
      triggers(0)  <= processor_CP_545_elements(44);
      processor_CP_545_elements(47)<= src_sample_reqs(0);
      src_sample_acks(0)  <= processor_CP_545_elements(47);
      processor_CP_545_elements(48)<= src_update_reqs(0);
      src_update_acks(0)  <= processor_CP_545_elements(49);
      processor_CP_545_elements(45) <= phi_mux_reqs(0);
      triggers(1)  <= processor_CP_545_elements(42);
      processor_CP_545_elements(51)<= src_sample_reqs(1);
      src_sample_acks(1)  <= processor_CP_545_elements(53);
      processor_CP_545_elements(52)<= src_update_reqs(1);
      src_update_acks(1)  <= processor_CP_545_elements(54);
      processor_CP_545_elements(43) <= phi_mux_reqs(1);
      phi_stmt_326_phi_seq_743 : phi_sequencer_v2-- 
        generic map (place_capacity => 20, ntriggers => 2, name => "phi_stmt_326_phi_seq_743") 
        port map ( -- 
          triggers => triggers, src_sample_starts => src_sample_reqs, 
          src_sample_completes => src_sample_acks, src_update_starts => src_update_reqs, 
          src_update_completes => src_update_acks,
          phi_mux_select_reqs => phi_mux_reqs, 
          phi_sample_req => processor_CP_545_elements(15), 
          phi_sample_ack => processor_CP_545_elements(40), 
          phi_update_req => processor_CP_545_elements(17), 
          phi_update_ack => processor_CP_545_elements(41), 
          phi_mux_ack => processor_CP_545_elements(46), 
          clk => clk, reset => reset -- 
        );
        -- 
    end block;
    entry_tmerge_651_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= processor_CP_545_elements(11);
        preds(1)  <= processor_CP_545_elements(12);
        entry_tmerge_651 : transition_merge -- 
          generic map(name => " entry_tmerge_651")
          port map (preds => preds, symbol_out => processor_CP_545_elements(13));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal ADD_u32_u32_468_wire : std_logic_vector(31 downto 0);
    signal ADD_u32_u32_504_wire : std_logic_vector(31 downto 0);
    signal ADD_u32_u32_576_wire : std_logic_vector(31 downto 0);
    signal AND_u32_u32_476_wire : std_logic_vector(31 downto 0);
    signal CONCAT_u1_u9_334_wire : std_logic_vector(8 downto 0);
    signal CONCAT_u1_u9_659_wire : std_logic_vector(8 downto 0);
    signal CONCAT_u23_u55_337_wire_constant : std_logic_vector(54 downto 0);
    signal CONCAT_u23_u55_662_wire : std_logic_vector(54 downto 0);
    signal CONCAT_u24_u32_415_wire : std_logic_vector(31 downto 0);
    signal CONCAT_u9_u64_338_wire : std_logic_vector(63 downto 0);
    signal CONCAT_u9_u64_663_wire : std_logic_vector(63 downto 0);
    signal EQ_u1_u1_662_662_delayed_8_0_697 : std_logic_vector(0 downto 0);
    signal EQ_u32_u1_540_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_318_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_372_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_412_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_418_418_delayed_7_0_403 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_435_435_delayed_7_0_423 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_444_444_delayed_7_0_428 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_452_452_delayed_7_0_433 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_461_461_delayed_7_0_438 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_471_471_delayed_7_0_443 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_479_479_delayed_7_0_448 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_488_488_delayed_7_0_453 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_498_498_delayed_7_0_408 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_507_507_delayed_7_0_458 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_517_517_delayed_7_0_463 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_547_547_delayed_8_0_568 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_583_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_591_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_594_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_598_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_602_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_605_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_609_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_614_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_617_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_621_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_625_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_628_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_632_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_644_wire : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_653_653_delayed_9_0_683 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_657_657_delayed_8_0_688 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_683_683_delayed_10_0_740 : std_logic_vector(0 downto 0);
    signal EQ_u8_u1_755_wire : std_logic_vector(0 downto 0);
    signal LSHR_u32_u32_525_wire : std_logic_vector(31 downto 0);
    signal LSHR_u32_u32_532_wire : std_logic_vector(31 downto 0);
    signal MUX_431_431_delayed_7_0_418 : std_logic_vector(31 downto 0);
    signal MUX_470_wire : std_logic_vector(31 downto 0);
    signal MUX_478_wire : std_logic_vector(31 downto 0);
    signal MUX_485_wire : std_logic_vector(31 downto 0);
    signal MUX_491_wire : std_logic_vector(31 downto 0);
    signal MUX_498_wire : std_logic_vector(31 downto 0);
    signal MUX_506_wire : std_logic_vector(31 downto 0);
    signal MUX_512_wire : std_logic_vector(31 downto 0);
    signal MUX_520_wire : std_logic_vector(31 downto 0);
    signal MUX_528_wire : std_logic_vector(31 downto 0);
    signal MUX_535_wire : std_logic_vector(31 downto 0);
    signal MUX_543_wire : std_logic_vector(31 downto 0);
    signal MUX_549_wire : std_logic_vector(31 downto 0);
    signal MUX_556_wire : std_logic_vector(31 downto 0);
    signal MUX_559_wire : std_logic_vector(31 downto 0);
    signal MUX_667_667_delayed_1_0_707 : std_logic_vector(31 downto 0);
    signal MUX_705_wire : std_logic_vector(31 downto 0);
    signal NOT_u1_u1_756_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_595_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_599_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_606_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_610_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_611_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_618_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_622_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_629_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_633_wire : std_logic_vector(0 downto 0);
    signal OR_u1_u1_634_wire : std_logic_vector(0 downto 0);
    signal OR_u32_u32_472_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_479_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_483_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_492_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_499_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_500_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_513_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_521_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_536_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_550_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_557_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_560_wire : std_logic_vector(31 downto 0);
    signal OR_u32_u32_561_wire : std_logic_vector(31 downto 0);
    signal RPIPE_start_processor_313_wire : std_logic_vector(7 downto 0);
    signal R_ADD_401_wire_constant : std_logic_vector(7 downto 0);
    signal R_ADD_441_wire_constant : std_logic_vector(7 downto 0);
    signal R_ADD_566_wire_constant : std_logic_vector(7 downto 0);
    signal R_ADD_608_wire_constant : std_logic_vector(7 downto 0);
    signal R_CALL_627_wire_constant : std_logic_vector(7 downto 0);
    signal R_CALL_686_wire_constant : std_logic_vector(7 downto 0);
    signal R_CMP_461_wire_constant : std_logic_vector(7 downto 0);
    signal R_CMP_631_wire_constant : std_logic_vector(7 downto 0);
    signal R_HALT_754_wire_constant : std_logic_vector(7 downto 0);
    signal R_LOAD_593_wire_constant : std_logic_vector(7 downto 0);
    signal R_LOAD_681_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_AND_421_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_AND_597_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_OR_426_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_OR_601_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SLL_451_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SLL_616_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SRA_456_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SRA_624_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SRL_406_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_SRL_620_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_XNOR_431_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_XNOR_604_wire_constant : std_logic_vector(7 downto 0);
    signal R_L_XOR_436_wire_constant : std_logic_vector(7 downto 0);
    signal R_SBIR_411_wire_constant : std_logic_vector(7 downto 0);
    signal R_SBIR_590_wire_constant : std_logic_vector(7 downto 0);
    signal R_STORE_582_wire_constant : std_logic_vector(7 downto 0);
    signal R_STORE_738_wire_constant : std_logic_vector(7 downto 0);
    signal R_SUB_446_wire_constant : std_logic_vector(7 downto 0);
    signal R_SUB_613_wire_constant : std_logic_vector(7 downto 0);
    signal R_minus_1_547_wire_constant : std_logic_vector(31 downto 0);
    signal R_one_1_359_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_1_361_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_1_585_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_1_645_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_1_695_wire_constant : std_logic_vector(0 downto 0);
    signal R_one_32_373_wire_constant : std_logic_vector(31 downto 0);
    signal R_one_32_554_wire_constant : std_logic_vector(31 downto 0);
    signal R_one_8_317_wire_constant : std_logic_vector(7 downto 0);
    signal R_read_signal_332_wire_constant : std_logic_vector(0 downto 0);
    signal R_seven_8_371_wire_constant : std_logic_vector(7 downto 0);
    signal R_uart_addr_643_wire_constant : std_logic_vector(7 downto 0);
    signal R_zero_1_363_wire_constant : std_logic_vector(0 downto 0);
    signal R_zero_1_584_wire_constant : std_logic_vector(0 downto 0);
    signal R_zero_1_646_wire_constant : std_logic_vector(0 downto 0);
    signal R_zero_1_726_wire_constant : std_logic_vector(0 downto 0);
    signal R_zero_1_728_wire_constant : std_logic_vector(0 downto 0);
    signal R_zero_23_660_wire_constant : std_logic_vector(22 downto 0);
    signal R_zero_24_413_wire_constant : std_logic_vector(23 downto 0);
    signal R_zero_32_328_wire_constant : std_logic_vector(31 downto 0);
    signal R_zero_32_365_wire_constant : std_logic_vector(31 downto 0);
    signal R_zero_32_374_wire_constant : std_logic_vector(31 downto 0);
    signal R_zero_32_541_wire_constant : std_logic_vector(31 downto 0);
    signal SHL_u32_u32_517_wire : std_logic_vector(31 downto 0);
    signal SUB_u32_u32_510_wire : std_logic_vector(31 downto 0);
    signal UGT_u32_u1_553_wire : std_logic_vector(0 downto 0);
    signal ULT_u32_u1_546_wire : std_logic_vector(0 downto 0);
    signal XOR_u32_u32_489_wire : std_logic_vector(31 downto 0);
    signal XOR_u32_u32_496_wire : std_logic_vector(31 downto 0);
    signal carry_326 : std_logic_vector(31 downto 0);
    signal carry_549_delayed_8_0_571 : std_logic_vector(31 downto 0);
    signal cmd_314 : std_logic_vector(7 downto 0);
    signal data_from_uart_671 : std_logic_vector(31 downto 0);
    signal data_to_send_uart_749 : std_logic_vector(31 downto 0);
    signal exec_result_579 : std_logic_vector(31 downto 0);
    signal exec_result_init_563 : std_logic_vector(31 downto 0);
    signal instruction_342 : std_logic_vector(31 downto 0);
    signal is_rs1_neg_380 : std_logic_vector(0 downto 0);
    signal is_uart_addr_648 : std_logic_vector(0 downto 0);
    signal konst_324_wire_constant : std_logic_vector(7 downto 0);
    signal konst_416_wire_constant : std_logic_vector(31 downto 0);
    signal konst_469_wire_constant : std_logic_vector(31 downto 0);
    signal konst_477_wire_constant : std_logic_vector(31 downto 0);
    signal konst_484_wire_constant : std_logic_vector(31 downto 0);
    signal konst_490_wire_constant : std_logic_vector(31 downto 0);
    signal konst_497_wire_constant : std_logic_vector(31 downto 0);
    signal konst_505_wire_constant : std_logic_vector(31 downto 0);
    signal konst_511_wire_constant : std_logic_vector(31 downto 0);
    signal konst_519_wire_constant : std_logic_vector(31 downto 0);
    signal konst_527_wire_constant : std_logic_vector(31 downto 0);
    signal konst_534_wire_constant : std_logic_vector(31 downto 0);
    signal konst_542_wire_constant : std_logic_vector(31 downto 0);
    signal konst_548_wire_constant : std_logic_vector(31 downto 0);
    signal konst_555_wire_constant : std_logic_vector(31 downto 0);
    signal konst_558_wire_constant : std_logic_vector(31 downto 0);
    signal konst_676_wire_constant : std_logic_vector(7 downto 0);
    signal memAddr_640 : std_logic_vector(7 downto 0);
    signal memReadData_668 : std_logic_vector(31 downto 0);
    signal memWrite_587 : std_logic_vector(0 downto 0);
    signal memWrite_625_delayed_8_0_651 : std_logic_vector(0 downto 0);
    signal n_carry_376 : std_logic_vector(31 downto 0);
    signal n_carry_376_329_buffered : std_logic_vector(31 downto 0);
    signal n_program_cnt_393 : std_logic_vector(7 downto 0);
    signal n_program_cnt_393_325_buffered : std_logic_vector(7 downto 0);
    signal opcode_346 : std_logic_vector(7 downto 0);
    signal opcode_400_delayed_7_0_383 : std_logic_vector(7 downto 0);
    signal program_cnt_1_678 : std_logic_vector(7 downto 0);
    signal program_cnt_322 : std_logic_vector(7 downto 0);
    signal program_cnt_403_delayed_7_0_386 : std_logic_vector(7 downto 0);
    signal rd1_368 : std_logic_vector(31 downto 0);
    signal rd2_368 : std_logic_vector(31 downto 0);
    signal rd2_629_delayed_1_0_654 : std_logic_vector(31 downto 0);
    signal rd2_684_delayed_3_0_743 : std_logic_vector(31 downto 0);
    signal rd_358 : std_logic_vector(7 downto 0);
    signal rd_675_delayed_10_0_725 : std_logic_vector(7 downto 0);
    signal read_while_write1_735 : std_logic_vector(31 downto 0);
    signal read_while_write2_735 : std_logic_vector(31 downto 0);
    signal regWriteData_713 : std_logic_vector(31 downto 0);
    signal regWrite_636 : std_logic_vector(0 downto 0);
    signal regWrite_674_delayed_10_0_722 : std_logic_vector(0 downto 0);
    signal rs1_imm_350 : std_logic_vector(7 downto 0);
    signal rs1_imm_671_delayed_10_0_716 : std_logic_vector(7 downto 0);
    signal rs2_354 : std_logic_vector(7 downto 0);
    signal rs2_673_delayed_10_0_719 : std_logic_vector(7 downto 0);
    signal type_cast_518_wire : std_logic_vector(31 downto 0);
    signal type_cast_526_wire : std_logic_vector(31 downto 0);
    signal type_cast_533_wire : std_logic_vector(31 downto 0);
    signal type_cast_659_659_delayed_8_0_692 : std_logic_vector(31 downto 0);
    signal type_cast_704_wire_constant : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    CONCAT_u23_u55_337_wire_constant <= "0000000000000000000000000000000000000000000000000000000";
    R_ADD_401_wire_constant <= "00001001";
    R_ADD_441_wire_constant <= "00001001";
    R_ADD_566_wire_constant <= "00001001";
    R_ADD_608_wire_constant <= "00001001";
    R_CALL_627_wire_constant <= "00010000";
    R_CALL_686_wire_constant <= "00010000";
    R_CMP_461_wire_constant <= "00010010";
    R_CMP_631_wire_constant <= "00010010";
    R_HALT_754_wire_constant <= "00000001";
    R_LOAD_593_wire_constant <= "00000011";
    R_LOAD_681_wire_constant <= "00000011";
    R_L_AND_421_wire_constant <= "00000101";
    R_L_AND_597_wire_constant <= "00000101";
    R_L_OR_426_wire_constant <= "00000110";
    R_L_OR_601_wire_constant <= "00000110";
    R_L_SLL_451_wire_constant <= "00001011";
    R_L_SLL_616_wire_constant <= "00001011";
    R_L_SRA_456_wire_constant <= "00001101";
    R_L_SRA_624_wire_constant <= "00001101";
    R_L_SRL_406_wire_constant <= "00001100";
    R_L_SRL_620_wire_constant <= "00001100";
    R_L_XNOR_431_wire_constant <= "00000111";
    R_L_XNOR_604_wire_constant <= "00000111";
    R_L_XOR_436_wire_constant <= "00001000";
    R_SBIR_411_wire_constant <= "00000010";
    R_SBIR_590_wire_constant <= "00000010";
    R_STORE_582_wire_constant <= "00000100";
    R_STORE_738_wire_constant <= "00000100";
    R_SUB_446_wire_constant <= "00001010";
    R_SUB_613_wire_constant <= "00001010";
    R_minus_1_547_wire_constant <= "11111111111111111111111111111111";
    R_one_1_359_wire_constant <= "1";
    R_one_1_361_wire_constant <= "1";
    R_one_1_585_wire_constant <= "1";
    R_one_1_645_wire_constant <= "1";
    R_one_1_695_wire_constant <= "1";
    R_one_32_373_wire_constant <= "00000000000000000000000000000001";
    R_one_32_554_wire_constant <= "00000000000000000000000000000001";
    R_one_8_317_wire_constant <= "00000001";
    R_read_signal_332_wire_constant <= "1";
    R_seven_8_371_wire_constant <= "00000111";
    R_uart_addr_643_wire_constant <= "11111110";
    R_zero_1_363_wire_constant <= "0";
    R_zero_1_584_wire_constant <= "0";
    R_zero_1_646_wire_constant <= "0";
    R_zero_1_726_wire_constant <= "0";
    R_zero_1_728_wire_constant <= "0";
    R_zero_23_660_wire_constant <= "00000000000000000000000";
    R_zero_24_413_wire_constant <= "000000000000000000000000";
    R_zero_32_328_wire_constant <= "00000000000000000000000000000000";
    R_zero_32_365_wire_constant <= "00000000000000000000000000000000";
    R_zero_32_374_wire_constant <= "00000000000000000000000000000000";
    R_zero_32_541_wire_constant <= "00000000000000000000000000000000";
    konst_324_wire_constant <= "00000000";
    konst_416_wire_constant <= "00000000000000000000000000000000";
    konst_469_wire_constant <= "00000000000000000000000000000000";
    konst_477_wire_constant <= "00000000000000000000000000000000";
    konst_484_wire_constant <= "00000000000000000000000000000000";
    konst_490_wire_constant <= "00000000000000000000000000000000";
    konst_497_wire_constant <= "00000000000000000000000000000000";
    konst_505_wire_constant <= "00000000000000000000000000000000";
    konst_511_wire_constant <= "00000000000000000000000000000000";
    konst_519_wire_constant <= "00000000000000000000000000000000";
    konst_527_wire_constant <= "00000000000000000000000000000000";
    konst_534_wire_constant <= "00000000000000000000000000000000";
    konst_542_wire_constant <= "00000000000000000000000000000000";
    konst_548_wire_constant <= "00000000000000000000000000000000";
    konst_555_wire_constant <= "00000000000000000000000000000000";
    konst_558_wire_constant <= "00000000000000000000000000000000";
    konst_676_wire_constant <= "00000001";
    type_cast_704_wire_constant <= "00000000000000000000000000000000";
    phi_stmt_322: Block -- phi operator 
      signal idata: std_logic_vector(15 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= konst_324_wire_constant & n_program_cnt_393_325_buffered;
      req <= phi_stmt_322_req_0 & phi_stmt_322_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_322",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 8) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_322_ack_0,
          idata => idata,
          odata => program_cnt_322,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_322
    phi_stmt_326: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= R_zero_32_328_wire_constant & n_carry_376_329_buffered;
      req <= phi_stmt_326_req_0 & phi_stmt_326_req_1;
      phi: PhiBase -- 
        generic map( -- 
          name => "phi_stmt_326",
          num_reqs => 2,
          bypass_flag => true,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_326_ack_0,
          idata => idata,
          odata => carry_326,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_326
    MUX_375_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_375_inst_req_0;
      MUX_375_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_375_inst_req_1;
      MUX_375_inst_ack_1<= update_ack(0);
      MUX_375_inst: SelectSplitProtocol generic map(name => "MUX_375_inst", data_width => 32, buffering => 2, flow_through => false, full_rate => true) -- 
        port map( x => R_one_32_373_wire_constant, y => R_zero_32_374_wire_constant, sel => EQ_u8_u1_372_wire, z => n_carry_376, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    MUX_417_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_417_inst_req_0;
      MUX_417_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_417_inst_req_1;
      MUX_417_inst_ack_1<= update_ack(0);
      MUX_417_inst: SelectSplitProtocol generic map(name => "MUX_417_inst", data_width => 32, buffering => 7, flow_through => false, full_rate => true) -- 
        port map( x => CONCAT_u24_u32_415_wire, y => konst_416_wire_constant, sel => EQ_u8_u1_412_wire, z => MUX_431_431_delayed_7_0_418, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    -- flow-through select operator MUX_470_inst
    MUX_470_wire <= ADD_u32_u32_468_wire when (EQ_u8_u1_418_418_delayed_7_0_403(0) /=  '0') else konst_469_wire_constant;
    -- flow-through select operator MUX_478_inst
    MUX_478_wire <= AND_u32_u32_476_wire when (EQ_u8_u1_435_435_delayed_7_0_423(0) /=  '0') else konst_477_wire_constant;
    -- flow-through select operator MUX_485_inst
    MUX_485_wire <= OR_u32_u32_483_wire when (EQ_u8_u1_444_444_delayed_7_0_428(0) /=  '0') else konst_484_wire_constant;
    -- flow-through select operator MUX_491_inst
    MUX_491_wire <= XOR_u32_u32_489_wire when (EQ_u8_u1_452_452_delayed_7_0_433(0) /=  '0') else konst_490_wire_constant;
    -- flow-through select operator MUX_498_inst
    MUX_498_wire <= XOR_u32_u32_496_wire when (EQ_u8_u1_461_461_delayed_7_0_438(0) /=  '0') else konst_497_wire_constant;
    -- flow-through select operator MUX_506_inst
    MUX_506_wire <= ADD_u32_u32_504_wire when (EQ_u8_u1_471_471_delayed_7_0_443(0) /=  '0') else konst_505_wire_constant;
    -- flow-through select operator MUX_512_inst
    MUX_512_wire <= SUB_u32_u32_510_wire when (EQ_u8_u1_479_479_delayed_7_0_448(0) /=  '0') else konst_511_wire_constant;
    -- flow-through select operator MUX_520_inst
    MUX_520_wire <= type_cast_518_wire when (EQ_u8_u1_488_488_delayed_7_0_453(0) /=  '0') else konst_519_wire_constant;
    -- flow-through select operator MUX_528_inst
    MUX_528_wire <= type_cast_526_wire when (EQ_u8_u1_498_498_delayed_7_0_408(0) /=  '0') else konst_527_wire_constant;
    -- flow-through select operator MUX_535_inst
    MUX_535_wire <= type_cast_533_wire when (EQ_u8_u1_507_507_delayed_7_0_458(0) /=  '0') else konst_534_wire_constant;
    -- flow-through select operator MUX_543_inst
    MUX_543_wire <= R_zero_32_541_wire_constant when (EQ_u32_u1_540_wire(0) /=  '0') else konst_542_wire_constant;
    -- flow-through select operator MUX_549_inst
    MUX_549_wire <= R_minus_1_547_wire_constant when (ULT_u32_u1_546_wire(0) /=  '0') else konst_548_wire_constant;
    -- flow-through select operator MUX_556_inst
    MUX_556_wire <= R_one_32_554_wire_constant when (UGT_u32_u1_553_wire(0) /=  '0') else konst_555_wire_constant;
    -- flow-through select operator MUX_559_inst
    MUX_559_wire <= OR_u32_u32_557_wire when (EQ_u8_u1_517_517_delayed_7_0_463(0) /=  '0') else konst_558_wire_constant;
    -- flow-through select operator MUX_578_inst
    exec_result_579 <= ADD_u32_u32_576_wire when (EQ_u8_u1_547_547_delayed_8_0_568(0) /=  '0') else exec_result_init_563;
    -- flow-through select operator MUX_586_inst
    memWrite_587 <= R_zero_1_584_wire_constant when (EQ_u8_u1_583_wire(0) /=  '0') else R_one_1_585_wire_constant;
    -- flow-through select operator MUX_647_inst
    is_uart_addr_648 <= R_one_1_645_wire_constant when (EQ_u8_u1_644_wire(0) /=  '0') else R_zero_1_646_wire_constant;
    -- flow-through select operator MUX_705_inst
    MUX_705_wire <= exec_result_579 when (EQ_u1_u1_662_662_delayed_8_0_697(0) /=  '0') else type_cast_704_wire_constant;
    MUX_706_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_706_inst_req_0;
      MUX_706_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_706_inst_req_1;
      MUX_706_inst_ack_1<= update_ack(0);
      MUX_706_inst: SelectSplitProtocol generic map(name => "MUX_706_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => true) -- 
        port map( x => type_cast_659_659_delayed_8_0_692, y => MUX_705_wire, sel => EQ_u8_u1_657_657_delayed_8_0_688, z => MUX_667_667_delayed_1_0_707, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    MUX_712_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_712_inst_req_0;
      MUX_712_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_712_inst_req_1;
      MUX_712_inst_ack_1<= update_ack(0);
      MUX_712_inst: SelectSplitProtocol generic map(name => "MUX_712_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => true) -- 
        port map( x => memReadData_668, y => MUX_667_667_delayed_1_0_707, sel => EQ_u8_u1_653_653_delayed_9_0_683, z => regWriteData_713, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    MUX_748_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_748_inst_req_0;
      MUX_748_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_748_inst_req_1;
      MUX_748_inst_ack_1<= update_ack(0);
      MUX_748_inst: SelectSplitProtocol generic map(name => "MUX_748_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => true) -- 
        port map( x => rd2_684_delayed_3_0_743, y => regWriteData_713, sel => EQ_u8_u1_683_683_delayed_10_0_740, z => data_to_send_uart_749, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    -- flow-through slice operator slice_345_inst
    opcode_346 <= instruction_342(31 downto 24);
    -- flow-through slice operator slice_349_inst
    rs1_imm_350 <= instruction_342(23 downto 16);
    -- flow-through slice operator slice_353_inst
    rs2_354 <= instruction_342(15 downto 8);
    -- flow-through slice operator slice_357_inst
    rd_358 <= instruction_342(7 downto 0);
    -- flow-through slice operator slice_379_inst
    is_rs1_neg_380 <= rd1_368(31 downto 31);
    slice_639_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_639_inst_req_0;
      slice_639_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_639_inst_req_1;
      slice_639_inst_ack_1<= update_ack(0);
      slice_639_inst: SliceSplitProtocol generic map(name => "slice_639_inst", in_data_width => 32, high_index => 7, low_index => 0, buffering => 1, flow_through => false,  full_rate => true) -- 
        port map( din => rd1_368, dout => memAddr_640, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    W_carry_549_delayed_8_0_569_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_carry_549_delayed_8_0_569_inst_req_0;
      W_carry_549_delayed_8_0_569_inst_ack_0<= wack(0);
      rreq(0) <= W_carry_549_delayed_8_0_569_inst_req_1;
      W_carry_549_delayed_8_0_569_inst_ack_1<= rack(0);
      W_carry_549_delayed_8_0_569_inst : InterlockBuffer generic map ( -- 
        name => "W_carry_549_delayed_8_0_569_inst",
        buffer_size => 8,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => carry_326,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => carry_549_delayed_8_0_571,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_cmd_312_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_cmd_312_inst_req_0;
      W_cmd_312_inst_ack_0<= wack(0);
      rreq(0) <= W_cmd_312_inst_req_1;
      W_cmd_312_inst_ack_1<= rack(0);
      W_cmd_312_inst : InterlockBuffer generic map ( -- 
        name => "W_cmd_312_inst",
        buffer_size => 1,
        flow_through =>  false ,
        full_rate =>  false ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => RPIPE_start_processor_313_wire,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => cmd_314,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_memWrite_625_delayed_8_0_649_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_memWrite_625_delayed_8_0_649_inst_req_0;
      W_memWrite_625_delayed_8_0_649_inst_ack_0<= wack(0);
      rreq(0) <= W_memWrite_625_delayed_8_0_649_inst_req_1;
      W_memWrite_625_delayed_8_0_649_inst_ack_1<= rack(0);
      W_memWrite_625_delayed_8_0_649_inst : InterlockBuffer generic map ( -- 
        name => "W_memWrite_625_delayed_8_0_649_inst",
        buffer_size => 8,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => memWrite_587,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => memWrite_625_delayed_8_0_651,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_opcode_400_delayed_7_0_381_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_opcode_400_delayed_7_0_381_inst_req_0;
      W_opcode_400_delayed_7_0_381_inst_ack_0<= wack(0);
      rreq(0) <= W_opcode_400_delayed_7_0_381_inst_req_1;
      W_opcode_400_delayed_7_0_381_inst_ack_1<= rack(0);
      W_opcode_400_delayed_7_0_381_inst : InterlockBuffer generic map ( -- 
        name => "W_opcode_400_delayed_7_0_381_inst",
        buffer_size => 7,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => opcode_346,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => opcode_400_delayed_7_0_383,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_program_cnt_403_delayed_7_0_384_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_program_cnt_403_delayed_7_0_384_inst_req_0;
      W_program_cnt_403_delayed_7_0_384_inst_ack_0<= wack(0);
      rreq(0) <= W_program_cnt_403_delayed_7_0_384_inst_req_1;
      W_program_cnt_403_delayed_7_0_384_inst_ack_1<= rack(0);
      W_program_cnt_403_delayed_7_0_384_inst : InterlockBuffer generic map ( -- 
        name => "W_program_cnt_403_delayed_7_0_384_inst",
        buffer_size => 7,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => program_cnt_322,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => program_cnt_403_delayed_7_0_386,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_rd2_629_delayed_1_0_652_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_rd2_629_delayed_1_0_652_inst_req_0;
      W_rd2_629_delayed_1_0_652_inst_ack_0<= wack(0);
      rreq(0) <= W_rd2_629_delayed_1_0_652_inst_req_1;
      W_rd2_629_delayed_1_0_652_inst_ack_1<= rack(0);
      W_rd2_629_delayed_1_0_652_inst : InterlockBuffer generic map ( -- 
        name => "W_rd2_629_delayed_1_0_652_inst",
        buffer_size => 1,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rd2_368,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => rd2_629_delayed_1_0_654,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_rd2_684_delayed_3_0_741_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_rd2_684_delayed_3_0_741_inst_req_0;
      W_rd2_684_delayed_3_0_741_inst_ack_0<= wack(0);
      rreq(0) <= W_rd2_684_delayed_3_0_741_inst_req_1;
      W_rd2_684_delayed_3_0_741_inst_ack_1<= rack(0);
      W_rd2_684_delayed_3_0_741_inst : InterlockBuffer generic map ( -- 
        name => "W_rd2_684_delayed_3_0_741_inst",
        buffer_size => 3,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rd2_368,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => rd2_684_delayed_3_0_743,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_rd_675_delayed_10_0_723_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_rd_675_delayed_10_0_723_inst_req_0;
      W_rd_675_delayed_10_0_723_inst_ack_0<= wack(0);
      rreq(0) <= W_rd_675_delayed_10_0_723_inst_req_1;
      W_rd_675_delayed_10_0_723_inst_ack_1<= rack(0);
      W_rd_675_delayed_10_0_723_inst : InterlockBuffer generic map ( -- 
        name => "W_rd_675_delayed_10_0_723_inst",
        buffer_size => 10,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rd_358,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => rd_675_delayed_10_0_725,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_regWrite_674_delayed_10_0_720_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_regWrite_674_delayed_10_0_720_inst_req_0;
      W_regWrite_674_delayed_10_0_720_inst_ack_0<= wack(0);
      rreq(0) <= W_regWrite_674_delayed_10_0_720_inst_req_1;
      W_regWrite_674_delayed_10_0_720_inst_ack_1<= rack(0);
      W_regWrite_674_delayed_10_0_720_inst : InterlockBuffer generic map ( -- 
        name => "W_regWrite_674_delayed_10_0_720_inst",
        buffer_size => 10,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => regWrite_636,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => regWrite_674_delayed_10_0_722,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_rs1_imm_671_delayed_10_0_714_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_rs1_imm_671_delayed_10_0_714_inst_req_0;
      W_rs1_imm_671_delayed_10_0_714_inst_ack_0<= wack(0);
      rreq(0) <= W_rs1_imm_671_delayed_10_0_714_inst_req_1;
      W_rs1_imm_671_delayed_10_0_714_inst_ack_1<= rack(0);
      W_rs1_imm_671_delayed_10_0_714_inst : InterlockBuffer generic map ( -- 
        name => "W_rs1_imm_671_delayed_10_0_714_inst",
        buffer_size => 10,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rs1_imm_350,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => rs1_imm_671_delayed_10_0_716,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_rs2_673_delayed_10_0_717_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_rs2_673_delayed_10_0_717_inst_req_0;
      W_rs2_673_delayed_10_0_717_inst_ack_0<= wack(0);
      rreq(0) <= W_rs2_673_delayed_10_0_717_inst_req_1;
      W_rs2_673_delayed_10_0_717_inst_ack_1<= rack(0);
      W_rs2_673_delayed_10_0_717_inst : InterlockBuffer generic map ( -- 
        name => "W_rs2_673_delayed_10_0_717_inst",
        buffer_size => 10,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => rs2_354,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => rs2_673_delayed_10_0_719,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    n_carry_376_329_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= n_carry_376_329_buf_req_0;
      n_carry_376_329_buf_ack_0<= wack(0);
      rreq(0) <= n_carry_376_329_buf_req_1;
      n_carry_376_329_buf_ack_1<= rack(0);
      n_carry_376_329_buf : InterlockBuffer generic map ( -- 
        name => "n_carry_376_329_buf",
        buffer_size => 1,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => n_carry_376,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => n_carry_376_329_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    n_program_cnt_393_325_buf_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= n_program_cnt_393_325_buf_req_0;
      n_program_cnt_393_325_buf_ack_0<= wack(0);
      rreq(0) <= n_program_cnt_393_325_buf_req_1;
      n_program_cnt_393_325_buf_ack_1<= rack(0);
      n_program_cnt_393_325_buf : InterlockBuffer generic map ( -- 
        name => "n_program_cnt_393_325_buf",
        buffer_size => 1,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 8,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => n_program_cnt_393,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => n_program_cnt_393_325_buffered,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- interlock type_cast_518_inst
    process(SHL_u32_u32_517_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := SHL_u32_u32_517_wire(31 downto 0);
      type_cast_518_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_526_inst
    process(LSHR_u32_u32_525_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := LSHR_u32_u32_525_wire(31 downto 0);
      type_cast_526_wire <= tmp_var; -- 
    end process;
    -- interlock type_cast_533_inst
    process(LSHR_u32_u32_532_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      tmp_var := (others => '0'); 
      tmp_var( 31 downto 0) := LSHR_u32_u32_532_wire(31 downto 0);
      type_cast_533_wire <= tmp_var; -- 
    end process;
    type_cast_691_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= type_cast_691_inst_req_0;
      type_cast_691_inst_ack_0<= wack(0);
      rreq(0) <= type_cast_691_inst_req_1;
      type_cast_691_inst_ack_1<= rack(0);
      type_cast_691_inst : InterlockBuffer generic map ( -- 
        name => "type_cast_691_inst",
        buffer_size => 8,
        flow_through =>  false ,
        full_rate =>  true ,
        in_data_width => 8,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => program_cnt_1_678,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => type_cast_659_659_delayed_8_0_692,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_320_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= NOT_u1_u1_756_wire;
      branch_instance: BranchBase -- 
        generic map( name => "do_while_stmt_320_branch", condition_width => 1,  bypass_flag => true)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_320_branch_req_0,
          ack0 => do_while_stmt_320_branch_ack_0,
          ack1 => do_while_stmt_320_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    if_stmt_315_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= EQ_u8_u1_318_wire;
      branch_instance: BranchBase -- 
        generic map( name => "if_stmt_315_branch", condition_width => 1,  bypass_flag => false)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_315_branch_req_0,
          ack0 => if_stmt_315_branch_ack_0,
          ack1 => if_stmt_315_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- binary operator ADD_u32_u32_468_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntAdd_proc(rd1_368, rd2_368, tmp_var);
      ADD_u32_u32_468_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u32_u32_504_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntAdd_proc(rd1_368, rd2_368, tmp_var);
      ADD_u32_u32_504_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u32_u32_576_inst
    process(exec_result_init_563, carry_549_delayed_8_0_571) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntAdd_proc(exec_result_init_563, carry_549_delayed_8_0_571, tmp_var);
      ADD_u32_u32_576_wire <= tmp_var; --
    end process;
    -- binary operator ADD_u8_u8_677_inst
    process(program_cnt_322) -- 
      variable tmp_var : std_logic_vector(7 downto 0); -- 
    begin -- 
      ApIntAdd_proc(program_cnt_322, konst_676_wire_constant, tmp_var);
      program_cnt_1_678 <= tmp_var; --
    end process;
    -- binary operator AND_u32_u32_476_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntAnd_proc(rd1_368, rd2_368, tmp_var);
      AND_u32_u32_476_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u9_334_inst
    process(R_read_signal_332_wire_constant, program_cnt_322) -- 
      variable tmp_var : std_logic_vector(8 downto 0); -- 
    begin -- 
      ApConcat_proc(R_read_signal_332_wire_constant, program_cnt_322, tmp_var);
      CONCAT_u1_u9_334_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u1_u9_659_inst
    process(memWrite_625_delayed_8_0_651, memAddr_640) -- 
      variable tmp_var : std_logic_vector(8 downto 0); -- 
    begin -- 
      ApConcat_proc(memWrite_625_delayed_8_0_651, memAddr_640, tmp_var);
      CONCAT_u1_u9_659_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u23_u55_662_inst
    process(R_zero_23_660_wire_constant, rd2_629_delayed_1_0_654) -- 
      variable tmp_var : std_logic_vector(54 downto 0); -- 
    begin -- 
      ApConcat_proc(R_zero_23_660_wire_constant, rd2_629_delayed_1_0_654, tmp_var);
      CONCAT_u23_u55_662_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u24_u32_415_inst
    process(R_zero_24_413_wire_constant, rs1_imm_350) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApConcat_proc(R_zero_24_413_wire_constant, rs1_imm_350, tmp_var);
      CONCAT_u24_u32_415_wire <= tmp_var; --
    end process;
    -- shared split operator group (9) : CONCAT_u9_u64_338_inst 
    ApConcat_group_9: Block -- 
      signal data_in: std_logic_vector(8 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= CONCAT_u1_u9_334_wire;
      CONCAT_u9_u64_338_wire <= data_out(63 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u9_u64_338_inst_req_0;
      CONCAT_u9_u64_338_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u9_u64_338_inst_req_1;
      CONCAT_u9_u64_338_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_9_gI: SplitGuardInterface generic map(name => "ApConcat_group_9_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_9",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 9,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0000000000000000000000000000000000000000000000000000000",
          constant_width => 55,
          buffering  => 1,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 9
    -- shared split operator group (10) : CONCAT_u9_u64_663_inst 
    ApConcat_group_10: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= CONCAT_u1_u9_659_wire & CONCAT_u23_u55_662_wire;
      CONCAT_u9_u64_663_wire <= data_out(63 downto 0);
      guard_vector(0)  <=  not is_uart_addr_648(0);
      reqL_unguarded(0) <= CONCAT_u9_u64_663_inst_req_0;
      CONCAT_u9_u64_663_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u9_u64_663_inst_req_1;
      CONCAT_u9_u64_663_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_10_gI: SplitGuardInterface generic map(name => "ApConcat_group_10_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_10",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 9,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 55, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 64,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => true,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 10
    -- shared split operator group (11) : EQ_u1_u1_696_inst 
    ApIntEq_group_11: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 8);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= regWrite_636;
      EQ_u1_u1_662_662_delayed_8_0_697 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u1_u1_696_inst_req_0;
      EQ_u1_u1_696_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u1_u1_696_inst_req_1;
      EQ_u1_u1_696_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_11_gI: SplitGuardInterface generic map(name => "ApIntEq_group_11_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_11",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "1",
          constant_width => 1,
          buffering  => 8,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 11
    -- binary operator EQ_u32_u1_540_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(rd1_368, rd2_368, tmp_var);
      EQ_u32_u1_540_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_318_inst
    process(cmd_314) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(cmd_314, R_one_8_317_wire_constant, tmp_var);
      EQ_u8_u1_318_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_372_inst
    process(program_cnt_322) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(program_cnt_322, R_seven_8_371_wire_constant, tmp_var);
      EQ_u8_u1_372_wire <= tmp_var; --
    end process;
    -- shared split operator group (15) : EQ_u8_u1_402_inst 
    ApIntEq_group_15: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_418_418_delayed_7_0_403 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_402_inst_req_0;
      EQ_u8_u1_402_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_402_inst_req_1;
      EQ_u8_u1_402_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_15_gI: SplitGuardInterface generic map(name => "ApIntEq_group_15_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_15",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001001",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 15
    -- shared split operator group (16) : EQ_u8_u1_407_inst 
    ApIntEq_group_16: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_498_498_delayed_7_0_408 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_407_inst_req_0;
      EQ_u8_u1_407_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_407_inst_req_1;
      EQ_u8_u1_407_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_16_gI: SplitGuardInterface generic map(name => "ApIntEq_group_16_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_16",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001100",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 16
    -- binary operator EQ_u8_u1_412_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_SBIR_411_wire_constant, tmp_var);
      EQ_u8_u1_412_wire <= tmp_var; --
    end process;
    -- shared split operator group (18) : EQ_u8_u1_422_inst 
    ApIntEq_group_18: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_435_435_delayed_7_0_423 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_422_inst_req_0;
      EQ_u8_u1_422_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_422_inst_req_1;
      EQ_u8_u1_422_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_18_gI: SplitGuardInterface generic map(name => "ApIntEq_group_18_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_18",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000101",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 18
    -- shared split operator group (19) : EQ_u8_u1_427_inst 
    ApIntEq_group_19: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_444_444_delayed_7_0_428 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_427_inst_req_0;
      EQ_u8_u1_427_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_427_inst_req_1;
      EQ_u8_u1_427_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_19_gI: SplitGuardInterface generic map(name => "ApIntEq_group_19_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_19",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000110",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 19
    -- shared split operator group (20) : EQ_u8_u1_432_inst 
    ApIntEq_group_20: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_452_452_delayed_7_0_433 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_432_inst_req_0;
      EQ_u8_u1_432_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_432_inst_req_1;
      EQ_u8_u1_432_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_20_gI: SplitGuardInterface generic map(name => "ApIntEq_group_20_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_20",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000111",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 20
    -- shared split operator group (21) : EQ_u8_u1_437_inst 
    ApIntEq_group_21: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_461_461_delayed_7_0_438 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_437_inst_req_0;
      EQ_u8_u1_437_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_437_inst_req_1;
      EQ_u8_u1_437_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_21_gI: SplitGuardInterface generic map(name => "ApIntEq_group_21_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_21",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001000",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 21
    -- shared split operator group (22) : EQ_u8_u1_442_inst 
    ApIntEq_group_22: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_471_471_delayed_7_0_443 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_442_inst_req_0;
      EQ_u8_u1_442_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_442_inst_req_1;
      EQ_u8_u1_442_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_22_gI: SplitGuardInterface generic map(name => "ApIntEq_group_22_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_22",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001001",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 22
    -- shared split operator group (23) : EQ_u8_u1_447_inst 
    ApIntEq_group_23: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_479_479_delayed_7_0_448 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_447_inst_req_0;
      EQ_u8_u1_447_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_447_inst_req_1;
      EQ_u8_u1_447_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_23_gI: SplitGuardInterface generic map(name => "ApIntEq_group_23_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_23",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001010",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 23
    -- shared split operator group (24) : EQ_u8_u1_452_inst 
    ApIntEq_group_24: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_488_488_delayed_7_0_453 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_452_inst_req_0;
      EQ_u8_u1_452_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_452_inst_req_1;
      EQ_u8_u1_452_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_24_gI: SplitGuardInterface generic map(name => "ApIntEq_group_24_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_24",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001011",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 24
    -- shared split operator group (25) : EQ_u8_u1_457_inst 
    ApIntEq_group_25: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_507_507_delayed_7_0_458 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_457_inst_req_0;
      EQ_u8_u1_457_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_457_inst_req_1;
      EQ_u8_u1_457_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_25_gI: SplitGuardInterface generic map(name => "ApIntEq_group_25_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_25",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001101",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 25
    -- shared split operator group (26) : EQ_u8_u1_462_inst 
    ApIntEq_group_26: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_517_517_delayed_7_0_463 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_462_inst_req_0;
      EQ_u8_u1_462_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_462_inst_req_1;
      EQ_u8_u1_462_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_26_gI: SplitGuardInterface generic map(name => "ApIntEq_group_26_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_26",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00010010",
          constant_width => 8,
          buffering  => 7,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 26
    -- shared split operator group (27) : EQ_u8_u1_567_inst 
    ApIntEq_group_27: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 8);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_547_547_delayed_8_0_568 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_567_inst_req_0;
      EQ_u8_u1_567_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_567_inst_req_1;
      EQ_u8_u1_567_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_27_gI: SplitGuardInterface generic map(name => "ApIntEq_group_27_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_27",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00001001",
          constant_width => 8,
          buffering  => 8,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 27
    -- binary operator EQ_u8_u1_583_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_STORE_582_wire_constant, tmp_var);
      EQ_u8_u1_583_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_591_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_SBIR_590_wire_constant, tmp_var);
      EQ_u8_u1_591_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_594_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_LOAD_593_wire_constant, tmp_var);
      EQ_u8_u1_594_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_598_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_AND_597_wire_constant, tmp_var);
      EQ_u8_u1_598_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_602_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_OR_601_wire_constant, tmp_var);
      EQ_u8_u1_602_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_605_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_XNOR_604_wire_constant, tmp_var);
      EQ_u8_u1_605_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_609_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_ADD_608_wire_constant, tmp_var);
      EQ_u8_u1_609_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_614_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_SUB_613_wire_constant, tmp_var);
      EQ_u8_u1_614_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_617_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_SLL_616_wire_constant, tmp_var);
      EQ_u8_u1_617_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_621_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_SRL_620_wire_constant, tmp_var);
      EQ_u8_u1_621_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_625_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_L_SRA_624_wire_constant, tmp_var);
      EQ_u8_u1_625_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_628_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_CALL_627_wire_constant, tmp_var);
      EQ_u8_u1_628_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_632_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_CMP_631_wire_constant, tmp_var);
      EQ_u8_u1_632_wire <= tmp_var; --
    end process;
    -- binary operator EQ_u8_u1_644_inst
    process(memAddr_640) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(memAddr_640, R_uart_addr_643_wire_constant, tmp_var);
      EQ_u8_u1_644_wire <= tmp_var; --
    end process;
    -- shared split operator group (42) : EQ_u8_u1_682_inst 
    ApIntEq_group_42: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 9);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_653_653_delayed_9_0_683 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_682_inst_req_0;
      EQ_u8_u1_682_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_682_inst_req_1;
      EQ_u8_u1_682_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_42_gI: SplitGuardInterface generic map(name => "ApIntEq_group_42_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_42",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000011",
          constant_width => 8,
          buffering  => 9,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 42
    -- shared split operator group (43) : EQ_u8_u1_687_inst 
    ApIntEq_group_43: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 8);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_657_657_delayed_8_0_688 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_687_inst_req_0;
      EQ_u8_u1_687_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_687_inst_req_1;
      EQ_u8_u1_687_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_43_gI: SplitGuardInterface generic map(name => "ApIntEq_group_43_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_43",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00010000",
          constant_width => 8,
          buffering  => 8,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 43
    -- shared split operator group (44) : EQ_u8_u1_739_inst 
    ApIntEq_group_44: Block -- 
      signal data_in: std_logic_vector(7 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 10);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= opcode_346;
      EQ_u8_u1_683_683_delayed_10_0_740 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= EQ_u8_u1_739_inst_req_0;
      EQ_u8_u1_739_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= EQ_u8_u1_739_inst_req_1;
      EQ_u8_u1_739_inst_ack_1 <= ackR_unguarded(0);
      ApIntEq_group_44_gI: SplitGuardInterface generic map(name => "ApIntEq_group_44_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntEq",
          name => "ApIntEq_group_44",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 8,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000100",
          constant_width => 8,
          buffering  => 10,
          flow_through => false,
          full_rate  => true,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 44
    -- binary operator EQ_u8_u1_755_inst
    process(opcode_346) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntEq_proc(opcode_346, R_HALT_754_wire_constant, tmp_var);
      EQ_u8_u1_755_wire <= tmp_var; --
    end process;
    -- binary operator LSHR_u32_u32_525_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntLSHR_proc(rd1_368, rd2_368, tmp_var);
      LSHR_u32_u32_525_wire <= tmp_var; --
    end process;
    -- binary operator LSHR_u32_u32_532_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntLSHR_proc(rd1_368, rd2_368, tmp_var);
      LSHR_u32_u32_532_wire <= tmp_var; --
    end process;
    -- unary operator NOT_u1_u1_756_inst
    process(EQ_u8_u1_755_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      SingleInputOperation("ApIntNot", EQ_u8_u1_755_wire, tmp_var);
      NOT_u1_u1_756_wire <= tmp_var; -- 
    end process;
    -- binary operator OR_u1_u1_595_inst
    process(EQ_u8_u1_591_wire, EQ_u8_u1_594_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u8_u1_591_wire, EQ_u8_u1_594_wire, tmp_var);
      OR_u1_u1_595_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_599_inst
    process(OR_u1_u1_595_wire, EQ_u8_u1_598_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_595_wire, EQ_u8_u1_598_wire, tmp_var);
      OR_u1_u1_599_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_606_inst
    process(EQ_u8_u1_602_wire, EQ_u8_u1_605_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u8_u1_602_wire, EQ_u8_u1_605_wire, tmp_var);
      OR_u1_u1_606_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_610_inst
    process(OR_u1_u1_606_wire, EQ_u8_u1_609_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_606_wire, EQ_u8_u1_609_wire, tmp_var);
      OR_u1_u1_610_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_611_inst
    process(OR_u1_u1_599_wire, OR_u1_u1_610_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_599_wire, OR_u1_u1_610_wire, tmp_var);
      OR_u1_u1_611_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_618_inst
    process(EQ_u8_u1_614_wire, EQ_u8_u1_617_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u8_u1_614_wire, EQ_u8_u1_617_wire, tmp_var);
      OR_u1_u1_618_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_622_inst
    process(OR_u1_u1_618_wire, EQ_u8_u1_621_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_618_wire, EQ_u8_u1_621_wire, tmp_var);
      OR_u1_u1_622_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_629_inst
    process(EQ_u8_u1_625_wire, EQ_u8_u1_628_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(EQ_u8_u1_625_wire, EQ_u8_u1_628_wire, tmp_var);
      OR_u1_u1_629_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_633_inst
    process(OR_u1_u1_629_wire, EQ_u8_u1_632_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_629_wire, EQ_u8_u1_632_wire, tmp_var);
      OR_u1_u1_633_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_634_inst
    process(OR_u1_u1_622_wire, OR_u1_u1_633_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_622_wire, OR_u1_u1_633_wire, tmp_var);
      OR_u1_u1_634_wire <= tmp_var; --
    end process;
    -- binary operator OR_u1_u1_635_inst
    process(OR_u1_u1_611_wire, OR_u1_u1_634_wire) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u1_u1_611_wire, OR_u1_u1_634_wire, tmp_var);
      regWrite_636 <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_472_inst
    process(MUX_470_wire, MUX_431_431_delayed_7_0_418) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_470_wire, MUX_431_431_delayed_7_0_418, tmp_var);
      OR_u32_u32_472_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_479_inst
    process(OR_u32_u32_472_wire, MUX_478_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_472_wire, MUX_478_wire, tmp_var);
      OR_u32_u32_479_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_483_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(rd1_368, rd2_368, tmp_var);
      OR_u32_u32_483_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_492_inst
    process(MUX_485_wire, MUX_491_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_485_wire, MUX_491_wire, tmp_var);
      OR_u32_u32_492_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_499_inst
    process(OR_u32_u32_492_wire, MUX_498_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_492_wire, MUX_498_wire, tmp_var);
      OR_u32_u32_499_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_500_inst
    process(OR_u32_u32_479_wire, OR_u32_u32_499_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_479_wire, OR_u32_u32_499_wire, tmp_var);
      OR_u32_u32_500_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_513_inst
    process(MUX_506_wire, MUX_512_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_506_wire, MUX_512_wire, tmp_var);
      OR_u32_u32_513_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_521_inst
    process(OR_u32_u32_513_wire, MUX_520_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_513_wire, MUX_520_wire, tmp_var);
      OR_u32_u32_521_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_536_inst
    process(MUX_528_wire, MUX_535_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_528_wire, MUX_535_wire, tmp_var);
      OR_u32_u32_536_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_550_inst
    process(MUX_543_wire, MUX_549_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(MUX_543_wire, MUX_549_wire, tmp_var);
      OR_u32_u32_550_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_557_inst
    process(OR_u32_u32_550_wire, MUX_556_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_550_wire, MUX_556_wire, tmp_var);
      OR_u32_u32_557_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_560_inst
    process(OR_u32_u32_536_wire, MUX_559_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_536_wire, MUX_559_wire, tmp_var);
      OR_u32_u32_560_wire <= tmp_var; --
    end process;
    -- binary operator OR_u32_u32_561_inst
    process(OR_u32_u32_521_wire, OR_u32_u32_560_wire) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntOr_proc(OR_u32_u32_521_wire, OR_u32_u32_560_wire, tmp_var);
      OR_u32_u32_561_wire <= tmp_var; --
    end process;
    -- shared split operator group (73) : OR_u32_u32_562_inst 
    ApIntOr_group_73: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= OR_u32_u32_500_wire & OR_u32_u32_561_wire;
      exec_result_init_563 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= OR_u32_u32_562_inst_req_0;
      OR_u32_u32_562_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= OR_u32_u32_562_inst_req_1;
      OR_u32_u32_562_inst_ack_1 <= ackR_unguarded(0);
      ApIntOr_group_73_gI: SplitGuardInterface generic map(name => "ApIntOr_group_73_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApIntOr",
          name => "ApIntOr_group_73",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 32,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 32, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 32,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => true,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 73
    -- binary operator SHL_u32_u32_517_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntSHL_proc(rd1_368, rd2_368, tmp_var);
      SHL_u32_u32_517_wire <= tmp_var; --
    end process;
    -- binary operator SUB_u32_u32_510_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntSub_proc(rd1_368, rd2_368, tmp_var);
      SUB_u32_u32_510_wire <= tmp_var; --
    end process;
    -- binary operator UGT_u32_u1_553_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUgt_proc(rd1_368, rd2_368, tmp_var);
      UGT_u32_u1_553_wire <= tmp_var; --
    end process;
    -- binary operator ULT_u32_u1_546_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(0 downto 0); -- 
    begin -- 
      ApIntUlt_proc(rd1_368, rd2_368, tmp_var);
      ULT_u32_u1_546_wire <= tmp_var; --
    end process;
    -- binary operator XOR_u32_u32_489_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntXnor_proc(rd1_368, rd2_368, tmp_var);
      XOR_u32_u32_489_wire <= tmp_var; --
    end process;
    -- binary operator XOR_u32_u32_496_inst
    process(rd1_368, rd2_368) -- 
      variable tmp_var : std_logic_vector(31 downto 0); -- 
    begin -- 
      ApIntXor_proc(rd1_368, rd2_368, tmp_var);
      XOR_u32_u32_496_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_mem_out_667_inst RPIPE_mem_out_341_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(63 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 1 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 2, 0 => 2);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => true);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 2, 1 => 2);
      -- 
    begin -- 
      reqL_unguarded(1) <= RPIPE_mem_out_667_inst_req_0;
      reqL_unguarded(0) <= RPIPE_mem_out_341_inst_req_0;
      RPIPE_mem_out_667_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_mem_out_341_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= RPIPE_mem_out_667_inst_req_1;
      reqR_unguarded(0) <= RPIPE_mem_out_341_inst_req_1;
      RPIPE_mem_out_667_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_mem_out_341_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  not is_uart_addr_648(0);
      memReadData_668 <= data_out(63 downto 32);
      instruction_342 <= data_out(31 downto 0);
      mem_out_read_0_gI: SplitGuardInterface generic map(name => "mem_out_read_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      mem_out_read_0: InputPortRevised -- 
        generic map ( name => "mem_out_read_0", data_width => 32,  num_reqs => 2,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => mem_out_pipe_read_req(0),
          oack => mem_out_pipe_read_ack(0),
          odata => mem_out_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- read from input-signal start_processor
    RPIPE_start_processor_313_wire <= start_processor;
    -- shared outport operator group (0) : WPIPE_mem_in_656_inst WPIPE_mem_in_331_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(127 downto 0);
      signal sample_req, sample_ack : BooleanArray( 1 downto 0);
      signal update_req, update_ack : BooleanArray( 1 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 1 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant inBUFs : IntegerArray(1 downto 0) := (1 => 0, 0 => 0);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => true);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 2, 1 => 2);
      -- 
    begin -- 
      sample_req_unguarded(1) <= WPIPE_mem_in_656_inst_req_0;
      sample_req_unguarded(0) <= WPIPE_mem_in_331_inst_req_0;
      WPIPE_mem_in_656_inst_ack_0 <= sample_ack_unguarded(1);
      WPIPE_mem_in_331_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(1) <= WPIPE_mem_in_656_inst_req_1;
      update_req_unguarded(0) <= WPIPE_mem_in_331_inst_req_1;
      WPIPE_mem_in_656_inst_ack_1 <= update_ack_unguarded(1);
      WPIPE_mem_in_331_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  not is_uart_addr_648(0);
      data_in <= CONCAT_u9_u64_663_wire & CONCAT_u9_u64_338_wire;
      mem_in_write_0_gI: SplitGuardInterface generic map(name => "mem_in_write_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      mem_in_write_0: OutputPortRevised -- 
        generic map ( name => "mem_in", data_width => 64, num_reqs => 2, input_buffering => inBUFs, full_rate => true,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => mem_in_pipe_write_req(0),
          oack => mem_in_pipe_write_ack(0),
          odata => mem_in_pipe_write_data(63 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared call operator group (0) : call_stmt_735_call call_stmt_368_call 
    registerFileModule_call_group_0: Block -- 
      signal data_in: std_logic_vector(117 downto 0);
      signal data_out: std_logic_vector(127 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant inBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 2, 0 => 2);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 7, 1 => 7);
      -- 
    begin -- 
      reqL_unguarded(1) <= call_stmt_735_call_req_0;
      reqL_unguarded(0) <= call_stmt_368_call_req_0;
      call_stmt_735_call_ack_0 <= ackL_unguarded(1);
      call_stmt_368_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= call_stmt_735_call_req_1;
      reqR_unguarded(0) <= call_stmt_368_call_req_1;
      call_stmt_735_call_ack_1 <= ackR_unguarded(1);
      call_stmt_368_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      registerFileModule_call_group_0_accessRegulator_0: access_regulator_base generic map (name => "registerFileModule_call_group_0_accessRegulator_0", num_slots => 2) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      registerFileModule_call_group_0_accessRegulator_1: access_regulator_base generic map (name => "registerFileModule_call_group_0_accessRegulator_1", num_slots => 2) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      registerFileModule_call_group_0_gI: SplitGuardInterface generic map(name => "registerFileModule_call_group_0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= R_zero_1_726_wire_constant & rs1_imm_671_delayed_10_0_716 & R_zero_1_728_wire_constant & rs2_673_delayed_10_0_719 & regWrite_674_delayed_10_0_722 & rd_675_delayed_10_0_725 & regWriteData_713 & R_one_1_359_wire_constant & rs1_imm_350 & R_one_1_361_wire_constant & rs2_354 & R_zero_1_363_wire_constant & rd_358 & R_zero_32_365_wire_constant;
      read_while_write1_735 <= data_out(127 downto 96);
      read_while_write2_735 <= data_out(95 downto 64);
      rd1_368 <= data_out(63 downto 32);
      rd2_368 <= data_out(31 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 118,
        owidth => 59,
        buffering => inBUFs,
        full_rate =>  true,
        twidth => 2,
        nreqs => 2,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => registerFileModule_call_reqs(0),
          ackR => registerFileModule_call_acks(0),
          dataR => registerFileModule_call_data(58 downto 0),
          tagR => registerFileModule_call_tag(1 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 64,
          owidth => 128,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 2,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 2) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => registerFileModule_return_acks(0), -- cross-over
          ackL => registerFileModule_return_reqs(0), -- cross-over
          dataL => registerFileModule_return_data(63 downto 0),
          tagL => registerFileModule_return_tag(1 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 0
    -- shared call operator group (1) : call_stmt_393_call 
    cal_Next_program_cnt_call_group_1: Block -- 
      signal data_in: std_logic_vector(80 downto 0);
      signal data_out: std_logic_vector(7 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_393_call_req_0;
      call_stmt_393_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_393_call_req_1;
      call_stmt_393_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      cal_Next_program_cnt_call_group_1_gI: SplitGuardInterface generic map(name => "cal_Next_program_cnt_call_group_1_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= opcode_400_delayed_7_0_383 & rd1_368 & rd2_368 & program_cnt_403_delayed_7_0_386 & is_rs1_neg_380;
      n_program_cnt_393 <= data_out(7 downto 0);
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 81,
        owidth => 81,
        buffering => inBUFs,
        full_rate =>  true,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => cal_Next_program_cnt_call_reqs(0),
          ackR => cal_Next_program_cnt_call_acks(0),
          dataR => cal_Next_program_cnt_call_data(80 downto 0),
          tagR => cal_Next_program_cnt_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 8,
          owidth => 8,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => cal_Next_program_cnt_return_acks(0), -- cross-over
          ackL => cal_Next_program_cnt_return_reqs(0), -- cross-over
          dataL => cal_Next_program_cnt_return_data(7 downto 0),
          tagL => cal_Next_program_cnt_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 1
    -- shared call operator group (2) : call_stmt_671_call 
    receive_from_uart_call_group_2: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_671_call_req_0;
      call_stmt_671_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_671_call_req_1;
      call_stmt_671_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= is_uart_addr_648(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      receive_from_uart_call_group_2_gI: SplitGuardInterface generic map(name => "receive_from_uart_call_group_2_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_from_uart_671 <= data_out(31 downto 0);
      CallReq: InputMuxBaseNoData -- 
        generic map (name => "InputMuxBaseNoData",
        twidth => 1,
        nreqs => 1,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          reqR => receive_from_uart_call_reqs(0),
          ackR => receive_from_uart_call_acks(0),
          tagR => receive_from_uart_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseWithBuffering -- 
        generic map ( -- 
          iwidth => 32,
          owidth => 32,
          detailed_buffering_per_output => outBUFs, 
          full_rate => true, 
          twidth => 1,
          name => "OutputDemuxBaseWithBuffering",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          reqL => receive_from_uart_return_acks(0), -- cross-over
          ackL => receive_from_uart_return_reqs(0), -- cross-over
          dataL => receive_from_uart_return_data(31 downto 0),
          tagL => receive_from_uart_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 2
    -- shared call operator group (3) : call_stmt_751_call 
    send_to_uart_call_group_3: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant outBUFs: IntegerArray(0 downto 0) := (others => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= call_stmt_751_call_req_0;
      call_stmt_751_call_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= call_stmt_751_call_req_1;
      call_stmt_751_call_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      send_to_uart_call_group_3_gI: SplitGuardInterface generic map(name => "send_to_uart_call_group_3_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= data_to_send_uart_749;
      CallReq: InputMuxWithBuffering -- 
        generic map (name => "InputMuxWithBuffering",
        iwidth => 32,
        owidth => 32,
        buffering => inBUFs,
        full_rate =>  true,
        twidth => 1,
        nreqs => 1,
        registered_output => false,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          reqR => send_to_uart_call_reqs(0),
          ackR => send_to_uart_call_acks(0),
          dataR => send_to_uart_call_data(31 downto 0),
          tagR => send_to_uart_call_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      CallComplete: OutputDemuxBaseNoData -- 
        generic map ( -- 
          detailed_buffering_per_output => outBUFs, 
          twidth => 1,
          name => "OutputDemuxBaseNoData",
          nreqs => 1) -- 
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          reqL => send_to_uart_return_acks(0), -- cross-over
          ackL => send_to_uart_return_reqs(0), -- cross-over
          tagL => send_to_uart_return_tag(0 downto 0),
          clk => clk,
          reset => reset -- 
        ); -- 
      -- 
    end Block; -- call group 3
    -- 
  end Block; -- data_path
  -- 
end processor_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity receive_from_uart is -- 
  generic (tag_length : integer); 
  port ( -- 
    receive_data_from_uart : out  std_logic_vector(31 downto 0);
    in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_pipe_pipe_read_data : in   std_logic_vector(7 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity receive_from_uart;
architecture receive_from_uart_arch of receive_from_uart is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 32)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal receive_data_from_uart_buffer :  std_logic_vector(31 downto 0);
  signal receive_data_from_uart_update_enable: Boolean;
  signal receive_from_uart_CP_351_start: Boolean;
  signal receive_from_uart_CP_351_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal RPIPE_in_pipe_257_inst_req_0 : boolean;
  signal RPIPE_in_pipe_257_inst_ack_0 : boolean;
  signal RPIPE_in_pipe_257_inst_req_1 : boolean;
  signal RPIPE_in_pipe_257_inst_ack_1 : boolean;
  signal RPIPE_in_pipe_260_inst_req_0 : boolean;
  signal RPIPE_in_pipe_260_inst_ack_0 : boolean;
  signal RPIPE_in_pipe_260_inst_req_1 : boolean;
  signal RPIPE_in_pipe_260_inst_ack_1 : boolean;
  signal RPIPE_in_pipe_263_inst_req_0 : boolean;
  signal RPIPE_in_pipe_263_inst_ack_0 : boolean;
  signal RPIPE_in_pipe_263_inst_req_1 : boolean;
  signal RPIPE_in_pipe_263_inst_ack_1 : boolean;
  signal RPIPE_in_pipe_266_inst_req_0 : boolean;
  signal RPIPE_in_pipe_266_inst_ack_0 : boolean;
  signal RPIPE_in_pipe_266_inst_req_1 : boolean;
  signal RPIPE_in_pipe_266_inst_ack_1 : boolean;
  signal CONCAT_u16_u32_275_inst_req_0 : boolean;
  signal CONCAT_u16_u32_275_inst_ack_0 : boolean;
  signal CONCAT_u16_u32_275_inst_req_1 : boolean;
  signal CONCAT_u16_u32_275_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "receive_from_uart_input_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  receive_from_uart_CP_351_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "receive_from_uart_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 32) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(31 downto 0) <= receive_data_from_uart_buffer;
  receive_data_from_uart <= out_buffer_data_out(31 downto 0);
  out_buffer_data_in(tag_length + 31 downto 32) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 31 downto 32);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= receive_from_uart_CP_351_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= receive_from_uart_CP_351_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= receive_from_uart_CP_351_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  receive_from_uart_CP_351: Block -- control-path 
    signal receive_from_uart_CP_351_elements: BooleanArray(10 downto 0);
    -- 
  begin -- 
    receive_from_uart_CP_351_elements(0) <= receive_from_uart_CP_351_start;
    receive_from_uart_CP_351_symbol <= receive_from_uart_CP_351_elements(10);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0: 	10 
    -- CP-element group 0:  members (8) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/$entry
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_sample_start_
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Sample/rr
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_update_start_
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Update/$entry
      -- CP-element group 0: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Update/cr
      -- 
    rr_364_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_364_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(0), ack => RPIPE_in_pipe_257_inst_req_0); -- 
    cr_425_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_425_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(0), ack => CONCAT_u16_u32_275_inst_req_1); -- 
    -- CP-element group 1:  transition  input  output  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	2 
    -- CP-element group 1:  members (6) 
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_sample_completed_
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_update_start_
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Sample/ra
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Update/$entry
      -- CP-element group 1: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Update/cr
      -- 
    ra_365_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_257_inst_ack_0, ack => receive_from_uart_CP_351_elements(1)); -- 
    cr_369_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_369_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(1), ack => RPIPE_in_pipe_257_inst_req_1); -- 
    -- CP-element group 2:  transition  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	1 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	3 
    -- CP-element group 2:  members (6) 
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_update_completed_
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Update/$exit
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_257_Update/ca
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_sample_start_
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Sample/$entry
      -- CP-element group 2: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Sample/rr
      -- 
    ca_370_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_257_inst_ack_1, ack => receive_from_uart_CP_351_elements(2)); -- 
    rr_378_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_378_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(2), ack => RPIPE_in_pipe_260_inst_req_0); -- 
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	2 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_sample_completed_
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_update_start_
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Sample/$exit
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Sample/ra
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Update/$entry
      -- CP-element group 3: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Update/cr
      -- 
    ra_379_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_260_inst_ack_0, ack => receive_from_uart_CP_351_elements(3)); -- 
    cr_383_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_383_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(3), ack => RPIPE_in_pipe_260_inst_req_1); -- 
    -- CP-element group 4:  transition  input  output  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	5 
    -- CP-element group 4:  members (6) 
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_update_completed_
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Update/$exit
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_260_Update/ca
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_sample_start_
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Sample/$entry
      -- CP-element group 4: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Sample/rr
      -- 
    ca_384_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_260_inst_ack_1, ack => receive_from_uart_CP_351_elements(4)); -- 
    rr_392_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_392_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(4), ack => RPIPE_in_pipe_263_inst_req_0); -- 
    -- CP-element group 5:  transition  input  output  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	4 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	6 
    -- CP-element group 5:  members (6) 
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_sample_completed_
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_update_start_
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Sample/ra
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Update/$entry
      -- CP-element group 5: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Update/cr
      -- 
    ra_393_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_263_inst_ack_0, ack => receive_from_uart_CP_351_elements(5)); -- 
    cr_397_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_397_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(5), ack => RPIPE_in_pipe_263_inst_req_1); -- 
    -- CP-element group 6:  transition  input  output  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	5 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	7 
    -- CP-element group 6:  members (6) 
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_update_completed_
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Update/$exit
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_263_Update/ca
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_sample_start_
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Sample/$entry
      -- CP-element group 6: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Sample/rr
      -- 
    ca_398_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_263_inst_ack_1, ack => receive_from_uart_CP_351_elements(6)); -- 
    rr_406_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_406_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(6), ack => RPIPE_in_pipe_266_inst_req_0); -- 
    -- CP-element group 7:  transition  input  output  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	6 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	8 
    -- CP-element group 7:  members (6) 
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_sample_completed_
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_update_start_
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Sample/$exit
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Sample/ra
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Update/$entry
      -- CP-element group 7: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Update/cr
      -- 
    ra_407_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_266_inst_ack_0, ack => receive_from_uart_CP_351_elements(7)); -- 
    cr_411_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_411_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(7), ack => RPIPE_in_pipe_266_inst_req_1); -- 
    -- CP-element group 8:  transition  input  output  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	7 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	9 
    -- CP-element group 8:  members (6) 
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_update_completed_
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Update/$exit
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/RPIPE_in_pipe_266_Update/ca
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_sample_start_
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Sample/$entry
      -- CP-element group 8: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Sample/rr
      -- 
    ca_412_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_pipe_266_inst_ack_1, ack => receive_from_uart_CP_351_elements(8)); -- 
    rr_420_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_420_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => receive_from_uart_CP_351_elements(8), ack => CONCAT_u16_u32_275_inst_req_0); -- 
    -- CP-element group 9:  transition  input  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	8 
    -- CP-element group 9: successors 
    -- CP-element group 9:  members (3) 
      -- CP-element group 9: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_sample_completed_
      -- CP-element group 9: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Sample/$exit
      -- CP-element group 9: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Sample/ra
      -- 
    ra_421_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u16_u32_275_inst_ack_0, ack => receive_from_uart_CP_351_elements(9)); -- 
    -- CP-element group 10:  transition  input  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	0 
    -- CP-element group 10: successors 
    -- CP-element group 10:  members (5) 
      -- CP-element group 10: 	 $exit
      -- CP-element group 10: 	 assign_stmt_258_to_assign_stmt_276/$exit
      -- CP-element group 10: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_update_completed_
      -- CP-element group 10: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Update/$exit
      -- CP-element group 10: 	 assign_stmt_258_to_assign_stmt_276/CONCAT_u16_u32_275_Update/ca
      -- 
    ca_426_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => CONCAT_u16_u32_275_inst_ack_1, ack => receive_from_uart_CP_351_elements(10)); -- 
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CONCAT_u8_u16_271_wire : std_logic_vector(15 downto 0);
    signal CONCAT_u8_u16_274_wire : std_logic_vector(15 downto 0);
    signal in_data0_258 : std_logic_vector(7 downto 0);
    signal in_data1_261 : std_logic_vector(7 downto 0);
    signal in_data2_264 : std_logic_vector(7 downto 0);
    signal in_data3_267 : std_logic_vector(7 downto 0);
    -- 
  begin -- 
    -- shared split operator group (0) : CONCAT_u16_u32_275_inst 
    ApConcat_group_0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      data_in <= CONCAT_u8_u16_271_wire & CONCAT_u8_u16_274_wire;
      receive_data_from_uart_buffer <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= CONCAT_u16_u32_275_inst_req_0;
      CONCAT_u16_u32_275_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= CONCAT_u16_u32_275_inst_req_1;
      CONCAT_u16_u32_275_inst_ack_1 <= ackR_unguarded(0);
      ApConcat_group_0_gI: SplitGuardInterface generic map(name => "ApConcat_group_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApConcat",
          name => "ApConcat_group_0",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 16,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 16, 
          num_inputs    => 2,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 32,
          constant_operand => "0",
          constant_width => 1,
          buffering  => 1,
          flow_through => false,
          full_rate  => false,
          use_constant  => false
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- binary operator CONCAT_u8_u16_271_inst
    process(in_data0_258, in_data1_261) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApConcat_proc(in_data0_258, in_data1_261, tmp_var);
      CONCAT_u8_u16_271_wire <= tmp_var; --
    end process;
    -- binary operator CONCAT_u8_u16_274_inst
    process(in_data2_264, in_data3_267) -- 
      variable tmp_var : std_logic_vector(15 downto 0); -- 
    begin -- 
      ApConcat_proc(in_data2_264, in_data3_267, tmp_var);
      CONCAT_u8_u16_274_wire <= tmp_var; --
    end process;
    -- shared inport operator group (0) : RPIPE_in_pipe_260_inst RPIPE_in_pipe_257_inst RPIPE_in_pipe_266_inst RPIPE_in_pipe_263_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 3 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 3 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant outBUFs : IntegerArray(3 downto 0) := (3 => 1, 2 => 1, 1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      reqL_unguarded(3) <= RPIPE_in_pipe_260_inst_req_0;
      reqL_unguarded(2) <= RPIPE_in_pipe_257_inst_req_0;
      reqL_unguarded(1) <= RPIPE_in_pipe_266_inst_req_0;
      reqL_unguarded(0) <= RPIPE_in_pipe_263_inst_req_0;
      RPIPE_in_pipe_260_inst_ack_0 <= ackL_unguarded(3);
      RPIPE_in_pipe_257_inst_ack_0 <= ackL_unguarded(2);
      RPIPE_in_pipe_266_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_in_pipe_263_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(3) <= RPIPE_in_pipe_260_inst_req_1;
      reqR_unguarded(2) <= RPIPE_in_pipe_257_inst_req_1;
      reqR_unguarded(1) <= RPIPE_in_pipe_266_inst_req_1;
      reqR_unguarded(0) <= RPIPE_in_pipe_263_inst_req_1;
      RPIPE_in_pipe_260_inst_ack_1 <= ackR_unguarded(3);
      RPIPE_in_pipe_257_inst_ack_1 <= ackR_unguarded(2);
      RPIPE_in_pipe_266_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_in_pipe_263_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      in_data1_261 <= data_out(31 downto 24);
      in_data0_258 <= data_out(23 downto 16);
      in_data3_267 <= data_out(15 downto 8);
      in_data2_264 <= data_out(7 downto 0);
      in_pipe_read_0_gI: SplitGuardInterface generic map(name => "in_pipe_read_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      in_pipe_read_0: InputPortRevised -- 
        generic map ( name => "in_pipe_read_0", data_width => 8,  num_reqs => 4,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_pipe_pipe_read_req(0),
          oack => in_pipe_pipe_read_ack(0),
          odata => in_pipe_pipe_read_data(7 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- 
  end Block; -- data_path
  -- 
end receive_from_uart_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity registerFileModule is -- 
  generic (tag_length : integer); 
  port ( -- 
    valid_1 : in  std_logic_vector(0 downto 0);
    addr_1 : in  std_logic_vector(7 downto 0);
    valid_2 : in  std_logic_vector(0 downto 0);
    addr_2 : in  std_logic_vector(7 downto 0);
    valid_w : in  std_logic_vector(0 downto 0);
    addr_w : in  std_logic_vector(7 downto 0);
    data_to_be_written : in  std_logic_vector(31 downto 0);
    read_data_1 : out  std_logic_vector(31 downto 0);
    read_data_2 : out  std_logic_vector(31 downto 0);
    memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lr_addr : out  std_logic_vector(5 downto 0);
    memory_space_0_lr_tag :  out  std_logic_vector(18 downto 0);
    memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lc_data : in   std_logic_vector(31 downto 0);
    memory_space_0_lc_tag :  in  std_logic_vector(1 downto 0);
    memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sr_addr : out  std_logic_vector(5 downto 0);
    memory_space_0_sr_data : out  std_logic_vector(31 downto 0);
    memory_space_0_sr_tag :  out  std_logic_vector(18 downto 0);
    memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sc_tag :  in  std_logic_vector(1 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity registerFileModule;
architecture registerFileModule_arch of registerFileModule is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 59)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 64)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal valid_1_buffer :  std_logic_vector(0 downto 0);
  signal valid_1_update_enable: Boolean;
  signal addr_1_buffer :  std_logic_vector(7 downto 0);
  signal addr_1_update_enable: Boolean;
  signal valid_2_buffer :  std_logic_vector(0 downto 0);
  signal valid_2_update_enable: Boolean;
  signal addr_2_buffer :  std_logic_vector(7 downto 0);
  signal addr_2_update_enable: Boolean;
  signal valid_w_buffer :  std_logic_vector(0 downto 0);
  signal valid_w_update_enable: Boolean;
  signal addr_w_buffer :  std_logic_vector(7 downto 0);
  signal addr_w_update_enable: Boolean;
  signal data_to_be_written_buffer :  std_logic_vector(31 downto 0);
  signal data_to_be_written_update_enable: Boolean;
  -- output port buffer signals
  signal read_data_1_buffer :  std_logic_vector(31 downto 0);
  signal read_data_1_update_enable: Boolean;
  signal read_data_2_buffer :  std_logic_vector(31 downto 0);
  signal read_data_2_update_enable: Boolean;
  signal registerFileModule_CP_71_start: Boolean;
  signal registerFileModule_CP_71_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal array_obj_ref_223_load_0_req_0 : boolean;
  signal array_obj_ref_223_load_0_ack_0 : boolean;
  signal array_obj_ref_223_load_0_req_1 : boolean;
  signal array_obj_ref_223_load_0_ack_1 : boolean;
  signal array_obj_ref_228_load_0_req_0 : boolean;
  signal array_obj_ref_228_load_0_ack_0 : boolean;
  signal array_obj_ref_228_load_0_req_1 : boolean;
  signal array_obj_ref_228_load_0_ack_1 : boolean;
  signal W_valid_1_251_delayed_4_0_230_inst_req_0 : boolean;
  signal W_valid_1_251_delayed_4_0_230_inst_ack_0 : boolean;
  signal W_valid_1_251_delayed_4_0_230_inst_req_1 : boolean;
  signal W_valid_1_251_delayed_4_0_230_inst_ack_1 : boolean;
  signal MUX_237_inst_req_0 : boolean;
  signal MUX_237_inst_ack_0 : boolean;
  signal MUX_237_inst_req_1 : boolean;
  signal MUX_237_inst_ack_1 : boolean;
  signal W_valid_2_257_delayed_4_0_239_inst_req_0 : boolean;
  signal W_valid_2_257_delayed_4_0_239_inst_ack_0 : boolean;
  signal W_valid_2_257_delayed_4_0_239_inst_req_1 : boolean;
  signal W_valid_2_257_delayed_4_0_239_inst_ack_1 : boolean;
  signal MUX_246_inst_req_0 : boolean;
  signal MUX_246_inst_ack_0 : boolean;
  signal MUX_246_inst_req_1 : boolean;
  signal MUX_246_inst_ack_1 : boolean;
  signal array_obj_ref_250_store_0_req_0 : boolean;
  signal array_obj_ref_250_store_0_ack_0 : boolean;
  signal array_obj_ref_250_store_0_req_1 : boolean;
  signal array_obj_ref_250_store_0_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "registerFileModule_input_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      bypass_flag => false,
      data_width => tag_length + 59) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(0 downto 0) <= valid_1;
  valid_1_buffer <= in_buffer_data_out(0 downto 0);
  in_buffer_data_in(8 downto 1) <= addr_1;
  addr_1_buffer <= in_buffer_data_out(8 downto 1);
  in_buffer_data_in(9 downto 9) <= valid_2;
  valid_2_buffer <= in_buffer_data_out(9 downto 9);
  in_buffer_data_in(17 downto 10) <= addr_2;
  addr_2_buffer <= in_buffer_data_out(17 downto 10);
  in_buffer_data_in(18 downto 18) <= valid_w;
  valid_w_buffer <= in_buffer_data_out(18 downto 18);
  in_buffer_data_in(26 downto 19) <= addr_w;
  addr_w_buffer <= in_buffer_data_out(26 downto 19);
  in_buffer_data_in(58 downto 27) <= data_to_be_written;
  data_to_be_written_buffer <= in_buffer_data_out(58 downto 27);
  in_buffer_data_in(tag_length + 58 downto 59) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 58 downto 59);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 8) := (0 => 7,1 => 7,2 => 7,3 => 7,4 => 7,5 => 7,6 => 7,7 => 1,8 => 7);
    constant place_markings: IntegerArray(0 to 8)  := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 1,8 => 7);
    constant place_delays: IntegerArray(0 to 8) := (0 => 0,1 => 0,2 => 0,3 => 0,4 => 0,5 => 0,6 => 0,7 => 0,8 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 9); -- 
  begin -- 
    preds <= valid_1_update_enable & addr_1_update_enable & valid_2_update_enable & addr_2_update_enable & valid_w_update_enable & addr_w_update_enable & data_to_be_written_update_enable & in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 9, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  registerFileModule_CP_71_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "registerFileModule_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 64) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(31 downto 0) <= read_data_1_buffer;
  read_data_1 <= out_buffer_data_out(31 downto 0);
  out_buffer_data_in(63 downto 32) <= read_data_2_buffer;
  read_data_2 <= out_buffer_data_out(63 downto 32);
  out_buffer_data_in(tag_length + 63 downto 64) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length + 63 downto 64);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 7);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= registerFileModule_CP_71_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  read_data_1_update_enable_join: block -- 
    constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
    constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
    constant place_delays: IntegerArray(0 to 0) := (0 => 0);
    constant joinName: string(1 to 30) := "read_data_1_update_enable_join"; 
    signal preds: BooleanArray(1 to 1); -- 
  begin -- 
    preds(1) <= out_buffer_write_ack_symbol;
    gj_read_data_1_update_enable_join : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => read_data_1_update_enable, clk => clk, reset => reset); --
  end block;
  read_data_2_update_enable_join: block -- 
    constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
    constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
    constant place_delays: IntegerArray(0 to 0) := (0 => 0);
    constant joinName: string(1 to 30) := "read_data_2_update_enable_join"; 
    signal preds: BooleanArray(1 to 1); -- 
  begin -- 
    preds(1) <= out_buffer_write_ack_symbol;
    gj_read_data_2_update_enable_join : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => read_data_2_update_enable, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 7,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= registerFileModule_CP_71_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= registerFileModule_CP_71_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  registerFileModule_CP_71: Block -- control-path 
    signal registerFileModule_CP_71_elements: BooleanArray(51 downto 0);
    -- 
  begin -- 
    registerFileModule_CP_71_elements(0) <= registerFileModule_CP_71_start;
    registerFileModule_CP_71_symbol <= registerFileModule_CP_71_elements(51);
    -- CP-element group 0:  transition  bypass  pipeline-parent 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0:  members (1) 
      -- CP-element group 0: 	 $entry
      -- 
    -- CP-element group 1:  fork  transition  bypass  pipeline-parent 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	11 
    -- CP-element group 1: 	15 
    -- CP-element group 1: 	19 
    -- CP-element group 1: 	27 
    -- CP-element group 1: 	35 
    -- CP-element group 1:  members (79) 
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_word_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_root_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_offset_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_resized_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_scaled_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_computed_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_resize_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_resize_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_resize_0/index_resize_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_resize_0/index_resize_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_scale_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_scale_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_scale_0/scale_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_index_scale_0/scale_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_final_index_sum_regn/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_final_index_sum_regn/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_final_index_sum_regn/req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_final_index_sum_regn/ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_base_plus_offset/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_base_plus_offset/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_base_plus_offset/sum_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_base_plus_offset/sum_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_word_addrgen/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_word_addrgen/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_word_addrgen/root_register_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_word_addrgen/root_register_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_word_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_root_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_offset_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_resized_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_scaled_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_computed_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_resize_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_resize_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_resize_0/index_resize_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_resize_0/index_resize_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_scale_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_scale_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_scale_0/scale_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_index_scale_0/scale_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_final_index_sum_regn/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_final_index_sum_regn/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_final_index_sum_regn/req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_final_index_sum_regn/ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_base_plus_offset/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_base_plus_offset/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_base_plus_offset/sum_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_base_plus_offset/sum_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_word_addrgen/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_word_addrgen/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_word_addrgen/root_register_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_word_addrgen/root_register_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_word_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_root_address_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_offset_calculated
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_resized_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_scaled_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_computed_0
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_resize_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_resize_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_resize_0/index_resize_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_resize_0/index_resize_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_scale_0/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_scale_0/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_scale_0/scale_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_index_scale_0/scale_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_final_index_sum_regn/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_final_index_sum_regn/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_final_index_sum_regn/req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_final_index_sum_regn/ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_base_plus_offset/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_base_plus_offset/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_base_plus_offset/sum_rename_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_base_plus_offset/sum_rename_ack
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_word_addrgen/$entry
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_word_addrgen/$exit
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_word_addrgen/root_register_req
      -- CP-element group 1: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_word_addrgen/root_register_ack
      -- 
    registerFileModule_CP_71_elements(1) <= registerFileModule_CP_71_elements(0);
    -- CP-element group 2:  join  transition  bypass  pipeline-parent 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: marked-predecessors 
    -- CP-element group 2: 	13 
    -- CP-element group 2: 	21 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	42 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 assign_stmt_224_to_assign_stmt_252/valid_1_update_enable
      -- CP-element group 2: 	 assign_stmt_224_to_assign_stmt_252/valid_1_update_enable_out
      -- 
    registerFileModule_cp_element_group_2: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_2"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(13) & registerFileModule_CP_71_elements(21);
      gj_registerFileModule_cp_element_group_2 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(2), clk => clk, reset => reset); --
    end block;
    -- CP-element group 3:  join  transition  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: marked-predecessors 
    -- CP-element group 3: 	13 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	43 
    -- CP-element group 3:  members (2) 
      -- CP-element group 3: 	 assign_stmt_224_to_assign_stmt_252/addr_1_update_enable
      -- CP-element group 3: 	 assign_stmt_224_to_assign_stmt_252/addr_1_update_enable_out
      -- 
    registerFileModule_cp_element_group_3: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_3"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(13);
      gj_registerFileModule_cp_element_group_3 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(3), clk => clk, reset => reset); --
    end block;
    -- CP-element group 4:  join  transition  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: marked-predecessors 
    -- CP-element group 4: 	17 
    -- CP-element group 4: 	29 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	44 
    -- CP-element group 4:  members (2) 
      -- CP-element group 4: 	 assign_stmt_224_to_assign_stmt_252/valid_2_update_enable
      -- CP-element group 4: 	 assign_stmt_224_to_assign_stmt_252/valid_2_update_enable_out
      -- 
    registerFileModule_cp_element_group_4: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_4"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(17) & registerFileModule_CP_71_elements(29);
      gj_registerFileModule_cp_element_group_4 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(4), clk => clk, reset => reset); --
    end block;
    -- CP-element group 5:  join  transition  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: marked-predecessors 
    -- CP-element group 5: 	17 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	45 
    -- CP-element group 5:  members (2) 
      -- CP-element group 5: 	 assign_stmt_224_to_assign_stmt_252/addr_2_update_enable
      -- CP-element group 5: 	 assign_stmt_224_to_assign_stmt_252/addr_2_update_enable_out
      -- 
    registerFileModule_cp_element_group_5: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_5"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(17);
      gj_registerFileModule_cp_element_group_5 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(5), clk => clk, reset => reset); --
    end block;
    -- CP-element group 6:  join  transition  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: marked-predecessors 
    -- CP-element group 6: 	37 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	46 
    -- CP-element group 6:  members (2) 
      -- CP-element group 6: 	 assign_stmt_224_to_assign_stmt_252/valid_w_update_enable
      -- CP-element group 6: 	 assign_stmt_224_to_assign_stmt_252/valid_w_update_enable_out
      -- 
    registerFileModule_cp_element_group_6: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_6"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_6 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(6), clk => clk, reset => reset); --
    end block;
    -- CP-element group 7:  join  transition  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: marked-predecessors 
    -- CP-element group 7: 	37 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	47 
    -- CP-element group 7:  members (2) 
      -- CP-element group 7: 	 assign_stmt_224_to_assign_stmt_252/addr_w_update_enable
      -- CP-element group 7: 	 assign_stmt_224_to_assign_stmt_252/addr_w_update_enable_out
      -- 
    registerFileModule_cp_element_group_7: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_7"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_7 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(7), clk => clk, reset => reset); --
    end block;
    -- CP-element group 8:  join  transition  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: marked-predecessors 
    -- CP-element group 8: 	37 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	48 
    -- CP-element group 8:  members (2) 
      -- CP-element group 8: 	 assign_stmt_224_to_assign_stmt_252/data_to_be_written_update_enable
      -- CP-element group 8: 	 assign_stmt_224_to_assign_stmt_252/data_to_be_written_update_enable_out
      -- 
    registerFileModule_cp_element_group_8: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 37) := "registerFileModule_cp_element_group_8"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_8 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(8), clk => clk, reset => reset); --
    end block;
    -- CP-element group 9:  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	49 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	24 
    -- CP-element group 9:  members (2) 
      -- CP-element group 9: 	 assign_stmt_224_to_assign_stmt_252/read_data_1_update_enable
      -- CP-element group 9: 	 assign_stmt_224_to_assign_stmt_252/read_data_1_update_enable_in
      -- 
    registerFileModule_CP_71_elements(9) <= registerFileModule_CP_71_elements(49);
    -- CP-element group 10:  transition  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	50 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	32 
    -- CP-element group 10:  members (2) 
      -- CP-element group 10: 	 assign_stmt_224_to_assign_stmt_252/read_data_2_update_enable
      -- CP-element group 10: 	 assign_stmt_224_to_assign_stmt_252/read_data_2_update_enable_in
      -- 
    registerFileModule_CP_71_elements(10) <= registerFileModule_CP_71_elements(50);
    -- CP-element group 11:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	1 
    -- CP-element group 11: marked-predecessors 
    -- CP-element group 11: 	13 
    -- CP-element group 11: 	37 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	13 
    -- CP-element group 11:  members (5) 
      -- CP-element group 11: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_sample_start_
      -- CP-element group 11: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/$entry
      -- CP-element group 11: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/$entry
      -- CP-element group 11: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/word_0/$entry
      -- CP-element group 11: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/word_0/rr
      -- 
    rr_140_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_140_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(11), ack => array_obj_ref_223_load_0_req_0); -- 
    registerFileModule_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(1) & registerFileModule_CP_71_elements(13) & registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	14 
    -- CP-element group 12: 	25 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (5) 
      -- CP-element group 12: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_update_start_
      -- CP-element group 12: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/$entry
      -- CP-element group 12: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/$entry
      -- CP-element group 12: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/word_0/$entry
      -- CP-element group 12: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/word_0/cr
      -- 
    cr_151_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_151_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(12), ack => array_obj_ref_223_load_0_req_1); -- 
    registerFileModule_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(14) & registerFileModule_CP_71_elements(25);
      gj_registerFileModule_cp_element_group_12 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	11 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	39 
    -- CP-element group 13: marked-successors 
    -- CP-element group 13: 	2 
    -- CP-element group 13: 	3 
    -- CP-element group 13: 	11 
    -- CP-element group 13:  members (5) 
      -- CP-element group 13: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_sample_completed_
      -- CP-element group 13: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/$exit
      -- CP-element group 13: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/$exit
      -- CP-element group 13: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/word_0/$exit
      -- CP-element group 13: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Sample/word_access_start/word_0/ra
      -- 
    ra_141_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_223_load_0_ack_0, ack => registerFileModule_CP_71_elements(13)); -- 
    -- CP-element group 14:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	12 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	23 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	12 
    -- CP-element group 14:  members (9) 
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_update_completed_
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/$exit
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/$exit
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/word_0/$exit
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/word_access_complete/word_0/ca
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/array_obj_ref_223_Merge/$entry
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/array_obj_ref_223_Merge/$exit
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/array_obj_ref_223_Merge/merge_req
      -- CP-element group 14: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_Update/array_obj_ref_223_Merge/merge_ack
      -- 
    ca_152_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 14_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_223_load_0_ack_1, ack => registerFileModule_CP_71_elements(14)); -- 
    -- CP-element group 15:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	1 
    -- CP-element group 15: marked-predecessors 
    -- CP-element group 15: 	17 
    -- CP-element group 15: 	37 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	17 
    -- CP-element group 15:  members (5) 
      -- CP-element group 15: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_sample_start_
      -- CP-element group 15: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/$entry
      -- CP-element group 15: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/$entry
      -- CP-element group 15: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/word_0/$entry
      -- CP-element group 15: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/word_0/rr
      -- 
    rr_203_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_203_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(15), ack => array_obj_ref_228_load_0_req_0); -- 
    registerFileModule_cp_element_group_15: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 7,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_15"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(1) & registerFileModule_CP_71_elements(17) & registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_15 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(15), clk => clk, reset => reset); --
    end block;
    -- CP-element group 16:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	18 
    -- CP-element group 16: 	33 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	18 
    -- CP-element group 16:  members (5) 
      -- CP-element group 16: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_update_start_
      -- CP-element group 16: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/$entry
      -- CP-element group 16: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/$entry
      -- CP-element group 16: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/word_0/$entry
      -- CP-element group 16: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/word_0/cr
      -- 
    cr_214_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_214_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(16), ack => array_obj_ref_228_load_0_req_1); -- 
    registerFileModule_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(18) & registerFileModule_CP_71_elements(33);
      gj_registerFileModule_cp_element_group_16 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	15 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	40 
    -- CP-element group 17: marked-successors 
    -- CP-element group 17: 	4 
    -- CP-element group 17: 	5 
    -- CP-element group 17: 	15 
    -- CP-element group 17:  members (5) 
      -- CP-element group 17: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_sample_completed_
      -- CP-element group 17: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/$exit
      -- CP-element group 17: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/$exit
      -- CP-element group 17: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/word_0/$exit
      -- CP-element group 17: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Sample/word_access_start/word_0/ra
      -- 
    ra_204_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 17_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_228_load_0_ack_0, ack => registerFileModule_CP_71_elements(17)); -- 
    -- CP-element group 18:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	16 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	31 
    -- CP-element group 18: marked-successors 
    -- CP-element group 18: 	16 
    -- CP-element group 18:  members (9) 
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_update_completed_
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/$exit
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/$exit
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/word_0/$exit
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/word_access_complete/word_0/ca
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/array_obj_ref_228_Merge/$entry
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/array_obj_ref_228_Merge/$exit
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/array_obj_ref_228_Merge/merge_req
      -- CP-element group 18: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_Update/array_obj_ref_228_Merge/merge_ack
      -- 
    ca_215_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_228_load_0_ack_1, ack => registerFileModule_CP_71_elements(18)); -- 
    -- CP-element group 19:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	1 
    -- CP-element group 19: marked-predecessors 
    -- CP-element group 19: 	21 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	21 
    -- CP-element group 19:  members (3) 
      -- CP-element group 19: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_sample_start_
      -- CP-element group 19: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Sample/$entry
      -- CP-element group 19: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Sample/req
      -- 
    req_228_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_228_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(19), ack => W_valid_1_251_delayed_4_0_230_inst_req_0); -- 
    registerFileModule_cp_element_group_19: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_19"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(1) & registerFileModule_CP_71_elements(21);
      gj_registerFileModule_cp_element_group_19 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(19), clk => clk, reset => reset); --
    end block;
    -- CP-element group 20:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: marked-predecessors 
    -- CP-element group 20: 	22 
    -- CP-element group 20: 	25 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	22 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_update_start_
      -- CP-element group 20: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Update/$entry
      -- CP-element group 20: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Update/req
      -- 
    req_233_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_233_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(20), ack => W_valid_1_251_delayed_4_0_230_inst_req_1); -- 
    registerFileModule_cp_element_group_20: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_20"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(22) & registerFileModule_CP_71_elements(25);
      gj_registerFileModule_cp_element_group_20 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(20), clk => clk, reset => reset); --
    end block;
    -- CP-element group 21:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	19 
    -- CP-element group 21: successors 
    -- CP-element group 21: marked-successors 
    -- CP-element group 21: 	2 
    -- CP-element group 21: 	19 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_sample_completed_
      -- CP-element group 21: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Sample/$exit
      -- CP-element group 21: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Sample/ack
      -- 
    ack_229_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 21_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_valid_1_251_delayed_4_0_230_inst_ack_0, ack => registerFileModule_CP_71_elements(21)); -- 
    -- CP-element group 22:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	20 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	23 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	20 
    -- CP-element group 22:  members (3) 
      -- CP-element group 22: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_update_completed_
      -- CP-element group 22: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Update/$exit
      -- CP-element group 22: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_232_Update/ack
      -- 
    ack_234_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 22_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_valid_1_251_delayed_4_0_230_inst_ack_1, ack => registerFileModule_CP_71_elements(22)); -- 
    -- CP-element group 23:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	14 
    -- CP-element group 23: 	22 
    -- CP-element group 23: marked-predecessors 
    -- CP-element group 23: 	25 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	25 
    -- CP-element group 23:  members (3) 
      -- CP-element group 23: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_sample_start_
      -- CP-element group 23: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_start/$entry
      -- CP-element group 23: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_start/req
      -- 
    req_242_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_242_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(23), ack => MUX_237_inst_req_0); -- 
    registerFileModule_cp_element_group_23: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_23"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(14) & registerFileModule_CP_71_elements(22) & registerFileModule_CP_71_elements(25);
      gj_registerFileModule_cp_element_group_23 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(23), clk => clk, reset => reset); --
    end block;
    -- CP-element group 24:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	9 
    -- CP-element group 24: marked-predecessors 
    -- CP-element group 24: 	26 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	26 
    -- CP-element group 24:  members (3) 
      -- CP-element group 24: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_update_start_
      -- CP-element group 24: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_complete/$entry
      -- CP-element group 24: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_complete/req
      -- 
    req_247_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_247_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(24), ack => MUX_237_inst_req_1); -- 
    registerFileModule_cp_element_group_24: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_24"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(9) & registerFileModule_CP_71_elements(26);
      gj_registerFileModule_cp_element_group_24 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(24), clk => clk, reset => reset); --
    end block;
    -- CP-element group 25:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	23 
    -- CP-element group 25: successors 
    -- CP-element group 25: marked-successors 
    -- CP-element group 25: 	12 
    -- CP-element group 25: 	20 
    -- CP-element group 25: 	23 
    -- CP-element group 25:  members (3) 
      -- CP-element group 25: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_sample_completed_
      -- CP-element group 25: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_start/$exit
      -- CP-element group 25: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_start/ack
      -- 
    ack_243_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 25_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_237_inst_ack_0, ack => registerFileModule_CP_71_elements(25)); -- 
    -- CP-element group 26:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	24 
    -- CP-element group 26: successors 
    -- CP-element group 26: 	41 
    -- CP-element group 26: marked-successors 
    -- CP-element group 26: 	24 
    -- CP-element group 26:  members (3) 
      -- CP-element group 26: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_update_completed_
      -- CP-element group 26: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_complete/$exit
      -- CP-element group 26: 	 assign_stmt_224_to_assign_stmt_252/MUX_237_complete/ack
      -- 
    ack_248_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 26_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_237_inst_ack_1, ack => registerFileModule_CP_71_elements(26)); -- 
    -- CP-element group 27:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	1 
    -- CP-element group 27: marked-predecessors 
    -- CP-element group 27: 	29 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	29 
    -- CP-element group 27:  members (3) 
      -- CP-element group 27: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_sample_start_
      -- CP-element group 27: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Sample/$entry
      -- CP-element group 27: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Sample/req
      -- 
    req_256_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_256_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(27), ack => W_valid_2_257_delayed_4_0_239_inst_req_0); -- 
    registerFileModule_cp_element_group_27: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_27"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(1) & registerFileModule_CP_71_elements(29);
      gj_registerFileModule_cp_element_group_27 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(27), clk => clk, reset => reset); --
    end block;
    -- CP-element group 28:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: marked-predecessors 
    -- CP-element group 28: 	30 
    -- CP-element group 28: 	33 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	30 
    -- CP-element group 28:  members (3) 
      -- CP-element group 28: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_update_start_
      -- CP-element group 28: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Update/$entry
      -- CP-element group 28: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Update/req
      -- 
    req_261_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_261_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(28), ack => W_valid_2_257_delayed_4_0_239_inst_req_1); -- 
    registerFileModule_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(30) & registerFileModule_CP_71_elements(33);
      gj_registerFileModule_cp_element_group_28 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	27 
    -- CP-element group 29: successors 
    -- CP-element group 29: marked-successors 
    -- CP-element group 29: 	4 
    -- CP-element group 29: 	27 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_sample_completed_
      -- CP-element group 29: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Sample/$exit
      -- CP-element group 29: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Sample/ack
      -- 
    ack_257_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 29_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_valid_2_257_delayed_4_0_239_inst_ack_0, ack => registerFileModule_CP_71_elements(29)); -- 
    -- CP-element group 30:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	28 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	31 
    -- CP-element group 30: marked-successors 
    -- CP-element group 30: 	28 
    -- CP-element group 30:  members (3) 
      -- CP-element group 30: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_update_completed_
      -- CP-element group 30: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Update/$exit
      -- CP-element group 30: 	 assign_stmt_224_to_assign_stmt_252/assign_stmt_241_Update/ack
      -- 
    ack_262_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 30_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => W_valid_2_257_delayed_4_0_239_inst_ack_1, ack => registerFileModule_CP_71_elements(30)); -- 
    -- CP-element group 31:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	18 
    -- CP-element group 31: 	30 
    -- CP-element group 31: marked-predecessors 
    -- CP-element group 31: 	33 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	33 
    -- CP-element group 31:  members (3) 
      -- CP-element group 31: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_sample_start_
      -- CP-element group 31: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_start/$entry
      -- CP-element group 31: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_start/req
      -- 
    req_270_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_270_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(31), ack => MUX_246_inst_req_0); -- 
    registerFileModule_cp_element_group_31: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_31"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(18) & registerFileModule_CP_71_elements(30) & registerFileModule_CP_71_elements(33);
      gj_registerFileModule_cp_element_group_31 : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(31), clk => clk, reset => reset); --
    end block;
    -- CP-element group 32:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	10 
    -- CP-element group 32: marked-predecessors 
    -- CP-element group 32: 	34 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	34 
    -- CP-element group 32:  members (3) 
      -- CP-element group 32: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_update_start_
      -- CP-element group 32: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_complete/$entry
      -- CP-element group 32: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_complete/req
      -- 
    req_275_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_275_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(32), ack => MUX_246_inst_req_1); -- 
    registerFileModule_cp_element_group_32: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 7,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_32"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(10) & registerFileModule_CP_71_elements(34);
      gj_registerFileModule_cp_element_group_32 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(32), clk => clk, reset => reset); --
    end block;
    -- CP-element group 33:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	31 
    -- CP-element group 33: successors 
    -- CP-element group 33: marked-successors 
    -- CP-element group 33: 	16 
    -- CP-element group 33: 	28 
    -- CP-element group 33: 	31 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_sample_completed_
      -- CP-element group 33: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_start/$exit
      -- CP-element group 33: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_start/ack
      -- 
    ack_271_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 33_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_246_inst_ack_0, ack => registerFileModule_CP_71_elements(33)); -- 
    -- CP-element group 34:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	32 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	41 
    -- CP-element group 34: marked-successors 
    -- CP-element group 34: 	32 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_update_completed_
      -- CP-element group 34: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_complete/$exit
      -- CP-element group 34: 	 assign_stmt_224_to_assign_stmt_252/MUX_246_complete/ack
      -- 
    ack_276_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 34_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => MUX_246_inst_ack_1, ack => registerFileModule_CP_71_elements(34)); -- 
    -- CP-element group 35:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	1 
    -- CP-element group 35: 	39 
    -- CP-element group 35: 	40 
    -- CP-element group 35: marked-predecessors 
    -- CP-element group 35: 	37 
    -- CP-element group 35: successors 
    -- CP-element group 35: 	37 
    -- CP-element group 35:  members (9) 
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_sample_start_
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/$entry
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/array_obj_ref_250_Split/$entry
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/array_obj_ref_250_Split/$exit
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/array_obj_ref_250_Split/split_req
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/array_obj_ref_250_Split/split_ack
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/$entry
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/word_0/$entry
      -- CP-element group 35: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/word_0/rr
      -- 
    rr_326_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_326_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(35), ack => array_obj_ref_250_store_0_req_0); -- 
    registerFileModule_cp_element_group_35: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 7,1 => 1,2 => 1,3 => 1);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 1);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_35"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(1) & registerFileModule_CP_71_elements(39) & registerFileModule_CP_71_elements(40) & registerFileModule_CP_71_elements(37);
      gj_registerFileModule_cp_element_group_35 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(35), clk => clk, reset => reset); --
    end block;
    -- CP-element group 36:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: marked-predecessors 
    -- CP-element group 36: 	38 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	38 
    -- CP-element group 36:  members (5) 
      -- CP-element group 36: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_update_start_
      -- CP-element group 36: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/$entry
      -- CP-element group 36: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/$entry
      -- CP-element group 36: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/word_0/$entry
      -- CP-element group 36: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/word_0/cr
      -- 
    cr_337_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_337_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => registerFileModule_CP_71_elements(36), ack => array_obj_ref_250_store_0_req_1); -- 
    registerFileModule_cp_element_group_36: block -- 
      constant place_capacities: IntegerArray(0 to 0) := (0 => 1);
      constant place_markings: IntegerArray(0 to 0)  := (0 => 1);
      constant place_delays: IntegerArray(0 to 0) := (0 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_36"; 
      signal preds: BooleanArray(1 to 1); -- 
    begin -- 
      preds(1) <= registerFileModule_CP_71_elements(38);
      gj_registerFileModule_cp_element_group_36 : generic_join generic map(name => joinName, number_of_predecessors => 1, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(36), clk => clk, reset => reset); --
    end block;
    -- CP-element group 37:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	35 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	41 
    -- CP-element group 37: marked-successors 
    -- CP-element group 37: 	6 
    -- CP-element group 37: 	7 
    -- CP-element group 37: 	8 
    -- CP-element group 37: 	11 
    -- CP-element group 37: 	15 
    -- CP-element group 37: 	35 
    -- CP-element group 37:  members (6) 
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_sample_completed_
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/$exit
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/$exit
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/word_0/$exit
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Sample/word_access_start/word_0/ra
      -- CP-element group 37: 	 assign_stmt_224_to_assign_stmt_252/ring_reenable_memory_space_0
      -- 
    ra_327_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 37_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_250_store_0_ack_0, ack => registerFileModule_CP_71_elements(37)); -- 
    -- CP-element group 38:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	36 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	41 
    -- CP-element group 38: marked-successors 
    -- CP-element group 38: 	36 
    -- CP-element group 38:  members (5) 
      -- CP-element group 38: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_update_completed_
      -- CP-element group 38: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/$exit
      -- CP-element group 38: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/$exit
      -- CP-element group 38: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/word_0/$exit
      -- CP-element group 38: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_250_Update/word_access_complete/word_0/ca
      -- 
    ca_338_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 38_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_250_store_0_ack_1, ack => registerFileModule_CP_71_elements(38)); -- 
    -- CP-element group 39:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	13 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	35 
    -- CP-element group 39:  members (1) 
      -- CP-element group 39: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_223_array_obj_ref_250_delay
      -- 
    -- Element group registerFileModule_CP_71_elements(39) is a control-delay.
    cp_element_39_delay: control_delay_element  generic map(name => " 39_delay", delay_value => 1)  port map(req => registerFileModule_CP_71_elements(13), ack => registerFileModule_CP_71_elements(39), clk => clk, reset =>reset);
    -- CP-element group 40:  transition  delay-element  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	17 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	35 
    -- CP-element group 40:  members (1) 
      -- CP-element group 40: 	 assign_stmt_224_to_assign_stmt_252/array_obj_ref_228_array_obj_ref_250_delay
      -- 
    -- Element group registerFileModule_CP_71_elements(40) is a control-delay.
    cp_element_40_delay: control_delay_element  generic map(name => " 40_delay", delay_value => 1)  port map(req => registerFileModule_CP_71_elements(17), ack => registerFileModule_CP_71_elements(40), clk => clk, reset =>reset);
    -- CP-element group 41:  join  transition  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	26 
    -- CP-element group 41: 	34 
    -- CP-element group 41: 	37 
    -- CP-element group 41: 	38 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	51 
    -- CP-element group 41:  members (1) 
      -- CP-element group 41: 	 assign_stmt_224_to_assign_stmt_252/$exit
      -- 
    registerFileModule_cp_element_group_41: block -- 
      constant place_capacities: IntegerArray(0 to 3) := (0 => 7,1 => 7,2 => 7,3 => 7);
      constant place_markings: IntegerArray(0 to 3)  := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant place_delays: IntegerArray(0 to 3) := (0 => 0,1 => 0,2 => 0,3 => 0);
      constant joinName: string(1 to 38) := "registerFileModule_cp_element_group_41"; 
      signal preds: BooleanArray(1 to 4); -- 
    begin -- 
      preds <= registerFileModule_CP_71_elements(26) & registerFileModule_CP_71_elements(34) & registerFileModule_CP_71_elements(37) & registerFileModule_CP_71_elements(38);
      gj_registerFileModule_cp_element_group_41 : generic_join generic map(name => joinName, number_of_predecessors => 4, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => registerFileModule_CP_71_elements(41), clk => clk, reset => reset); --
    end block;
    -- CP-element group 42:  place  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	2 
    -- CP-element group 42: successors 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 valid_1_update_enable
      -- 
    registerFileModule_CP_71_elements(42) <= registerFileModule_CP_71_elements(2);
    -- CP-element group 43:  place  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	3 
    -- CP-element group 43: successors 
    -- CP-element group 43:  members (1) 
      -- CP-element group 43: 	 addr_1_update_enable
      -- 
    registerFileModule_CP_71_elements(43) <= registerFileModule_CP_71_elements(3);
    -- CP-element group 44:  place  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	4 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (1) 
      -- CP-element group 44: 	 valid_2_update_enable
      -- 
    registerFileModule_CP_71_elements(44) <= registerFileModule_CP_71_elements(4);
    -- CP-element group 45:  place  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	5 
    -- CP-element group 45: successors 
    -- CP-element group 45:  members (1) 
      -- CP-element group 45: 	 addr_2_update_enable
      -- 
    registerFileModule_CP_71_elements(45) <= registerFileModule_CP_71_elements(5);
    -- CP-element group 46:  place  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	6 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (1) 
      -- CP-element group 46: 	 valid_w_update_enable
      -- 
    registerFileModule_CP_71_elements(46) <= registerFileModule_CP_71_elements(6);
    -- CP-element group 47:  place  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	7 
    -- CP-element group 47: successors 
    -- CP-element group 47:  members (1) 
      -- CP-element group 47: 	 addr_w_update_enable
      -- 
    registerFileModule_CP_71_elements(47) <= registerFileModule_CP_71_elements(7);
    -- CP-element group 48:  place  bypass  pipeline-parent 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: 	8 
    -- CP-element group 48: successors 
    -- CP-element group 48:  members (1) 
      -- CP-element group 48: 	 data_to_be_written_update_enable
      -- 
    registerFileModule_CP_71_elements(48) <= registerFileModule_CP_71_elements(8);
    -- CP-element group 49:  place  bypass  pipeline-parent 
    -- CP-element group 49: predecessors 
    -- CP-element group 49: successors 
    -- CP-element group 49: 	9 
    -- CP-element group 49:  members (1) 
      -- CP-element group 49: 	 read_data_1_update_enable
      -- 
    -- CP-element group 50:  place  bypass  pipeline-parent 
    -- CP-element group 50: predecessors 
    -- CP-element group 50: successors 
    -- CP-element group 50: 	10 
    -- CP-element group 50:  members (1) 
      -- CP-element group 50: 	 read_data_2_update_enable
      -- 
    -- CP-element group 51:  transition  bypass  pipeline-parent 
    -- CP-element group 51: predecessors 
    -- CP-element group 51: 	41 
    -- CP-element group 51: successors 
    -- CP-element group 51:  members (1) 
      -- CP-element group 51: 	 $exit
      -- 
    registerFileModule_CP_71_elements(51) <= registerFileModule_CP_71_elements(41);
    --  hookup: inputs to control-path 
    registerFileModule_CP_71_elements(49) <= read_data_1_update_enable;
    registerFileModule_CP_71_elements(50) <= read_data_2_update_enable;
    -- hookup: output from control-path 
    valid_1_update_enable <= registerFileModule_CP_71_elements(42);
    addr_1_update_enable <= registerFileModule_CP_71_elements(43);
    valid_2_update_enable <= registerFileModule_CP_71_elements(44);
    addr_2_update_enable <= registerFileModule_CP_71_elements(45);
    valid_w_update_enable <= registerFileModule_CP_71_elements(46);
    addr_w_update_enable <= registerFileModule_CP_71_elements(47);
    data_to_be_written_update_enable <= registerFileModule_CP_71_elements(48);
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal R_addr_1_222_resized : std_logic_vector(5 downto 0);
    signal R_addr_1_222_scaled : std_logic_vector(5 downto 0);
    signal R_addr_2_227_resized : std_logic_vector(5 downto 0);
    signal R_addr_2_227_scaled : std_logic_vector(5 downto 0);
    signal R_addr_w_249_resized : std_logic_vector(5 downto 0);
    signal R_addr_w_249_scaled : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_data_0 : std_logic_vector(31 downto 0);
    signal array_obj_ref_223_final_offset : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_offset_scale_factor_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_resized_base_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_root_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_word_address_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_223_word_offset_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_data_0 : std_logic_vector(31 downto 0);
    signal array_obj_ref_228_final_offset : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_offset_scale_factor_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_resized_base_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_root_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_word_address_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_228_word_offset_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_data_0 : std_logic_vector(31 downto 0);
    signal array_obj_ref_250_final_offset : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_offset_scale_factor_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_resized_base_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_root_address : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_word_address_0 : std_logic_vector(5 downto 0);
    signal array_obj_ref_250_word_offset_0 : std_logic_vector(5 downto 0);
    signal konst_236_wire_constant : std_logic_vector(31 downto 0);
    signal konst_245_wire_constant : std_logic_vector(31 downto 0);
    signal t_read_data_1_224 : std_logic_vector(31 downto 0);
    signal t_read_data_2_229 : std_logic_vector(31 downto 0);
    signal valid_1_251_delayed_4_0_232 : std_logic_vector(0 downto 0);
    signal valid_2_257_delayed_4_0_241 : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    array_obj_ref_223_offset_scale_factor_0 <= "000001";
    array_obj_ref_223_resized_base_address <= "000000";
    array_obj_ref_223_word_offset_0 <= "000000";
    array_obj_ref_228_offset_scale_factor_0 <= "000001";
    array_obj_ref_228_resized_base_address <= "000000";
    array_obj_ref_228_word_offset_0 <= "000000";
    array_obj_ref_250_offset_scale_factor_0 <= "000001";
    array_obj_ref_250_resized_base_address <= "000000";
    array_obj_ref_250_word_offset_0 <= "000000";
    konst_236_wire_constant <= "00000000000000000000000000000000";
    konst_245_wire_constant <= "00000000000000000000000000000000";
    MUX_237_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_237_inst_req_0;
      MUX_237_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_237_inst_req_1;
      MUX_237_inst_ack_1<= update_ack(0);
      MUX_237_inst: SelectSplitProtocol generic map(name => "MUX_237_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => false) -- 
        port map( x => t_read_data_1_224, y => konst_236_wire_constant, sel => valid_1_251_delayed_4_0_232, z => read_data_1_buffer, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    MUX_246_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= MUX_246_inst_req_0;
      MUX_246_inst_ack_0<= sample_ack(0);
      update_req(0) <= MUX_246_inst_req_1;
      MUX_246_inst_ack_1<= update_ack(0);
      MUX_246_inst: SelectSplitProtocol generic map(name => "MUX_246_inst", data_width => 32, buffering => 1, flow_through => false, full_rate => false) -- 
        port map( x => t_read_data_2_229, y => konst_245_wire_constant, sel => valid_2_257_delayed_4_0_241, z => read_data_2_buffer, sample_req => sample_req(0), sample_ack => sample_ack(0), update_req => update_req(0), update_ack => update_ack(0), clk => clk, reset => reset); -- 
      -- 
    end block;
    W_valid_1_251_delayed_4_0_230_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_valid_1_251_delayed_4_0_230_inst_req_0;
      W_valid_1_251_delayed_4_0_230_inst_ack_0<= wack(0);
      rreq(0) <= W_valid_1_251_delayed_4_0_230_inst_req_1;
      W_valid_1_251_delayed_4_0_230_inst_ack_1<= rack(0);
      W_valid_1_251_delayed_4_0_230_inst : InterlockBuffer generic map ( -- 
        name => "W_valid_1_251_delayed_4_0_230_inst",
        buffer_size => 4,
        flow_through =>  false ,
        full_rate =>  false ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => valid_1_buffer,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => valid_1_251_delayed_4_0_232,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_valid_2_257_delayed_4_0_239_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_valid_2_257_delayed_4_0_239_inst_req_0;
      W_valid_2_257_delayed_4_0_239_inst_ack_0<= wack(0);
      rreq(0) <= W_valid_2_257_delayed_4_0_239_inst_req_1;
      W_valid_2_257_delayed_4_0_239_inst_ack_1<= rack(0);
      W_valid_2_257_delayed_4_0_239_inst : InterlockBuffer generic map ( -- 
        name => "W_valid_2_257_delayed_4_0_239_inst",
        buffer_size => 4,
        flow_through =>  false ,
        full_rate =>  false ,
        in_data_width => 1,
        out_data_width => 1,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => valid_2_buffer,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => valid_2_257_delayed_4_0_241,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    -- equivalence array_obj_ref_223_addr_0
    process(array_obj_ref_223_root_address) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_223_root_address;
      ov(5 downto 0) := iv;
      array_obj_ref_223_word_address_0 <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_223_gather_scatter
    process(array_obj_ref_223_data_0) --
      variable iv : std_logic_vector(31 downto 0);
      variable ov : std_logic_vector(31 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_223_data_0;
      ov(31 downto 0) := iv;
      t_read_data_1_224 <= ov(31 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_223_index_0_rename
    process(R_addr_1_222_resized) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_1_222_resized;
      ov(5 downto 0) := iv;
      R_addr_1_222_scaled <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_223_index_0_resize
    process(addr_1_buffer) --
      variable iv : std_logic_vector(7 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := addr_1_buffer;
      ov := iv(5 downto 0);
      R_addr_1_222_resized <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_223_index_offset
    process(R_addr_1_222_scaled) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_1_222_scaled;
      ov(5 downto 0) := iv;
      array_obj_ref_223_final_offset <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_223_root_address_inst
    process(array_obj_ref_223_final_offset) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_223_final_offset;
      ov(5 downto 0) := iv;
      array_obj_ref_223_root_address <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_addr_0
    process(array_obj_ref_228_root_address) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_228_root_address;
      ov(5 downto 0) := iv;
      array_obj_ref_228_word_address_0 <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_gather_scatter
    process(array_obj_ref_228_data_0) --
      variable iv : std_logic_vector(31 downto 0);
      variable ov : std_logic_vector(31 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_228_data_0;
      ov(31 downto 0) := iv;
      t_read_data_2_229 <= ov(31 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_index_0_rename
    process(R_addr_2_227_resized) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_2_227_resized;
      ov(5 downto 0) := iv;
      R_addr_2_227_scaled <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_index_0_resize
    process(addr_2_buffer) --
      variable iv : std_logic_vector(7 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := addr_2_buffer;
      ov := iv(5 downto 0);
      R_addr_2_227_resized <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_index_offset
    process(R_addr_2_227_scaled) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_2_227_scaled;
      ov(5 downto 0) := iv;
      array_obj_ref_228_final_offset <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_228_root_address_inst
    process(array_obj_ref_228_final_offset) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_228_final_offset;
      ov(5 downto 0) := iv;
      array_obj_ref_228_root_address <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_addr_0
    process(array_obj_ref_250_root_address) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_250_root_address;
      ov(5 downto 0) := iv;
      array_obj_ref_250_word_address_0 <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_gather_scatter
    process(data_to_be_written_buffer) --
      variable iv : std_logic_vector(31 downto 0);
      variable ov : std_logic_vector(31 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := data_to_be_written_buffer;
      ov(31 downto 0) := iv;
      array_obj_ref_250_data_0 <= ov(31 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_index_0_rename
    process(R_addr_w_249_resized) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_w_249_resized;
      ov(5 downto 0) := iv;
      R_addr_w_249_scaled <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_index_0_resize
    process(addr_w_buffer) --
      variable iv : std_logic_vector(7 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := addr_w_buffer;
      ov := iv(5 downto 0);
      R_addr_w_249_resized <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_index_offset
    process(R_addr_w_249_scaled) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := R_addr_w_249_scaled;
      ov(5 downto 0) := iv;
      array_obj_ref_250_final_offset <= ov(5 downto 0);
      --
    end process;
    -- equivalence array_obj_ref_250_root_address_inst
    process(array_obj_ref_250_final_offset) --
      variable iv : std_logic_vector(5 downto 0);
      variable ov : std_logic_vector(5 downto 0);
      -- 
    begin -- 
      ov := (others => '0');
      iv := array_obj_ref_250_final_offset;
      ov(5 downto 0) := iv;
      array_obj_ref_250_root_address <= ov(5 downto 0);
      --
    end process;
    -- shared load operator group (0) : array_obj_ref_228_load_0 array_obj_ref_223_load_0 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(11 downto 0);
      signal data_out: std_logic_vector(63 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant inBUFs : IntegerArray(1 downto 0) := (1 => 0, 0 => 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 1, 0 => 1);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => true, 1 => true);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 4, 1 => 4);
      -- 
    begin -- 
      reqL_unguarded(1) <= array_obj_ref_228_load_0_req_0;
      reqL_unguarded(0) <= array_obj_ref_223_load_0_req_0;
      array_obj_ref_228_load_0_ack_0 <= ackL_unguarded(1);
      array_obj_ref_223_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= array_obj_ref_228_load_0_req_1;
      reqR_unguarded(0) <= array_obj_ref_223_load_0_req_1;
      array_obj_ref_228_load_0_ack_1 <= ackR_unguarded(1);
      array_obj_ref_223_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= valid_1_buffer(0);
      guard_vector(1)  <= valid_2_buffer(0);
      LoadGroup0_accessRegulator_0: access_regulator_base generic map (name => "LoadGroup0_accessRegulator_0", num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      LoadGroup0_accessRegulator_1: access_regulator_base generic map (name => "LoadGroup0_accessRegulator_1", num_slots => 1) -- 
        port map (req => reqL_unregulated(1), -- 
          ack => ackL_unregulated(1),
          regulated_req => reqL(1),
          regulated_ack => ackL(1),
          release_req => reqR(1),
          release_ack => ackR(1),
          clk => clk, reset => reset); -- 
      LoadGroup0_gI: SplitGuardInterface generic map(name => "LoadGroup0_gI", nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      data_in <= array_obj_ref_228_word_address_0 & array_obj_ref_223_word_address_0;
      array_obj_ref_228_data_0 <= data_out(63 downto 32);
      array_obj_ref_223_data_0 <= data_out(31 downto 0);
      LoadReq: LoadReqSharedWithInputBuffers -- 
        generic map ( name => "LoadGroup0", addr_width => 6,
        num_reqs => 2,
        tag_length => 2,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_0_lr_req(0),
          mack => memory_space_0_lr_ack(0),
          maddr => memory_space_0_lr_addr(5 downto 0),
          mtag => memory_space_0_lr_tag(18 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup0 load-complete ",
        data_width => 32,
        num_reqs => 2,
        tag_length => 2,
        detailed_buffering_per_output => outBUFs, 
        no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_0_lc_req(0),
          mack => memory_space_0_lc_ack(0),
          mdata => memory_space_0_lc_data(31 downto 0),
          mtag => memory_space_0_lc_tag(1 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared store operator group (0) : array_obj_ref_250_store_0 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(5 downto 0);
      signal data_in: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 7);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= array_obj_ref_250_store_0_req_0;
      array_obj_ref_250_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= array_obj_ref_250_store_0_req_1;
      array_obj_ref_250_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <= valid_w_buffer(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      StoreGroup0_gI: SplitGuardInterface generic map(name => "StoreGroup0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      addr_in <= array_obj_ref_250_word_address_0;
      data_in <= array_obj_ref_250_data_0;
      StoreReq: StoreReqSharedWithInputBuffers -- 
        generic map ( name => "StoreGroup0 Req ", addr_width => 6,
        data_width => 32,
        num_reqs => 1,
        tag_length => 2,
        time_stamp_width => 17,
        min_clock_period => false,
        input_buffering => inBUFs, 
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_0_sr_req(0),
          mack => memory_space_0_sr_ack(0),
          maddr => memory_space_0_sr_addr(5 downto 0),
          mdata => memory_space_0_sr_data(31 downto 0),
          mtag => memory_space_0_sr_tag(18 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          name => "StoreGroup0 Complete ",
          num_reqs => 1,
          detailed_buffering_per_output => outBUFs,
          tag_length => 2 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_0_sc_req(0),
          mack => memory_space_0_sc_ack(0),
          mtag => memory_space_0_sc_tag(1 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    -- 
  end Block; -- data_path
  -- 
end registerFileModule_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity send_to_uart is -- 
  generic (tag_length : integer); 
  port ( -- 
    data_to_send : in  std_logic_vector(31 downto 0);
    out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_pipe_pipe_write_data : out  std_logic_vector(7 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity send_to_uart;
architecture send_to_uart_arch of send_to_uart is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 32)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  signal data_to_send_buffer :  std_logic_vector(31 downto 0);
  signal data_to_send_update_enable: Boolean;
  -- output port buffer signals
  signal send_to_uart_CP_427_start: Boolean;
  signal send_to_uart_CP_427_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal slice_282_inst_ack_0 : boolean;
  signal WPIPE_out_pipe_305_inst_ack_1 : boolean;
  signal WPIPE_out_pipe_305_inst_req_1 : boolean;
  signal WPIPE_out_pipe_305_inst_ack_0 : boolean;
  signal WPIPE_out_pipe_305_inst_req_0 : boolean;
  signal slice_282_inst_req_0 : boolean;
  signal slice_290_inst_ack_0 : boolean;
  signal slice_290_inst_req_0 : boolean;
  signal slice_282_inst_ack_1 : boolean;
  signal slice_282_inst_req_1 : boolean;
  signal WPIPE_out_pipe_302_inst_ack_1 : boolean;
  signal WPIPE_out_pipe_302_inst_req_1 : boolean;
  signal WPIPE_out_pipe_302_inst_ack_0 : boolean;
  signal WPIPE_out_pipe_302_inst_req_0 : boolean;
  signal WPIPE_out_pipe_299_inst_ack_1 : boolean;
  signal WPIPE_out_pipe_299_inst_req_1 : boolean;
  signal WPIPE_out_pipe_299_inst_ack_0 : boolean;
  signal WPIPE_out_pipe_299_inst_req_0 : boolean;
  signal WPIPE_out_pipe_296_inst_ack_1 : boolean;
  signal slice_286_inst_ack_1 : boolean;
  signal WPIPE_out_pipe_296_inst_req_1 : boolean;
  signal WPIPE_out_pipe_296_inst_ack_0 : boolean;
  signal WPIPE_out_pipe_296_inst_req_0 : boolean;
  signal slice_294_inst_ack_1 : boolean;
  signal slice_294_inst_req_1 : boolean;
  signal slice_294_inst_ack_0 : boolean;
  signal slice_294_inst_req_0 : boolean;
  signal slice_286_inst_req_1 : boolean;
  signal slice_286_inst_ack_0 : boolean;
  signal slice_286_inst_req_0 : boolean;
  signal slice_290_inst_ack_1 : boolean;
  signal slice_290_inst_req_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "send_to_uart_input_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      bypass_flag => false,
      data_width => tag_length + 32) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(31 downto 0) <= data_to_send;
  data_to_send_buffer <= in_buffer_data_out(31 downto 0);
  in_buffer_data_in(tag_length + 31 downto 32) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length + 31 downto 32);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  send_to_uart_CP_427_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "send_to_uart_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_uart_CP_427_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= send_to_uart_CP_427_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= send_to_uart_CP_427_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  send_to_uart_CP_427: Block -- control-path 
    signal send_to_uart_CP_427_elements: BooleanArray(19 downto 0);
    -- 
  begin -- 
    send_to_uart_CP_427_elements(0) <= send_to_uart_CP_427_start;
    send_to_uart_CP_427_symbol <= send_to_uart_CP_427_elements(19);
    -- CP-element group 0:  fork  transition  output  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0: 	2 
    -- CP-element group 0: 	3 
    -- CP-element group 0: 	4 
    -- CP-element group 0: 	5 
    -- CP-element group 0: 	6 
    -- CP-element group 0: 	7 
    -- CP-element group 0: 	8 
    -- CP-element group 0:  members (26) 
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Sample/rr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Sample/rr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_sample_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Update/cr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_update_start_
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Update/cr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Update/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Sample/rr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_update_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Update/cr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_update_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Update/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_294_sample_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Sample/rr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Update/cr
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Sample/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Update/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_286_update_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Update/$entry
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_290_sample_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/slice_282_sample_start_
      -- CP-element group 0: 	 assign_stmt_283_to_assign_stmt_307/$entry
      -- 
    rr_440_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_440_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_282_inst_req_0); -- 
    cr_445_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_445_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_282_inst_req_1); -- 
    rr_454_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_454_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_286_inst_req_0); -- 
    cr_459_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_459_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_286_inst_req_1); -- 
    rr_468_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_468_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_290_inst_req_0); -- 
    cr_473_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_473_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_290_inst_req_1); -- 
    rr_482_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_482_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_294_inst_req_0); -- 
    cr_487_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_487_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(0), ack => slice_294_inst_req_1); -- 
    -- CP-element group 1:  transition  input  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Sample/ra
      -- CP-element group 1: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Sample/$exit
      -- CP-element group 1: 	 assign_stmt_283_to_assign_stmt_307/slice_282_sample_completed_
      -- 
    ra_441_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 1_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_282_inst_ack_0, ack => send_to_uart_CP_427_elements(1)); -- 
    -- CP-element group 2:  transition  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	0 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	9 
    -- CP-element group 2:  members (6) 
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/slice_282_update_completed_
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Update/ca
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/slice_282_Update/$exit
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Sample/req
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Sample/$entry
      -- CP-element group 2: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_sample_start_
      -- 
    ca_446_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_282_inst_ack_1, ack => send_to_uart_CP_427_elements(2)); -- 
    req_496_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_496_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(2), ack => WPIPE_out_pipe_296_inst_req_0); -- 
    -- CP-element group 3:  transition  input  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	0 
    -- CP-element group 3: successors 
    -- CP-element group 3:  members (3) 
      -- CP-element group 3: 	 assign_stmt_283_to_assign_stmt_307/slice_286_sample_completed_
      -- CP-element group 3: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Sample/ra
      -- CP-element group 3: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Sample/$exit
      -- 
    ra_455_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_286_inst_ack_0, ack => send_to_uart_CP_427_elements(3)); -- 
    -- CP-element group 4:  transition  input  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	0 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	11 
    -- CP-element group 4:  members (3) 
      -- CP-element group 4: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Update/ca
      -- CP-element group 4: 	 assign_stmt_283_to_assign_stmt_307/slice_286_Update/$exit
      -- CP-element group 4: 	 assign_stmt_283_to_assign_stmt_307/slice_286_update_completed_
      -- 
    ca_460_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_286_inst_ack_1, ack => send_to_uart_CP_427_elements(4)); -- 
    -- CP-element group 5:  transition  input  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	0 
    -- CP-element group 5: successors 
    -- CP-element group 5:  members (3) 
      -- CP-element group 5: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Sample/ra
      -- CP-element group 5: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Sample/$exit
      -- CP-element group 5: 	 assign_stmt_283_to_assign_stmt_307/slice_290_sample_completed_
      -- 
    ra_469_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_290_inst_ack_0, ack => send_to_uart_CP_427_elements(5)); -- 
    -- CP-element group 6:  transition  input  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	0 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	14 
    -- CP-element group 6:  members (3) 
      -- CP-element group 6: 	 assign_stmt_283_to_assign_stmt_307/slice_290_update_completed_
      -- CP-element group 6: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Update/ca
      -- CP-element group 6: 	 assign_stmt_283_to_assign_stmt_307/slice_290_Update/$exit
      -- 
    ca_474_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 6_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_290_inst_ack_1, ack => send_to_uart_CP_427_elements(6)); -- 
    -- CP-element group 7:  transition  input  bypass 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	0 
    -- CP-element group 7: successors 
    -- CP-element group 7:  members (3) 
      -- CP-element group 7: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Sample/ra
      -- CP-element group 7: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Sample/$exit
      -- CP-element group 7: 	 assign_stmt_283_to_assign_stmt_307/slice_294_sample_completed_
      -- 
    ra_483_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 7_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_294_inst_ack_0, ack => send_to_uart_CP_427_elements(7)); -- 
    -- CP-element group 8:  transition  input  bypass 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	0 
    -- CP-element group 8: successors 
    -- CP-element group 8: 	17 
    -- CP-element group 8:  members (3) 
      -- CP-element group 8: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Update/ca
      -- CP-element group 8: 	 assign_stmt_283_to_assign_stmt_307/slice_294_Update/$exit
      -- CP-element group 8: 	 assign_stmt_283_to_assign_stmt_307/slice_294_update_completed_
      -- 
    ca_488_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 8_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => slice_294_inst_ack_1, ack => send_to_uart_CP_427_elements(8)); -- 
    -- CP-element group 9:  transition  input  output  bypass 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	2 
    -- CP-element group 9: successors 
    -- CP-element group 9: 	10 
    -- CP-element group 9:  members (6) 
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Update/req
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Update/$entry
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Sample/ack
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Sample/$exit
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_update_start_
      -- CP-element group 9: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_sample_completed_
      -- 
    ack_497_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 9_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_296_inst_ack_0, ack => send_to_uart_CP_427_elements(9)); -- 
    req_501_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_501_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(9), ack => WPIPE_out_pipe_296_inst_req_1); -- 
    -- CP-element group 10:  transition  input  bypass 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	9 
    -- CP-element group 10: successors 
    -- CP-element group 10: 	11 
    -- CP-element group 10:  members (3) 
      -- CP-element group 10: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Update/ack
      -- CP-element group 10: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_Update/$exit
      -- CP-element group 10: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_296_update_completed_
      -- 
    ack_502_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 10_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_296_inst_ack_1, ack => send_to_uart_CP_427_elements(10)); -- 
    -- CP-element group 11:  join  transition  output  bypass 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: 	4 
    -- CP-element group 11: 	10 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	12 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Sample/req
      -- CP-element group 11: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Sample/$entry
      -- CP-element group 11: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_sample_start_
      -- 
    req_510_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_510_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(11), ack => WPIPE_out_pipe_299_inst_req_0); -- 
    send_to_uart_cp_element_group_11: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_uart_cp_element_group_11"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_uart_CP_427_elements(4) & send_to_uart_CP_427_elements(10);
      gj_send_to_uart_cp_element_group_11 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_uart_CP_427_elements(11), clk => clk, reset => reset); --
    end block;
    -- CP-element group 12:  transition  input  output  bypass 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	11 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	13 
    -- CP-element group 12:  members (6) 
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Update/req
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Update/$entry
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Sample/ack
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Sample/$exit
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_update_start_
      -- CP-element group 12: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_sample_completed_
      -- 
    ack_511_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 12_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_299_inst_ack_0, ack => send_to_uart_CP_427_elements(12)); -- 
    req_515_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_515_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(12), ack => WPIPE_out_pipe_299_inst_req_1); -- 
    -- CP-element group 13:  transition  input  bypass 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	12 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	14 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Update/ack
      -- CP-element group 13: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_Update/$exit
      -- CP-element group 13: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_299_update_completed_
      -- 
    ack_516_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 13_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_299_inst_ack_1, ack => send_to_uart_CP_427_elements(13)); -- 
    -- CP-element group 14:  join  transition  output  bypass 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	6 
    -- CP-element group 14: 	13 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	15 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Sample/req
      -- CP-element group 14: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Sample/$entry
      -- CP-element group 14: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_sample_start_
      -- 
    req_524_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_524_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(14), ack => WPIPE_out_pipe_302_inst_req_0); -- 
    send_to_uart_cp_element_group_14: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_uart_cp_element_group_14"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_uart_CP_427_elements(6) & send_to_uart_CP_427_elements(13);
      gj_send_to_uart_cp_element_group_14 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_uart_CP_427_elements(14), clk => clk, reset => reset); --
    end block;
    -- CP-element group 15:  transition  input  output  bypass 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	14 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	16 
    -- CP-element group 15:  members (6) 
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Update/req
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Update/$entry
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Sample/ack
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Sample/$exit
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_update_start_
      -- CP-element group 15: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_sample_completed_
      -- 
    ack_525_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 15_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_302_inst_ack_0, ack => send_to_uart_CP_427_elements(15)); -- 
    req_529_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_529_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(15), ack => WPIPE_out_pipe_302_inst_req_1); -- 
    -- CP-element group 16:  transition  input  bypass 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	17 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Update/ack
      -- CP-element group 16: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_Update/$exit
      -- CP-element group 16: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_302_update_completed_
      -- 
    ack_530_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 16_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_302_inst_ack_1, ack => send_to_uart_CP_427_elements(16)); -- 
    -- CP-element group 17:  join  transition  output  bypass 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	8 
    -- CP-element group 17: 	16 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	18 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Sample/req
      -- CP-element group 17: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Sample/$entry
      -- CP-element group 17: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_sample_start_
      -- 
    req_538_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_538_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(17), ack => WPIPE_out_pipe_305_inst_req_0); -- 
    send_to_uart_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "send_to_uart_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= send_to_uart_CP_427_elements(8) & send_to_uart_CP_427_elements(16);
      gj_send_to_uart_cp_element_group_17 : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => send_to_uart_CP_427_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  transition  input  output  bypass 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	17 
    -- CP-element group 18: successors 
    -- CP-element group 18: 	19 
    -- CP-element group 18:  members (6) 
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Update/req
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Update/$entry
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Sample/ack
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Sample/$exit
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_update_start_
      -- CP-element group 18: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_sample_completed_
      -- 
    ack_539_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 18_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_305_inst_ack_0, ack => send_to_uart_CP_427_elements(18)); -- 
    req_543_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_543_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => send_to_uart_CP_427_elements(18), ack => WPIPE_out_pipe_305_inst_req_1); -- 
    -- CP-element group 19:  transition  input  bypass 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	18 
    -- CP-element group 19: successors 
    -- CP-element group 19:  members (5) 
      -- CP-element group 19: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Update/ack
      -- CP-element group 19: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_Update/$exit
      -- CP-element group 19: 	 assign_stmt_283_to_assign_stmt_307/WPIPE_out_pipe_305_update_completed_
      -- CP-element group 19: 	 $exit
      -- CP-element group 19: 	 assign_stmt_283_to_assign_stmt_307/$exit
      -- 
    ack_544_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 19_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_pipe_305_inst_ack_1, ack => send_to_uart_CP_427_elements(19)); -- 
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal out_data_0_283 : std_logic_vector(7 downto 0);
    signal out_data_1_287 : std_logic_vector(7 downto 0);
    signal out_data_2_291 : std_logic_vector(7 downto 0);
    signal out_data_3_295 : std_logic_vector(7 downto 0);
    -- 
  begin -- 
    slice_282_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_282_inst_req_0;
      slice_282_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_282_inst_req_1;
      slice_282_inst_ack_1<= update_ack(0);
      slice_282_inst: SliceSplitProtocol generic map(name => "slice_282_inst", in_data_width => 32, high_index => 31, low_index => 24, buffering => 1, flow_through => false,  full_rate => false) -- 
        port map( din => data_to_send_buffer, dout => out_data_0_283, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_286_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_286_inst_req_0;
      slice_286_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_286_inst_req_1;
      slice_286_inst_ack_1<= update_ack(0);
      slice_286_inst: SliceSplitProtocol generic map(name => "slice_286_inst", in_data_width => 32, high_index => 23, low_index => 16, buffering => 1, flow_through => false,  full_rate => false) -- 
        port map( din => data_to_send_buffer, dout => out_data_1_287, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_290_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_290_inst_req_0;
      slice_290_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_290_inst_req_1;
      slice_290_inst_ack_1<= update_ack(0);
      slice_290_inst: SliceSplitProtocol generic map(name => "slice_290_inst", in_data_width => 32, high_index => 15, low_index => 8, buffering => 1, flow_through => false,  full_rate => false) -- 
        port map( din => data_to_send_buffer, dout => out_data_2_291, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    slice_294_inst_block : block -- 
      signal sample_req, sample_ack, update_req, update_ack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      sample_req(0) <= slice_294_inst_req_0;
      slice_294_inst_ack_0<= sample_ack(0);
      update_req(0) <= slice_294_inst_req_1;
      slice_294_inst_ack_1<= update_ack(0);
      slice_294_inst: SliceSplitProtocol generic map(name => "slice_294_inst", in_data_width => 32, high_index => 7, low_index => 0, buffering => 1, flow_through => false,  full_rate => false) -- 
        port map( din => data_to_send_buffer, dout => out_data_3_295, sample_req => sample_req(0) , sample_ack => sample_ack(0) , update_req => update_req(0) , update_ack => update_ack(0) , clk => clk, reset => reset); -- 
      -- 
    end block;
    -- shared outport operator group (0) : WPIPE_out_pipe_296_inst WPIPE_out_pipe_305_inst WPIPE_out_pipe_299_inst WPIPE_out_pipe_302_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 3 downto 0);
      signal update_req, update_ack : BooleanArray( 3 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 3 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 3 downto 0);
      signal guard_vector : std_logic_vector( 3 downto 0);
      constant inBUFs : IntegerArray(3 downto 0) := (3 => 0, 2 => 0, 1 => 0, 0 => 0);
      constant guardFlags : BooleanArray(3 downto 0) := (0 => false, 1 => false, 2 => false, 3 => false);
      constant guardBuffering: IntegerArray(3 downto 0)  := (0 => 2, 1 => 2, 2 => 2, 3 => 2);
      -- 
    begin -- 
      sample_req_unguarded(3) <= WPIPE_out_pipe_296_inst_req_0;
      sample_req_unguarded(2) <= WPIPE_out_pipe_305_inst_req_0;
      sample_req_unguarded(1) <= WPIPE_out_pipe_299_inst_req_0;
      sample_req_unguarded(0) <= WPIPE_out_pipe_302_inst_req_0;
      WPIPE_out_pipe_296_inst_ack_0 <= sample_ack_unguarded(3);
      WPIPE_out_pipe_305_inst_ack_0 <= sample_ack_unguarded(2);
      WPIPE_out_pipe_299_inst_ack_0 <= sample_ack_unguarded(1);
      WPIPE_out_pipe_302_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(3) <= WPIPE_out_pipe_296_inst_req_1;
      update_req_unguarded(2) <= WPIPE_out_pipe_305_inst_req_1;
      update_req_unguarded(1) <= WPIPE_out_pipe_299_inst_req_1;
      update_req_unguarded(0) <= WPIPE_out_pipe_302_inst_req_1;
      WPIPE_out_pipe_296_inst_ack_1 <= update_ack_unguarded(3);
      WPIPE_out_pipe_305_inst_ack_1 <= update_ack_unguarded(2);
      WPIPE_out_pipe_299_inst_ack_1 <= update_ack_unguarded(1);
      WPIPE_out_pipe_302_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      guard_vector(2)  <=  '1';
      guard_vector(3)  <=  '1';
      data_in <= out_data_0_283 & out_data_3_295 & out_data_1_287 & out_data_2_291;
      out_pipe_write_0_gI: SplitGuardInterface generic map(name => "out_pipe_write_0_gI", nreqs => 4, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      out_pipe_write_0: OutputPortRevised -- 
        generic map ( name => "out_pipe", data_width => 8, num_reqs => 4, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_pipe_pipe_write_req(0),
          oack => out_pipe_pipe_write_ack(0),
          odata => out_pipe_pipe_write_data(7 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end send_to_uart_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library memory_lib;
use memory_lib.memory_libComponents.all;
library work;
use work.ahir_system_global_package.all;
entity ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_pipe_pipe_write_data: in std_logic_vector(7 downto 0);
    in_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
    in_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_pipe_pipe_read_data: out std_logic_vector(7 downto 0);
    out_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    out_pipe_pipe_read_ack : out std_logic_vector(0 downto 0);
    start_processor: in std_logic_vector(7 downto 0)); -- 
  -- 
end entity; 
architecture ahir_system_arch  of ahir_system is -- system-architecture 
  -- interface signals to connect to memory space memory_space_0
  signal memory_space_0_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_lr_addr : std_logic_vector(5 downto 0);
  signal memory_space_0_lr_tag : std_logic_vector(18 downto 0);
  signal memory_space_0_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_lc_data : std_logic_vector(31 downto 0);
  signal memory_space_0_lc_tag :  std_logic_vector(1 downto 0);
  signal memory_space_0_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_sr_addr : std_logic_vector(5 downto 0);
  signal memory_space_0_sr_data : std_logic_vector(31 downto 0);
  signal memory_space_0_sr_tag : std_logic_vector(18 downto 0);
  signal memory_space_0_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_sc_tag :  std_logic_vector(1 downto 0);
  -- declarations related to module cal_Next_program_cnt
  component cal_Next_program_cnt is -- 
    generic (tag_length : integer); 
    port ( -- 
      opcode : in  std_logic_vector(7 downto 0);
      rd1 : in  std_logic_vector(31 downto 0);
      rd2 : in  std_logic_vector(31 downto 0);
      program_cnt : in  std_logic_vector(7 downto 0);
      is_rs1_neg : in  std_logic_vector(0 downto 0);
      n_program_cnt : out  std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module cal_Next_program_cnt
  signal cal_Next_program_cnt_opcode :  std_logic_vector(7 downto 0);
  signal cal_Next_program_cnt_rd1 :  std_logic_vector(31 downto 0);
  signal cal_Next_program_cnt_rd2 :  std_logic_vector(31 downto 0);
  signal cal_Next_program_cnt_program_cnt :  std_logic_vector(7 downto 0);
  signal cal_Next_program_cnt_is_rs1_neg :  std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_n_program_cnt :  std_logic_vector(7 downto 0);
  signal cal_Next_program_cnt_in_args    : std_logic_vector(80 downto 0);
  signal cal_Next_program_cnt_out_args   : std_logic_vector(7 downto 0);
  signal cal_Next_program_cnt_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal cal_Next_program_cnt_tag_out   : std_logic_vector(1 downto 0);
  signal cal_Next_program_cnt_start_req : std_logic;
  signal cal_Next_program_cnt_start_ack : std_logic;
  signal cal_Next_program_cnt_fin_req   : std_logic;
  signal cal_Next_program_cnt_fin_ack : std_logic;
  -- caller side aggregated signals for module cal_Next_program_cnt
  signal cal_Next_program_cnt_call_reqs: std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_call_acks: std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_return_reqs: std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_return_acks: std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_call_data: std_logic_vector(80 downto 0);
  signal cal_Next_program_cnt_call_tag: std_logic_vector(0 downto 0);
  signal cal_Next_program_cnt_return_data: std_logic_vector(7 downto 0);
  signal cal_Next_program_cnt_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module memory_daemon
  -- argument signals for module memory_daemon
  signal memory_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal memory_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal memory_daemon_start_req : std_logic;
  signal memory_daemon_start_ack : std_logic;
  signal memory_daemon_fin_req   : std_logic;
  signal memory_daemon_fin_ack : std_logic;
  -- declarations related to module processor
  component processor is -- 
    generic (tag_length : integer); 
    port ( -- 
      mem_out_pipe_read_req : out  std_logic_vector(0 downto 0);
      mem_out_pipe_read_ack : in   std_logic_vector(0 downto 0);
      mem_out_pipe_read_data : in   std_logic_vector(31 downto 0);
      start_processor : in std_logic_vector(7 downto 0);
      mem_in_pipe_write_req : out  std_logic_vector(0 downto 0);
      mem_in_pipe_write_ack : in   std_logic_vector(0 downto 0);
      mem_in_pipe_write_data : out  std_logic_vector(63 downto 0);
      cal_Next_program_cnt_call_reqs : out  std_logic_vector(0 downto 0);
      cal_Next_program_cnt_call_acks : in   std_logic_vector(0 downto 0);
      cal_Next_program_cnt_call_data : out  std_logic_vector(80 downto 0);
      cal_Next_program_cnt_call_tag  :  out  std_logic_vector(0 downto 0);
      cal_Next_program_cnt_return_reqs : out  std_logic_vector(0 downto 0);
      cal_Next_program_cnt_return_acks : in   std_logic_vector(0 downto 0);
      cal_Next_program_cnt_return_data : in   std_logic_vector(7 downto 0);
      cal_Next_program_cnt_return_tag :  in   std_logic_vector(0 downto 0);
      registerFileModule_call_reqs : out  std_logic_vector(0 downto 0);
      registerFileModule_call_acks : in   std_logic_vector(0 downto 0);
      registerFileModule_call_data : out  std_logic_vector(58 downto 0);
      registerFileModule_call_tag  :  out  std_logic_vector(1 downto 0);
      registerFileModule_return_reqs : out  std_logic_vector(0 downto 0);
      registerFileModule_return_acks : in   std_logic_vector(0 downto 0);
      registerFileModule_return_data : in   std_logic_vector(63 downto 0);
      registerFileModule_return_tag :  in   std_logic_vector(1 downto 0);
      send_to_uart_call_reqs : out  std_logic_vector(0 downto 0);
      send_to_uart_call_acks : in   std_logic_vector(0 downto 0);
      send_to_uart_call_data : out  std_logic_vector(31 downto 0);
      send_to_uart_call_tag  :  out  std_logic_vector(0 downto 0);
      send_to_uart_return_reqs : out  std_logic_vector(0 downto 0);
      send_to_uart_return_acks : in   std_logic_vector(0 downto 0);
      send_to_uart_return_tag :  in   std_logic_vector(0 downto 0);
      receive_from_uart_call_reqs : out  std_logic_vector(0 downto 0);
      receive_from_uart_call_acks : in   std_logic_vector(0 downto 0);
      receive_from_uart_call_tag  :  out  std_logic_vector(0 downto 0);
      receive_from_uart_return_reqs : out  std_logic_vector(0 downto 0);
      receive_from_uart_return_acks : in   std_logic_vector(0 downto 0);
      receive_from_uart_return_data : in   std_logic_vector(31 downto 0);
      receive_from_uart_return_tag :  in   std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module processor
  signal processor_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal processor_tag_out   : std_logic_vector(1 downto 0);
  signal processor_start_req : std_logic;
  signal processor_start_ack : std_logic;
  signal processor_fin_req   : std_logic;
  signal processor_fin_ack : std_logic;
  -- declarations related to module receive_from_uart
  component receive_from_uart is -- 
    generic (tag_length : integer); 
    port ( -- 
      receive_data_from_uart : out  std_logic_vector(31 downto 0);
      in_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_pipe_pipe_read_data : in   std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module receive_from_uart
  signal receive_from_uart_receive_data_from_uart :  std_logic_vector(31 downto 0);
  signal receive_from_uart_out_args   : std_logic_vector(31 downto 0);
  signal receive_from_uart_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal receive_from_uart_tag_out   : std_logic_vector(1 downto 0);
  signal receive_from_uart_start_req : std_logic;
  signal receive_from_uart_start_ack : std_logic;
  signal receive_from_uart_fin_req   : std_logic;
  signal receive_from_uart_fin_ack : std_logic;
  -- caller side aggregated signals for module receive_from_uart
  signal receive_from_uart_call_reqs: std_logic_vector(0 downto 0);
  signal receive_from_uart_call_acks: std_logic_vector(0 downto 0);
  signal receive_from_uart_return_reqs: std_logic_vector(0 downto 0);
  signal receive_from_uart_return_acks: std_logic_vector(0 downto 0);
  signal receive_from_uart_call_tag: std_logic_vector(0 downto 0);
  signal receive_from_uart_return_data: std_logic_vector(31 downto 0);
  signal receive_from_uart_return_tag: std_logic_vector(0 downto 0);
  -- declarations related to module registerFileModule
  component registerFileModule is -- 
    generic (tag_length : integer); 
    port ( -- 
      valid_1 : in  std_logic_vector(0 downto 0);
      addr_1 : in  std_logic_vector(7 downto 0);
      valid_2 : in  std_logic_vector(0 downto 0);
      addr_2 : in  std_logic_vector(7 downto 0);
      valid_w : in  std_logic_vector(0 downto 0);
      addr_w : in  std_logic_vector(7 downto 0);
      data_to_be_written : in  std_logic_vector(31 downto 0);
      read_data_1 : out  std_logic_vector(31 downto 0);
      read_data_2 : out  std_logic_vector(31 downto 0);
      memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lr_addr : out  std_logic_vector(5 downto 0);
      memory_space_0_lr_tag :  out  std_logic_vector(18 downto 0);
      memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lc_data : in   std_logic_vector(31 downto 0);
      memory_space_0_lc_tag :  in  std_logic_vector(1 downto 0);
      memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sr_addr : out  std_logic_vector(5 downto 0);
      memory_space_0_sr_data : out  std_logic_vector(31 downto 0);
      memory_space_0_sr_tag :  out  std_logic_vector(18 downto 0);
      memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sc_tag :  in  std_logic_vector(1 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module registerFileModule
  signal registerFileModule_valid_1 :  std_logic_vector(0 downto 0);
  signal registerFileModule_addr_1 :  std_logic_vector(7 downto 0);
  signal registerFileModule_valid_2 :  std_logic_vector(0 downto 0);
  signal registerFileModule_addr_2 :  std_logic_vector(7 downto 0);
  signal registerFileModule_valid_w :  std_logic_vector(0 downto 0);
  signal registerFileModule_addr_w :  std_logic_vector(7 downto 0);
  signal registerFileModule_data_to_be_written :  std_logic_vector(31 downto 0);
  signal registerFileModule_read_data_1 :  std_logic_vector(31 downto 0);
  signal registerFileModule_read_data_2 :  std_logic_vector(31 downto 0);
  signal registerFileModule_in_args    : std_logic_vector(58 downto 0);
  signal registerFileModule_out_args   : std_logic_vector(63 downto 0);
  signal registerFileModule_tag_in    : std_logic_vector(2 downto 0) := (others => '0');
  signal registerFileModule_tag_out   : std_logic_vector(2 downto 0);
  signal registerFileModule_start_req : std_logic;
  signal registerFileModule_start_ack : std_logic;
  signal registerFileModule_fin_req   : std_logic;
  signal registerFileModule_fin_ack : std_logic;
  -- caller side aggregated signals for module registerFileModule
  signal registerFileModule_call_reqs: std_logic_vector(0 downto 0);
  signal registerFileModule_call_acks: std_logic_vector(0 downto 0);
  signal registerFileModule_return_reqs: std_logic_vector(0 downto 0);
  signal registerFileModule_return_acks: std_logic_vector(0 downto 0);
  signal registerFileModule_call_data: std_logic_vector(58 downto 0);
  signal registerFileModule_call_tag: std_logic_vector(1 downto 0);
  signal registerFileModule_return_data: std_logic_vector(63 downto 0);
  signal registerFileModule_return_tag: std_logic_vector(1 downto 0);
  -- declarations related to module send_to_uart
  component send_to_uart is -- 
    generic (tag_length : integer); 
    port ( -- 
      data_to_send : in  std_logic_vector(31 downto 0);
      out_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_pipe_pipe_write_data : out  std_logic_vector(7 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module send_to_uart
  signal send_to_uart_data_to_send :  std_logic_vector(31 downto 0);
  signal send_to_uart_in_args    : std_logic_vector(31 downto 0);
  signal send_to_uart_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal send_to_uart_tag_out   : std_logic_vector(1 downto 0);
  signal send_to_uart_start_req : std_logic;
  signal send_to_uart_start_ack : std_logic;
  signal send_to_uart_fin_req   : std_logic;
  signal send_to_uart_fin_ack : std_logic;
  -- caller side aggregated signals for module send_to_uart
  signal send_to_uart_call_reqs: std_logic_vector(0 downto 0);
  signal send_to_uart_call_acks: std_logic_vector(0 downto 0);
  signal send_to_uart_return_reqs: std_logic_vector(0 downto 0);
  signal send_to_uart_return_acks: std_logic_vector(0 downto 0);
  signal send_to_uart_call_data: std_logic_vector(31 downto 0);
  signal send_to_uart_call_tag: std_logic_vector(0 downto 0);
  signal send_to_uart_return_tag: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe in_pipe
  signal in_pipe_pipe_read_data: std_logic_vector(7 downto 0);
  signal in_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe mem_in
  signal mem_in_pipe_write_data: std_logic_vector(63 downto 0);
  signal mem_in_pipe_write_req: std_logic_vector(0 downto 0);
  signal mem_in_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe mem_in
  signal mem_in_pipe_read_data: std_logic_vector(63 downto 0);
  signal mem_in_pipe_read_req: std_logic_vector(0 downto 0);
  signal mem_in_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe mem_out
  signal mem_out_pipe_write_data: std_logic_vector(31 downto 0);
  signal mem_out_pipe_write_req: std_logic_vector(0 downto 0);
  signal mem_out_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for read from pipe mem_out
  signal mem_out_pipe_read_data: std_logic_vector(31 downto 0);
  signal mem_out_pipe_read_req: std_logic_vector(0 downto 0);
  signal mem_out_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_pipe
  signal out_pipe_pipe_write_data: std_logic_vector(7 downto 0);
  signal out_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module cal_Next_program_cnt
  cal_Next_program_cnt_opcode <= cal_Next_program_cnt_in_args(80 downto 73);
  cal_Next_program_cnt_rd1 <= cal_Next_program_cnt_in_args(72 downto 41);
  cal_Next_program_cnt_rd2 <= cal_Next_program_cnt_in_args(40 downto 9);
  cal_Next_program_cnt_program_cnt <= cal_Next_program_cnt_in_args(8 downto 1);
  cal_Next_program_cnt_is_rs1_neg <= cal_Next_program_cnt_in_args(0 downto 0);
  cal_Next_program_cnt_out_args <= cal_Next_program_cnt_n_program_cnt ;
  -- call arbiter for module cal_Next_program_cnt
  cal_Next_program_cnt_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 1,
      call_data_width => 81,
      return_data_width => 8,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => cal_Next_program_cnt_call_reqs,
      call_acks => cal_Next_program_cnt_call_acks,
      return_reqs => cal_Next_program_cnt_return_reqs,
      return_acks => cal_Next_program_cnt_return_acks,
      call_data  => cal_Next_program_cnt_call_data,
      call_tag  => cal_Next_program_cnt_call_tag,
      return_tag  => cal_Next_program_cnt_return_tag,
      call_mtag => cal_Next_program_cnt_tag_in,
      return_mtag => cal_Next_program_cnt_tag_out,
      return_data =>cal_Next_program_cnt_return_data,
      call_mreq => cal_Next_program_cnt_start_req,
      call_mack => cal_Next_program_cnt_start_ack,
      return_mreq => cal_Next_program_cnt_fin_req,
      return_mack => cal_Next_program_cnt_fin_ack,
      call_mdata => cal_Next_program_cnt_in_args,
      return_mdata => cal_Next_program_cnt_out_args,
      clk => clk, 
      reset => reset --
    ); --
  cal_Next_program_cnt_instance:cal_Next_program_cnt-- 
    generic map(tag_length => 2)
    port map(-- 
      opcode => cal_Next_program_cnt_opcode,
      rd1 => cal_Next_program_cnt_rd1,
      rd2 => cal_Next_program_cnt_rd2,
      program_cnt => cal_Next_program_cnt_program_cnt,
      is_rs1_neg => cal_Next_program_cnt_is_rs1_neg,
      n_program_cnt => cal_Next_program_cnt_n_program_cnt,
      start_req => cal_Next_program_cnt_start_req,
      start_ack => cal_Next_program_cnt_start_ack,
      fin_req => cal_Next_program_cnt_fin_req,
      fin_ack => cal_Next_program_cnt_fin_ack,
      clk => clk,
      reset => reset,
      tag_in => cal_Next_program_cnt_tag_in,
      tag_out => cal_Next_program_cnt_tag_out-- 
    ); -- 
  -- module memory_daemon
  memory_daemon_instance:memory_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => memory_daemon_start_req,
      start_ack => memory_daemon_start_ack,
      fin_req => memory_daemon_fin_req,
      fin_ack => memory_daemon_fin_ack,
      clk => clk,
      reset => reset,
      mem_in_pipe_read_req => mem_in_pipe_read_req(0 downto 0),
      mem_in_pipe_read_ack => mem_in_pipe_read_ack(0 downto 0),
      mem_in_pipe_read_data => mem_in_pipe_read_data(63 downto 0),
      mem_out_pipe_write_req => mem_out_pipe_write_req(0 downto 0),
      mem_out_pipe_write_ack => mem_out_pipe_write_ack(0 downto 0),
      mem_out_pipe_write_data => mem_out_pipe_write_data(31 downto 0),
      tag_in => memory_daemon_tag_in,
      tag_out => memory_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  memory_daemon_tag_in <= (others => '0');
  memory_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => memory_daemon_start_req, start_ack => memory_daemon_start_ack,  fin_req => memory_daemon_fin_req,  fin_ack => memory_daemon_fin_ack);
  -- module processor
  processor_instance:processor-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => processor_start_req,
      start_ack => processor_start_ack,
      fin_req => processor_fin_req,
      fin_ack => processor_fin_ack,
      clk => clk,
      reset => reset,
      mem_out_pipe_read_req => mem_out_pipe_read_req(0 downto 0),
      mem_out_pipe_read_ack => mem_out_pipe_read_ack(0 downto 0),
      mem_out_pipe_read_data => mem_out_pipe_read_data(31 downto 0),
      start_processor => start_processor,
      mem_in_pipe_write_req => mem_in_pipe_write_req(0 downto 0),
      mem_in_pipe_write_ack => mem_in_pipe_write_ack(0 downto 0),
      mem_in_pipe_write_data => mem_in_pipe_write_data(63 downto 0),
      cal_Next_program_cnt_call_reqs => cal_Next_program_cnt_call_reqs(0 downto 0),
      cal_Next_program_cnt_call_acks => cal_Next_program_cnt_call_acks(0 downto 0),
      cal_Next_program_cnt_call_data => cal_Next_program_cnt_call_data(80 downto 0),
      cal_Next_program_cnt_call_tag => cal_Next_program_cnt_call_tag(0 downto 0),
      cal_Next_program_cnt_return_reqs => cal_Next_program_cnt_return_reqs(0 downto 0),
      cal_Next_program_cnt_return_acks => cal_Next_program_cnt_return_acks(0 downto 0),
      cal_Next_program_cnt_return_data => cal_Next_program_cnt_return_data(7 downto 0),
      cal_Next_program_cnt_return_tag => cal_Next_program_cnt_return_tag(0 downto 0),
      registerFileModule_call_reqs => registerFileModule_call_reqs(0 downto 0),
      registerFileModule_call_acks => registerFileModule_call_acks(0 downto 0),
      registerFileModule_call_data => registerFileModule_call_data(58 downto 0),
      registerFileModule_call_tag => registerFileModule_call_tag(1 downto 0),
      registerFileModule_return_reqs => registerFileModule_return_reqs(0 downto 0),
      registerFileModule_return_acks => registerFileModule_return_acks(0 downto 0),
      registerFileModule_return_data => registerFileModule_return_data(63 downto 0),
      registerFileModule_return_tag => registerFileModule_return_tag(1 downto 0),
      receive_from_uart_call_reqs => receive_from_uart_call_reqs(0 downto 0),
      receive_from_uart_call_acks => receive_from_uart_call_acks(0 downto 0),
      receive_from_uart_call_tag => receive_from_uart_call_tag(0 downto 0),
      receive_from_uart_return_reqs => receive_from_uart_return_reqs(0 downto 0),
      receive_from_uart_return_acks => receive_from_uart_return_acks(0 downto 0),
      receive_from_uart_return_data => receive_from_uart_return_data(31 downto 0),
      receive_from_uart_return_tag => receive_from_uart_return_tag(0 downto 0),
      send_to_uart_call_reqs => send_to_uart_call_reqs(0 downto 0),
      send_to_uart_call_acks => send_to_uart_call_acks(0 downto 0),
      send_to_uart_call_data => send_to_uart_call_data(31 downto 0),
      send_to_uart_call_tag => send_to_uart_call_tag(0 downto 0),
      send_to_uart_return_reqs => send_to_uart_return_reqs(0 downto 0),
      send_to_uart_return_acks => send_to_uart_return_acks(0 downto 0),
      send_to_uart_return_tag => send_to_uart_return_tag(0 downto 0),
      tag_in => processor_tag_in,
      tag_out => processor_tag_out-- 
    ); -- 
  -- module will be run forever 
  processor_tag_in <= (others => '0');
  processor_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => processor_start_req, start_ack => processor_start_ack,  fin_req => processor_fin_req,  fin_ack => processor_fin_ack);
  -- module receive_from_uart
  receive_from_uart_out_args <= receive_from_uart_receive_data_from_uart ;
  -- call arbiter for module receive_from_uart
  receive_from_uart_arbiter: SplitCallArbiterNoInargs -- 
    generic map( --
      name => "SplitCallArbiterNoInargs", num_reqs => 1,
      return_data_width => 32,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => receive_from_uart_call_reqs,
      call_acks => receive_from_uart_call_acks,
      return_reqs => receive_from_uart_return_reqs,
      return_acks => receive_from_uart_return_acks,
      call_tag  => receive_from_uart_call_tag,
      return_tag  => receive_from_uart_return_tag,
      call_mtag => receive_from_uart_tag_in,
      return_mtag => receive_from_uart_tag_out,
      return_data =>receive_from_uart_return_data,
      call_mreq => receive_from_uart_start_req,
      call_mack => receive_from_uart_start_ack,
      return_mreq => receive_from_uart_fin_req,
      return_mack => receive_from_uart_fin_ack,
      return_mdata => receive_from_uart_out_args,
      clk => clk, 
      reset => reset --
    ); --
  receive_from_uart_instance:receive_from_uart-- 
    generic map(tag_length => 2)
    port map(-- 
      receive_data_from_uart => receive_from_uart_receive_data_from_uart,
      start_req => receive_from_uart_start_req,
      start_ack => receive_from_uart_start_ack,
      fin_req => receive_from_uart_fin_req,
      fin_ack => receive_from_uart_fin_ack,
      clk => clk,
      reset => reset,
      in_pipe_pipe_read_req => in_pipe_pipe_read_req(0 downto 0),
      in_pipe_pipe_read_ack => in_pipe_pipe_read_ack(0 downto 0),
      in_pipe_pipe_read_data => in_pipe_pipe_read_data(7 downto 0),
      tag_in => receive_from_uart_tag_in,
      tag_out => receive_from_uart_tag_out-- 
    ); -- 
  -- module registerFileModule
  registerFileModule_valid_1 <= registerFileModule_in_args(58 downto 58);
  registerFileModule_addr_1 <= registerFileModule_in_args(57 downto 50);
  registerFileModule_valid_2 <= registerFileModule_in_args(49 downto 49);
  registerFileModule_addr_2 <= registerFileModule_in_args(48 downto 41);
  registerFileModule_valid_w <= registerFileModule_in_args(40 downto 40);
  registerFileModule_addr_w <= registerFileModule_in_args(39 downto 32);
  registerFileModule_data_to_be_written <= registerFileModule_in_args(31 downto 0);
  registerFileModule_out_args <= registerFileModule_read_data_1 & registerFileModule_read_data_2 ;
  -- call arbiter for module registerFileModule
  registerFileModule_arbiter: SplitCallArbiter -- 
    generic map( --
      name => "SplitCallArbiter", num_reqs => 1,
      call_data_width => 59,
      return_data_width => 64,
      callee_tag_length => 1,
      caller_tag_length => 2--
    )
    port map(-- 
      call_reqs => registerFileModule_call_reqs,
      call_acks => registerFileModule_call_acks,
      return_reqs => registerFileModule_return_reqs,
      return_acks => registerFileModule_return_acks,
      call_data  => registerFileModule_call_data,
      call_tag  => registerFileModule_call_tag,
      return_tag  => registerFileModule_return_tag,
      call_mtag => registerFileModule_tag_in,
      return_mtag => registerFileModule_tag_out,
      return_data =>registerFileModule_return_data,
      call_mreq => registerFileModule_start_req,
      call_mack => registerFileModule_start_ack,
      return_mreq => registerFileModule_fin_req,
      return_mack => registerFileModule_fin_ack,
      call_mdata => registerFileModule_in_args,
      return_mdata => registerFileModule_out_args,
      clk => clk, 
      reset => reset --
    ); --
  registerFileModule_instance:registerFileModule-- 
    generic map(tag_length => 3)
    port map(-- 
      valid_1 => registerFileModule_valid_1,
      addr_1 => registerFileModule_addr_1,
      valid_2 => registerFileModule_valid_2,
      addr_2 => registerFileModule_addr_2,
      valid_w => registerFileModule_valid_w,
      addr_w => registerFileModule_addr_w,
      data_to_be_written => registerFileModule_data_to_be_written,
      read_data_1 => registerFileModule_read_data_1,
      read_data_2 => registerFileModule_read_data_2,
      start_req => registerFileModule_start_req,
      start_ack => registerFileModule_start_ack,
      fin_req => registerFileModule_fin_req,
      fin_ack => registerFileModule_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_0_lr_req => memory_space_0_lr_req(0 downto 0),
      memory_space_0_lr_ack => memory_space_0_lr_ack(0 downto 0),
      memory_space_0_lr_addr => memory_space_0_lr_addr(5 downto 0),
      memory_space_0_lr_tag => memory_space_0_lr_tag(18 downto 0),
      memory_space_0_lc_req => memory_space_0_lc_req(0 downto 0),
      memory_space_0_lc_ack => memory_space_0_lc_ack(0 downto 0),
      memory_space_0_lc_data => memory_space_0_lc_data(31 downto 0),
      memory_space_0_lc_tag => memory_space_0_lc_tag(1 downto 0),
      memory_space_0_sr_req => memory_space_0_sr_req(0 downto 0),
      memory_space_0_sr_ack => memory_space_0_sr_ack(0 downto 0),
      memory_space_0_sr_addr => memory_space_0_sr_addr(5 downto 0),
      memory_space_0_sr_data => memory_space_0_sr_data(31 downto 0),
      memory_space_0_sr_tag => memory_space_0_sr_tag(18 downto 0),
      memory_space_0_sc_req => memory_space_0_sc_req(0 downto 0),
      memory_space_0_sc_ack => memory_space_0_sc_ack(0 downto 0),
      memory_space_0_sc_tag => memory_space_0_sc_tag(1 downto 0),
      tag_in => registerFileModule_tag_in,
      tag_out => registerFileModule_tag_out-- 
    ); -- 
  -- module send_to_uart
  send_to_uart_data_to_send <= send_to_uart_in_args(31 downto 0);
  -- call arbiter for module send_to_uart
  send_to_uart_arbiter: SplitCallArbiterNoOutargs -- 
    generic map( --
      name => "SplitCallArbiterNoOutargs", num_reqs => 1,
      call_data_width => 32,
      callee_tag_length => 1,
      caller_tag_length => 1--
    )
    port map(-- 
      call_reqs => send_to_uart_call_reqs,
      call_acks => send_to_uart_call_acks,
      return_reqs => send_to_uart_return_reqs,
      return_acks => send_to_uart_return_acks,
      call_data  => send_to_uart_call_data,
      call_tag  => send_to_uart_call_tag,
      return_tag  => send_to_uart_return_tag,
      call_mtag => send_to_uart_tag_in,
      return_mtag => send_to_uart_tag_out,
      call_mreq => send_to_uart_start_req,
      call_mack => send_to_uart_start_ack,
      return_mreq => send_to_uart_fin_req,
      return_mack => send_to_uart_fin_ack,
      call_mdata => send_to_uart_in_args,
      clk => clk, 
      reset => reset --
    ); --
  send_to_uart_instance:send_to_uart-- 
    generic map(tag_length => 2)
    port map(-- 
      data_to_send => send_to_uart_data_to_send,
      start_req => send_to_uart_start_req,
      start_ack => send_to_uart_start_ack,
      fin_req => send_to_uart_fin_req,
      fin_ack => send_to_uart_fin_ack,
      clk => clk,
      reset => reset,
      out_pipe_pipe_write_req => out_pipe_pipe_write_req(0 downto 0),
      out_pipe_pipe_write_ack => out_pipe_pipe_write_ack(0 downto 0),
      out_pipe_pipe_write_data => out_pipe_pipe_write_data(7 downto 0),
      tag_in => send_to_uart_tag_in,
      tag_out => send_to_uart_tag_out-- 
    ); -- 
  in_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 32 --
    )
    port map( -- 
      read_req => in_pipe_pipe_read_req,
      read_ack => in_pipe_pipe_read_ack,
      read_data => in_pipe_pipe_read_data,
      write_req => in_pipe_pipe_write_req,
      write_ack => in_pipe_pipe_write_ack,
      write_data => in_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  mem_in_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe mem_in",
      num_reads => 1,
      num_writes => 1,
      data_width => 64,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 8 --
    )
    port map( -- 
      read_req => mem_in_pipe_read_req,
      read_ack => mem_in_pipe_read_ack,
      read_data => mem_in_pipe_read_data,
      write_req => mem_in_pipe_write_req,
      write_ack => mem_in_pipe_write_ack,
      write_data => mem_in_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  mem_out_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe mem_out",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 8 --
    )
    port map( -- 
      read_req => mem_out_pipe_read_req,
      read_ack => mem_out_pipe_read_ack,
      read_data => mem_out_pipe_read_data,
      write_req => mem_out_pipe_write_req,
      write_ack => mem_out_pipe_write_ack,
      write_data => mem_out_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 8,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 8 --
    )
    port map( -- 
      read_req => out_pipe_pipe_read_req,
      read_ack => out_pipe_pipe_read_ack,
      read_data => out_pipe_pipe_read_data,
      write_req => out_pipe_pipe_write_req,
      write_ack => out_pipe_pipe_write_ack,
      write_data => out_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- input signal-pipe start_processor accessed directly. 
  MemorySpace_memory_space_0: ordered_memory_subsystem -- 
    generic map(-- 
      name => "memory_space_0",
      num_loads => 1,
      num_stores => 1,
      addr_width => 6,
      data_width => 32,
      tag_width => 2,
      time_stamp_width => 17,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 6,
      base_bank_data_width => 32
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_0_lr_addr,
      lr_req_in => memory_space_0_lr_req,
      lr_ack_out => memory_space_0_lr_ack,
      lr_tag_in => memory_space_0_lr_tag,
      lc_req_in => memory_space_0_lc_req,
      lc_ack_out => memory_space_0_lc_ack,
      lc_data_out => memory_space_0_lc_data,
      lc_tag_out => memory_space_0_lc_tag,
      sr_addr_in => memory_space_0_sr_addr,
      sr_data_in => memory_space_0_sr_data,
      sr_req_in => memory_space_0_sr_req,
      sr_ack_out => memory_space_0_sr_ack,
      sr_tag_in => memory_space_0_sr_tag,
      sc_req_in=> memory_space_0_sc_req,
      sc_ack_out => memory_space_0_sc_ack,
      sc_tag_out => memory_space_0_sc_tag,
      clock => clk,
      reset => reset); -- 
  -- 
end ahir_system_arch;
