----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 02:01:29 PM
-- Design Name: 
-- Module Name: Adder3BitSim - Behavioral
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

entity Adder3BitSim is
--  Port ( );
end Adder3BitSim;

architecture Behavioral of Adder3BitSim is
COMPONENT Adder3Bit
    PORT( A : IN STD_LOGIC_VECTOR(2 downto 0);
          S : OUT STD_LOGIC_VECTOR(2 downto 0));
END COMPONENT;

SIGNAL A : std_logic_vector(2 downto 0);
SIGNAL S :std_logic_vector(2 downto 0);

begin
UUT : Adder3Bit PORT MAP(
    A => A,
    S => S
);
process
begin
    A <= "000";
  
    WAIT FOR 100 ns;
    A <= "001";

    WAIT FOR 100 ns;
    A <= "010";

    WAIT FOR 100 ns;
    A <= "011";
    
    WAIT FOR 100 ns;
    A <= "100";  
    
    WAIT FOR 100 ns;
    A <= "101"; 
    
    WAIT FOR 100 ns;
    A <= "110";
    
    WAIT FOR 100 ns;
    A <= "111"; 
    
-- Index Number: 210518H => 110 011 011 001 010 110
-- Index Number: 210170G => 110 011 010 011 111 010

    WAIT FOR 100 ns;
    A <= "110";

    WAIT FOR 100 ns;
    A <= "010";

    WAIT FOR 100 ns;
    A <= "001";
    
    WAIT FOR 100 ns;
    A <= "011";  
    
    WAIT FOR 100 ns;
    A <= "011"; 
    
    WAIT FOR 100 ns;
    A <= "110";
    
    WAIT FOR 100 ns;
    A <= "010";

    WAIT FOR 100 ns;
    A <= "111";
    
    WAIT FOR 100 ns;
    A <= "011";  
    
    WAIT FOR 100 ns;
    A <= "010"; 
    
    WAIT FOR 100 ns;
    A <= "011";
    
    WAIT FOR 100 ns;
    A <= "110";    
            
    WAIT;
end process;
end Behavioral;
