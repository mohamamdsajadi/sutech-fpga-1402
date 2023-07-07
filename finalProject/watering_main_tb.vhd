library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
entity my_fsm_tb is
end;
architecture bench of my_fsm_tb is
 component my_fsm
    port (T, L, CLK, RESET : in std_logic;
                 M : in std_logic_vector (2 downto 0);
                       --fsm_situation : out std_logic_vector(1 downto 0);
                      segments : out std_logic_vector (6 downto 0);
                      fsm_output :   out std_logic);
  end component;
  signal T, L, CLK, RESET: std_logic;
  signal M: std_logic_vector (2 downto 0);
 -- signal fsm_situation: std_logic_vector(1 downto 0);
  signal segments: std_logic_vector (6 downto 0);
  signal fsm_output: std_logic;

 
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin
  uut: my_fsm port map ( T             => T,
                         L             => L,
                         CLK           => CLK,
                         RESET         => RESET,
                         M             => M,
                         --fsm_situation => fsm_situation,
                         segments      => segments,
                         fsm_output    => fsm_output );
  stimulus: process
  begin

 T <= '0';
    L <= '0';
    M <= "110";
    wait for 20 ns;

    T <= '0';
    L <= '0';
    M <= "001";
    wait for 20 ns;

    T <= '1';
    L <= '0';
    M <= "001";
    wait for 20 ns;

    T <= '0';
    L <= '1';
    M <= "101";
    wait for 20 ns;

    T <= '0';
    L <= '0';
    M <= "101";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "111";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "001";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "011";
    wait for 20 ns;
------------------------     
      
     
    stop_the_clock <= true;
    wait;
  end process;
  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;
end;
