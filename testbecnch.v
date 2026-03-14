`timescale 1ns/1ps

module password_checker_tb;

reg clk;
reg reset;
reg enter;
reg [3:0] password;

wire open_lock;

// Instantiate the DUT (Device Under Test)
password_checker uut (
    .clk(clk),
    .reset(reset),
    .open_lock(open_lock),
    .password(password),
    .enter(enter)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin

    // Initialize signals
    clk = 0;
    reset = 1;
    enter = 0;
    password = 4'b0000;

    // Apply reset
    #10 reset = 0;

    // Test Case 1 : Wrong password
    #10
    enter = 1;
    password = 4'b1010;

    #10
    enter = 0;

    // Wait
    #20;

    // Test Case 2 : Correct password (stored = 0011)
    #10
    enter = 1;
    password = 4'b0011;

    #10
    enter = 0;

    // Wait and observe
    #40;

    // Finish simulation
    $finish;

end

// Monitor signals
initial begin
    $monitor("Time=%0t | enter=%b | password=%b | open_lock=%b",
              $time, enter, password, open_lock);
end

endmodule
