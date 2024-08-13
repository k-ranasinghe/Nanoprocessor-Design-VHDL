----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 02:48:05 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR(2 downto 0);
           Res, Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    component D_FF
    port (
        D : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC );
    end component;
    
    component Slow_Clk
    port (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC );
    end component;
    
    signal QD : std_logic_vector(2 downto 0);
    signal Clk_slow : std_logic;
begin
    Slow_Clk0 : Slow_Clk
    port map (
        Clk_in => Clk,
        Clk_out => Clk_slow );
    
    D_FF0 : D_FF
        port map (
            D => D(0),
            Res => Res,
            Clk => Clk_slow,
            Q => QD(0) );  
            
    D_FF1 : D_FF
        port map (
            D => D(1),
            Res => Res,
            Clk => Clk_slow,
            Q => QD(1) ); 
            
    D_FF2 : D_FF
        port map (
            D => D(2),
            Res => Res,
            Clk => Clk_slow,
            Q => QD(2) );   
            
    Q <= QD;


end Behavioral;
