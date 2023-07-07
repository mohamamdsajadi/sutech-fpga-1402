library IEEE;
use IEEE.Std_logic_1164.all;

package WATERING is
  component my_fsm is
        port (T, L, CLK, RESET : in std_logic;
               M : in std_logic_vector (2 downto 0);
                    segments : out std_logic_vector (6 downto 0);
                    fsm_output :   out std_logic);
  end component my_fsm;

  component Seg7 is
     Port ( waterState: in STD_LOGIC_VECTOR (3 downto 0);
           segment7 : out STD_LOGIC_VECTOR (6 downto 0) ); 
  end component Seg7;

 subtype state_type is std_logic_vector(1 downto 0);

 CONSTANT ST0 : state_type := "00" ;
 CONSTANT ST1 : state_type := "01" ;
 CONSTANT ST2 : state_type := "11" ;

end package WATERING ;