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
library GhdlLink;
use GhdlLink.LogUtilities.all;
library work;
use work.ahir_system_global_package.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity ahir_system_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of ahir_system_Test_Bench is -- 
  component ahir_system is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      accessMem_request_pipe_write_data: in std_logic_vector(63 downto 0);
      accessMem_request_pipe_write_req : in std_logic_vector(0 downto 0);
      accessMem_request_pipe_write_ack : out std_logic_vector(0 downto 0);
      accessMem_response_pipe_read_data: out std_logic_vector(31 downto 0);
      accessMem_response_pipe_read_req : in std_logic_vector(0 downto 0);
      accessMem_response_pipe_read_ack : out std_logic_vector(0 downto 0);
      accessReg_request_pipe_write_data: in std_logic_vector(63 downto 0);
      accessReg_request_pipe_write_req : in std_logic_vector(0 downto 0);
      accessReg_request_pipe_write_ack : out std_logic_vector(0 downto 0);
      accessReg_response1_pipe_read_data: out std_logic_vector(31 downto 0);
      accessReg_response1_pipe_read_req : in std_logic_vector(0 downto 0);
      accessReg_response1_pipe_read_ack : out std_logic_vector(0 downto 0);
      accessReg_response2_pipe_read_data: out std_logic_vector(31 downto 0);
      accessReg_response2_pipe_read_req : in std_logic_vector(0 downto 0);
      accessReg_response2_pipe_read_ack : out std_logic_vector(0 downto 0);
      processor_result_pipe_read_data: out std_logic_vector(31 downto 0);
      processor_result_pipe_read_req : in std_logic_vector(0 downto 0);
      processor_result_pipe_read_ack : out std_logic_vector(0 downto 0);
      start_processor_pipe_write_data: in std_logic_vector(7 downto 0);
      start_processor_pipe_write_req : in std_logic_vector(0 downto 0);
      start_processor_pipe_write_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal memAccessDaemon_tag_in: std_logic_vector(1 downto 0);
  signal memAccessDaemon_tag_out: std_logic_vector(1 downto 0);
  signal memAccessDaemon_start_req : std_logic := '0';
  signal memAccessDaemon_start_ack : std_logic := '0';
  signal memAccessDaemon_fin_req   : std_logic := '0';
  signal memAccessDaemon_fin_ack   : std_logic := '0';
  signal processor_daemon_tag_in: std_logic_vector(1 downto 0);
  signal processor_daemon_tag_out: std_logic_vector(1 downto 0);
  signal processor_daemon_start_req : std_logic := '0';
  signal processor_daemon_start_ack : std_logic := '0';
  signal processor_daemon_fin_req   : std_logic := '0';
  signal processor_daemon_fin_ack   : std_logic := '0';
  signal regAccessDaemon_tag_in: std_logic_vector(1 downto 0);
  signal regAccessDaemon_tag_out: std_logic_vector(1 downto 0);
  signal regAccessDaemon_start_req : std_logic := '0';
  signal regAccessDaemon_start_ack : std_logic := '0';
  signal regAccessDaemon_fin_req   : std_logic := '0';
  signal regAccessDaemon_fin_ack   : std_logic := '0';
  -- write to pipe accessMem_request
  signal accessMem_request_pipe_write_data: std_logic_vector(63 downto 0);
  signal accessMem_request_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal accessMem_request_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe accessMem_response
  signal accessMem_response_pipe_read_data: std_logic_vector(31 downto 0);
  signal accessMem_response_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal accessMem_response_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe accessReg_request
  signal accessReg_request_pipe_write_data: std_logic_vector(63 downto 0);
  signal accessReg_request_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal accessReg_request_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe accessReg_response1
  signal accessReg_response1_pipe_read_data: std_logic_vector(31 downto 0);
  signal accessReg_response1_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal accessReg_response1_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe accessReg_response2
  signal accessReg_response2_pipe_read_data: std_logic_vector(31 downto 0);
  signal accessReg_response2_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal accessReg_response2_pipe_read_ack : std_logic_vector(0 downto 0);
  -- read from pipe processor_result
  signal processor_result_pipe_read_data: std_logic_vector(31 downto 0);
  signal processor_result_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal processor_result_pipe_read_ack : std_logic_vector(0 downto 0);
  -- write to pipe start_processor
  signal start_processor_pipe_write_data: std_logic_vector(7 downto 0);
  signal start_processor_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal start_processor_pipe_write_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  -- assert reset for four clocks.
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Vhpi_Listen;
      Vhpi_Send;
      --
    end loop;
    wait;
    --
  end process;
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("accessMem_request req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      accessMem_request_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("accessMem_request 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,64);
      accessMem_request_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("accessMem_request ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(accessMem_request_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("accessMem_response req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      accessMem_response_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("accessMem_response ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(accessMem_response_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("accessMem_response 0");
      port_val_string := Pack_SLV_To_Vhpi_String(accessMem_response_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("accessReg_request req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      accessReg_request_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("accessReg_request 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,64);
      accessReg_request_pipe_write_data <= Unpack_String(port_val_string,64);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("accessReg_request ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(accessReg_request_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response1 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      accessReg_response1_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response1 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(accessReg_response1_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response1 0");
      port_val_string := Pack_SLV_To_Vhpi_String(accessReg_response1_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response2 req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      accessReg_response2_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response2 ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(accessReg_response2_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("accessReg_response2 0");
      port_val_string := Pack_SLV_To_Vhpi_String(accessReg_response2_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("processor_result req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      processor_result_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("processor_result ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(processor_result_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("processor_result 0");
      port_val_string := Pack_SLV_To_Vhpi_String(processor_result_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("start_processor req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      start_processor_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("start_processor 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,8);
      start_processor_pipe_write_data <= Unpack_String(port_val_string,8);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("start_processor ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(start_processor_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  ahir_system_instance: ahir_system -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      accessMem_request_pipe_write_data  => accessMem_request_pipe_write_data, 
      accessMem_request_pipe_write_req  => accessMem_request_pipe_write_req, 
      accessMem_request_pipe_write_ack  => accessMem_request_pipe_write_ack,
      accessMem_response_pipe_read_data  => accessMem_response_pipe_read_data, 
      accessMem_response_pipe_read_req  => accessMem_response_pipe_read_req, 
      accessMem_response_pipe_read_ack  => accessMem_response_pipe_read_ack ,
      accessReg_request_pipe_write_data  => accessReg_request_pipe_write_data, 
      accessReg_request_pipe_write_req  => accessReg_request_pipe_write_req, 
      accessReg_request_pipe_write_ack  => accessReg_request_pipe_write_ack,
      accessReg_response1_pipe_read_data  => accessReg_response1_pipe_read_data, 
      accessReg_response1_pipe_read_req  => accessReg_response1_pipe_read_req, 
      accessReg_response1_pipe_read_ack  => accessReg_response1_pipe_read_ack ,
      accessReg_response2_pipe_read_data  => accessReg_response2_pipe_read_data, 
      accessReg_response2_pipe_read_req  => accessReg_response2_pipe_read_req, 
      accessReg_response2_pipe_read_ack  => accessReg_response2_pipe_read_ack ,
      processor_result_pipe_read_data  => processor_result_pipe_read_data, 
      processor_result_pipe_read_req  => processor_result_pipe_read_req, 
      processor_result_pipe_read_ack  => processor_result_pipe_read_ack ,
      start_processor_pipe_write_data  => start_processor_pipe_write_data, 
      start_processor_pipe_write_req  => start_processor_pipe_write_req, 
      start_processor_pipe_write_ack  => start_processor_pipe_write_ack); -- 
  -- 
end VhpiLink;
