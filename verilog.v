module password_checker(clk ,reset,open_lock,password,enter);
  input clk,reset,enter;
  input [3:0]password;
  output reg open_lock;
  parameter
    IDLE=2'b00,
    check_password=2'b01,
    error=2'b10,
    open=2'b11;
  reg[3:0]stored_password;
  reg[1:0]state,next_state;
  always@(posedge clk or posedge reset)
  begin
    if(reset)
    begin
      state<=IDLE;
      stored_password<=4'b0011;
    end
    else
    begin
      state<=next_state;
    end
  end
  always@(*)
  begin
    case(state)
      IDLE:
      begin
        if(!enter)
          next_state=IDLE;
        else
        begin
          next_state=check_password;
          open_lock=1'b0;
        end
      end
      check_password:
      begin
        if(stored_password==password)
          next_state=open;
        else
          next_state=error;
      end
      error:
      begin
        next_state=IDLE;
      end
      open:
      begin
        next_state=IDLE;
        open_lock=1'b1;
      end
    endcase
  end
endmodule
