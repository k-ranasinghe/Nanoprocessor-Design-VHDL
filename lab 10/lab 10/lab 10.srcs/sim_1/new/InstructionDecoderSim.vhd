----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:08:35 PM
-- Design Name: 
-- Module Name: InstructionDecoderSim - Behavioral
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

entity InstructionDecoderSim is
--  Port ( );
end InstructionDecoderSim;

architecture Behavioral of InstructionDecoderSim is
COMPONENT InstructionDecoder
    PORT( JumpCheck : in STD_LOGIC;
          A : IN STD_LOGIC_VECTOR(11 downto 0);
          Reg1, Reg2, Jump : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          LoadSel, OpSel, Jflag : out STD_LOGIC;
          Val : out STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

SIGNAL JumpCheck : std_logic;
SIGNAL A : std_logic_vector(11 downto 0);
SIGNAL Reg1, Reg2, Jump : std_logic_vector(2 downto 0);
SIGNAL LoadSel, OpSel, Jflag : std_logic;
SIGNAL Val : std_logic_vector(3 downto 0);

begin
UUT : InstructionDecoder PORT MAP(
    JumpCheck => JumpCheck,
    A => A,
    Reg1 => Reg1,
    Reg2 => Reg2,
    Jump => Jump,
    LoadSel => LoadSel,
    OpSel => OpSel,
    Jflag => Jflag,
    Val => Val );

process
begin

-- Index Number: 210518H => 11  0011 0110  0101 0110
-- Index Number: 210170G => 11  0011 0100  1111 1010

    JumpCheck <= '0';
    A <= "011001010110";
    WAIT FOR 5 ms;
    
    A <= "001101100101";
    WAIT FOR 5 ms;
    
    A <= "110011011001";
    WAIT FOR 5 ms;
    
    JumpCheck <= '1';
    WAIT FOR 5 ms;
    
    A <= "010011111010";
    WAIT FOR 5 ms;
    
    A <= "001101001111";
    WAIT FOR 5 ms;
    
    A <= "110011010011";
    WAIT FOR 5 ms;
    
    JumpCheck <= '0';
    WAIT FOR 5 ms;

end process;
end Behavioral;
