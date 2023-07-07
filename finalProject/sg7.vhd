library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7 is
    Port ( waterState: in STD_LOGIC_VECTOR (3 downto 0);
           segment7 : out STD_LOGIC_VECTOR (6 downto 0) ); 
end Seg7;

architecture Behavioral of Seg7 is

begin

 myproc: process (waterState)
    begin
    
               if (waterState = "1111") then      
                   segment7 <= "1110110";  -- 'H'
          
               else           
                   segment7 <= "1000000"; -- dash
                       
               end if;

    end process;
            
end Behavioral;
