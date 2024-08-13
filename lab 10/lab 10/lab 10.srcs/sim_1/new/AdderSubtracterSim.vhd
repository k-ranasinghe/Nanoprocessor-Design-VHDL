----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 05:44:46 AM
-- Design Name: 
-- Module Name: AdderSubtracterSim - Behavioral
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

entity AdderSubtracterSim is
--  Port ( );
end AdderSubtracterSim;

architecture Behavioral of AdderSubtracterSim is
COMPONENT AdderSubtracter
    PORT( A,B : IN STD_LOGIC_VECTOR(3 downto 0);
          C_in, Ctrl : IN STD_LOGIC;
          S : OUT STD_LOGIC_VECTOR(3 downto 0);
          C_out, Zero, Overflow : OUT STD_LOGIC);
END COMPONENT;

SIGNAL A,B : std_logic_vector(3 downto 0);
SIGNAL C_in, Ctrl : std_logic;
SIGNAL S :std_logic_vector(3 downto 0);
SIGNAL C_out,Zero,Overflow : std_logic;

begin
UUT : AdderSubtracter PORT MAP(
    A => A,
    B => B,
    Ctrl => Ctrl,
    C_in => C_in,
    C_out => C_out,
    Zero => Zero,
    Overflow => Overflow,
    S => S
);

process
begin
    A <= "0000";
    B <= "0000";
    C_in <= '0';
    Ctrl <= '0';

-- 0101 + 1011   
    WAIT FOR 100 ns;
    A <= "0101";
    B <= "1011";
    Ctrl <= '1';

-- 0111 + 1111
    WAIT FOR 100 ns;
    A <= "0111";
    B <= "1111";
    Ctrl <= '0';

-- Index Number: 210518H => 11  0011 0110  0101 0110
-- Index Number: 210170G => 11  0011 0100  1111 1010

-- 0110 + 0101   
    WAIT FOR 100 ns;
    A <= "0110";
    B <= "0101";
    Ctrl <= '0';

-- 0110 - 0011
    WAIT FOR 100 ns;
    A <= "0110";
    B <= "0011";
    Ctrl <= '1';

-- 1010 + 1111    
    WAIT FOR 100 ns;
    A <= "1010";
    B <= "1111";
    Ctrl <= '0';

-- 0011 - 0100   
    WAIT FOR 100 ns;
    A <= "0011"; 
    B <= "0100";
    Ctrl <= '1';

-- 0011 + 0011   
    WAIT FOR 100 ns;
    A <= "0011";
    B <= "0011";
    Ctrl <= '0';
        
-- 0110 - 0100   
    WAIT FOR 100 ns;
    A <= "0110";
    B <= "0100";
    Ctrl <= '1';
    
-- 0101 + 1111   
    WAIT FOR 100 ns;
    A <= "0101";
    B <= "1111";
    Ctrl <= '0';
            
-- 0110 - 1010   
    WAIT FOR 100 ns;
    A <= "0110";
    B <= "1010";
    Ctrl <= '1';
                
    WAIT;
end process;

end Behavioral;