----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 07:53:02 AM
-- Design Name: 
-- Module Name: RegisterBankSim - Behavioral
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

entity RegisterBankSim is
--  Port ( );
end RegisterBankSim;

architecture Behavioral of RegisterBankSim is
COMPONENT RegisterBank
    PORT( D : IN STD_LOGIC_VECTOR(3 downto 0);
          RegSel : IN STD_LOGIC_VECTOR(2 downto 0);
          Res, Clk : IN STD_LOGIC;
          R0, R1, R2, R3, R4, R5, R6, R7 : OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

SIGNAL D : std_logic_vector(3 downto 0);
SIGNAL RegSel : std_logic_vector(2 downto 0);
SIGNAL Res, Clk : std_logic;
SIGNAL R0, R1, R2, R3, R4, R5, R6, R7 :std_logic_vector(3 downto 0) := "0000";

begin
    
UUT : RegisterBank PORT MAP(
    D => D,
    RegSel => RegSel,
    Res => Res,
    Clk => Clk,
    R0 => R0,
    R1 => R1,
    R2 => R2,
    R3 => R3,
    R4 => R4,
    R5 => R5,
    R6 => R6,
    R7 => R7
);

Clock : process
begin
    Clk <= '0';
    WAIT FOR 1 ns;
    
    Clk <= '1';
    WAIT FOR 1 ns;
end process;

--INPUT SIGNAL = 100MHz (10 ns)
--SLOW CLOCK COUNT = 500 000 000  == 50_000_000
--SLOW CLOCK SIM = WAIT FOR 1 ns
--OUTPUT SIGNAL = 0.2Hz (2 s)

process
begin

    Res <= '1';
    WAIT FOR 5 ms;
    
    Res <= '0';
    D <= "0001";
    RegSel <= "000";
    WAIT FOR 5 ms;
    
    RegSel <= "001";
    WAIT FOR 5 ms;   
    
    RegSel <= "010";
    WAIT FOR 5 ms;
    
    RegSel <= "011";
    WAIT FOR 5 ms;
    
    RegSel <= "100";
    WAIT FOR 5 ms;
    
    RegSel <= "101";
    WAIT FOR 5 ms;
    
    RegSel <= "110";
    WAIT FOR 5 ms;
    
    RegSel <= "111";
    WAIT FOR 5 ms;
    
    Res <= '1';
    RegSel <= "000";
    WAIT FOR 5 ms;
    
    RegSel <= "001";
    WAIT FOR 5 ms;   
    
    RegSel <= "010";
    WAIT FOR 5 ms;
    
    RegSel <= "011";
    WAIT FOR 5 ms;
    
    RegSel <= "100";
    WAIT FOR 5 ms;
    
    RegSel <= "101";
    WAIT FOR 5 ms;
    
    RegSel <= "110";
    WAIT FOR 5 ms;
    
    RegSel <= "111";
    WAIT FOR 5 ms;

-- Index Number: 210518H => 11  0011 0110  0101 0110
-- Index Number: 210170G => 11  0011 0100  1111 1010
   
    Res <= '0';
    D <= "0110";
    RegSel <= "000";
    WAIT FOR 5 ms;
    
    D <= "0101";
    RegSel <= "001";
    WAIT FOR 5 ms;
    
    D <= "0110";
    RegSel <= "010";
    WAIT FOR 5 ms;
    
    D <= "0011";
    RegSel <= "011";
    WAIT FOR 5 ms;    

    Res <= '0';
    D <= "1010";
    RegSel <= "100";
    WAIT FOR 5 ms;
    
    D <= "1111";
    RegSel <= "101";
    WAIT FOR 5 ms;
    
    D <= "0100";
    RegSel <= "110";
    WAIT FOR 5 ms;
    
    D <= "0011";
    RegSel <= "111";
    WAIT;
    
end process;    
end Behavioral;
