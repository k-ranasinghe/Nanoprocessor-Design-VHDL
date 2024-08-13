----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 12:11:57 PM
-- Design Name: 
-- Module Name: ProgramROMSim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramROMSim is
--  Port ( );
end ProgramROMSim;

architecture Behavioral of ProgramROMSim is
COMPONENT ProgramROM
    PORT( Sel : IN STD_LOGIC_VECTOR(2 downto 0);
          I : OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
END COMPONENT;

SIGNAL Sel : std_logic_vector(2 downto 0);
SIGNAL I : std_logic_vector(11 downto 0);

begin
UUT : ProgramROM PORT MAP(
    Sel => Sel,
    I => I );
process
begin
    -- Index Number: 210518H => 110 011 011 001 010 110
    Sel <= "110";
    WAIT FOR 5 ms;
    
    Sel <= "010";
    WAIT FOR 5 ms;
    
    Sel <= "001";
    WAIT FOR 5 ms;
    
    Sel <= "011";
    WAIT FOR 5 ms;
    
    -- Index Number: 210170G => 110 011 010 011 111 010
    Sel <= "010";
    WAIT FOR 5 ms;
    
    Sel <= "111";
    WAIT FOR 5 ms;
    
    Sel <= "011";
    WAIT FOR 5 ms;
    
    Sel <= "010";
    WAIT FOR 5 ms;
end process;
end Behavioral;
