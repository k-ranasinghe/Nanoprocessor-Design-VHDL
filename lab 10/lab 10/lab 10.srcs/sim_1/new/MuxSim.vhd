----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 05:31:14 PM
-- Design Name: 
-- Module Name: MuxSim - Behavioral
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

entity MuxSim is
--  Port ( );
end MuxSim;

architecture Behavioral of MuxSim is

COMPONENT Mux_8way_4bit
    PORT( Clk : IN STD_LOGIC;
          Sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          A,B,C,D,E,F,G,H : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

SIGNAL Clk : std_logic;
SIGNAL Sel : std_logic_vector(2 downto 0);
SIGNAL A,B,C,D,E,F,G,H,Y : std_logic_vector(3 downto 0);

begin
UUT : Mux_8way_4bit PORT MAP(
    Sel => Sel,
    Clk => Clk,
    A => A,
    B => B,
    C => C,
    D => D,
    E => E,
    F => F,
    G => G,
    H => H,
    Y => Y );
    
Clock : process
begin
    Clk <= '0';
    WAIT FOR 1 ns;
    
    Clk <= '1';
    WAIT FOR 1 ns;
end process;

process
begin

    Sel <= "000";
    A <= "0110";
    B <= "1001";
    C <= "1010";
    D <= "0101";
    E <= "0110";
    F <= "1101";
    G <= "1110";
    H <= "1111";
    WAIT FOR 50 ns;
    
    -- Index Number: 210518H => 110 011 011 001 010 110
    
    Sel <= "110";
    WAIT FOR 50 ns;
    
    Sel <= "010";
    WAIT FOR 50 ns;
    
    Sel <= "001";
    WAIT FOR 50 ns;
    
    Sel <= "011";
    WAIT FOR 50 ns;
    
    Sel <= "011";
    WAIT FOR 50 ns;
    
    Sel <= "110";
    WAIT FOR 50 ns;
    
    -- Index Number: 210170G => 110 011 010 011 111 010
    
    Sel <= "010";
    WAIT FOR 50 ns;
    
    Sel <= "111";
    WAIT FOR 50 ns;
    
    Sel <= "011";
    WAIT FOR 50 ns;
    
    Sel <= "010";
    WAIT FOR 50 ns;
    
    Sel <= "011";
    WAIT FOR 50 ns;
    
    Sel <= "110";
    WAIT FOR 50 ns;
    
end process;
end Behavioral;
