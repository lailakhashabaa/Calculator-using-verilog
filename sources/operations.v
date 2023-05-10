module operations(
input clk,
input [4:0] operation,
input reset,
input [3:0] dig1, dig2, dig3, dig4,
output reg [13:0] result,
output reg  negative_sign,
output reg dot
    );
  
    reg [7:0] num1, num2;
    
    always @(posedge clk) begin
    
        if (reset == 1) begin
            num1 = 0;
            num2 = 0;
            
        end
        else begin
            num1 = (dig1 * 10) + dig2;
            num2 = (dig3 * 10) + dig4;
            
        end
    
    end
    
    always @(posedge (clk))
     begin
    
        if (reset == 1) begin
            result <= 16'b0;
             negative_sign <= 0;
             dot<=0;
             
        end
        
        else if (operation[0] == 1) begin    //add
            result <= num1 + num2;
             negative_sign <= 0;
             dot<=1;
             
        end
        
        else if (operation[1] == 1) begin    //subtract
          if (num1==num2) begin
                      result <= 0;
                      negative_sign <= 0;
                      dot<=1;
                      
                  end
            if (num1>num2) begin
                result <= num1 - num2;
                negative_sign <= 0;
                dot<=1;
            end
            
            if (num2>num1) begin
                result <= num2 - num1;
                negative_sign <=  1;
                dot<=1;
            end
        end
               
        else if (operation[2] == 1) begin    //multiply
            result <= num1 * num2;
             negative_sign <= 0;
             dot<=1;
        end
         
        else if (operation[3] == 1) begin    //divide
            result <= num1 / num2;
             negative_sign <= 0;
            dot<=1;
              
        end
         else if (operation[4] == 1) begin    //divide
                   result<= (num1 *100) + num2;
                    negative_sign <= 0;
                   dot<=0;
                     
               end
        else
        begin
        result<= (num1 *100) + num2;
        negative_sign <= 0;
        dot<=0;
        end
   end
endmodule
