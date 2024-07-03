module Laser (
  input              CLK,
  input              RST,
  input      [3:0]     X,
  input      [3:0]     Y,
  input            valid,
  output reg [3:0]   C1X,
  output reg [3:0]   C1Y,
  output reg [3:0]   C2X,
  output reg [3:0]   C2Y,
  output reg        DONE
);

reg [1:0]j;
reg [7:0] state,next_state,test;
reg [5:0]i,x,y,score[0:1],x_ans,y_ans;

reg [3:0] data_x[0:39],data_y [0:39];

localparam INIT =8'd0,DATA=8'd1,CIRCLE1=8'd2,CIRCLE1_1=8'd3,CIRCLE1_2=8'd4,
           CIRCLE1_3=8'd5,COMP=8'd6,CIRCLE2=8'd7,CIRCLE1_4=8'd8,CIRCLE1_5=8'd9,
           CIRCLE1_6=8'd10,CIRCLE1_7=8'd11,CIRCLE1_8=8'd12,CIRCLE1_9=8'd13,CIRCLE1_10=8'd14,
           CIRCLE1_11=8'd15,CIRCLE1_12=8'd16,CIRCLE1_13=8'd17,CIRCLE1_14=8'd18,CIRCLE1_15=8'd19,
           CIRCLE1_16=8'd20,CIRCLE1_17=8'd21,CIRCLE1_18=8'd22,CIRCLE1_19=8'd23,CIRCLE1_20=8'd24,
           CIRCLE1_21=8'd25,CIRCLE1_22=8'd26,CIRCLE1_23=8'd27,CIRCLE1_24=8'd28,CIRCLE1_25=8'd29,
           CIRCLE1_26=8'd30,CIRCLE1_27=8'd31,CIRCLE1_28=8'd32,CIRCLE1_29=8'd33,CIRCLE1_30=8'd34,
           CIRCLE1_31=8'd35,CIRCLE1_32=8'd36,CIRCLE1_33=8'd37,CIRCLE1_34=8'd38,CIRCLE1_35=8'd39,
           CIRCLE1_36=8'd40,CIRCLE1_37=8'd41,CIRCLE1_38=8'd42,CIRCLE1_39=8'd43;

always @(posedge CLK or posedge RST ) begin
  if(RST) state<=INIT;
  else state<=next_state;
end

always @(*) begin
  case (state)
    INIT:begin
      //next_state=(flag==0)?DATA:INIT;
      next_state=DATA;
    end 

    DATA:begin
      //next_state=(flag==1)?CIRCLE1:DATA;
      next_state=(i>39)?CIRCLE1:DATA;
    end

    CIRCLE1:begin
      next_state=CIRCLE1_1;
    end

    CIRCLE1_1:begin
      next_state=CIRCLE1_2;
    end

    CIRCLE1_2:begin
      next_state=CIRCLE1_3;
    end

    CIRCLE1_3:begin
      //next_state=COMP;
      next_state=CIRCLE1_4;
    end

    CIRCLE1_4:begin
      //next_state=COMP;
      next_state=CIRCLE1_5;
    end

    CIRCLE1_5:begin
      //next_state=COMP;
      next_state=CIRCLE1_6;
    end

    CIRCLE1_6:begin
      //next_state=COMP;
      next_state=CIRCLE1_7;
    end

    CIRCLE1_7:begin
      //next_state=COMP;
      next_state=CIRCLE1_8;
    end

    CIRCLE1_8:begin
      //next_state=COMP;
      next_state=CIRCLE1_9;
    end

    CIRCLE1_9:begin
      //next_state=COMP;
      next_state=CIRCLE1_10;
    end

    CIRCLE1_10:begin
      //next_state=COMP;
      next_state=CIRCLE1_11;
    end

    CIRCLE1_11:begin
      //next_state=COMP;
      next_state=CIRCLE1_12;
    end

    CIRCLE1_12:begin
      //next_state=COMP;
      next_state=CIRCLE1_13;
    end

    CIRCLE1_13:begin
      //next_state=COMP;
      next_state=CIRCLE1_14;
    end

    CIRCLE1_14:begin
      //next_state=COMP;
      next_state=CIRCLE1_15;
    end

    CIRCLE1_15:begin
      //next_state=COMP;
      next_state=CIRCLE1_16;
    end

    CIRCLE1_16:begin
      //next_state=COMP;
      next_state=CIRCLE1_17;
    end

    CIRCLE1_17:begin
      //next_state=COMP;
      next_state=CIRCLE1_18;
    end

    CIRCLE1_18:begin
      //next_state=COMP;
      next_state=CIRCLE1_19;
    end

    CIRCLE1_19:begin
      //next_state=COMP;
      next_state=CIRCLE1_20;
    end

    CIRCLE1_20:begin
      next_state=CIRCLE1_21;
    end

    CIRCLE1_21:begin
      next_state=CIRCLE1_22;
    end

    CIRCLE1_22:begin
      next_state=CIRCLE1_23;
    end

    CIRCLE1_23:begin
      next_state=CIRCLE1_24;
    end

    CIRCLE1_24:begin
      next_state=CIRCLE1_25;
    end

    CIRCLE1_25:begin
      next_state=CIRCLE1_26;
    end

    CIRCLE1_26:begin
      next_state=CIRCLE1_27;
    end

    CIRCLE1_27:begin
      next_state=CIRCLE1_28;
    end

    CIRCLE1_28:begin
      next_state=CIRCLE1_29;
    end

    CIRCLE1_29:begin
      next_state=CIRCLE1_30;
    end

    CIRCLE1_30:begin
      next_state=CIRCLE1_31;
    end

    CIRCLE1_31:begin
      next_state=CIRCLE1_32;
    end

    CIRCLE1_32:begin
      next_state=CIRCLE1_33;
    end

    CIRCLE1_33:begin
      next_state=CIRCLE1_34;
    end

    CIRCLE1_34:begin
      next_state=CIRCLE1_35;
    end

    CIRCLE1_35:begin
      next_state=CIRCLE1_36;
    end

    CIRCLE1_36:begin
      next_state=CIRCLE1_37;
    end

    CIRCLE1_37:begin
      next_state=CIRCLE1_38;
    end

    CIRCLE1_38:begin
      next_state=CIRCLE1_39;
    end

    CIRCLE1_39:begin 
      next_state=COMP;
    end


    COMP:begin
      next_state=(y>11)?CIRCLE2:CIRCLE1;
    end

    CIRCLE2:begin
      next_state=INIT;
    end


    default; 
  endcase 
end

always @(posedge CLK) begin
  case (state)
    INIT:begin
      i<=0;
      DONE<=0;
      x<=4;
      y<=4;
      j<=0;
      score[0]<=0;
      score[1]<=0;
      for (i=0;i<40;i=i+1 ) begin
        data_x[i]<=0;
        data_y[i]<=0;
      end
      test<=0;
    end

    DATA:begin
      if (valid) begin
        i<=i+1;
        data_x[i]<=X;
        data_y[i]<=Y;
      end
      else i<=i;
      
      //flag<=(i>39)?flag+1:flag;
      
    end 
    
    
    CIRCLE1:begin
      test=1;
     /* if (4>=$signed(x-data_x[0])>=0&&4>=$signed(y-data_y[0])>=0||-4<=$signed(x-data_x[0])<=0&&-4<=$signed(y-data_y[0])<=0||
         4>=$signed(x-data_x[0])>=0&&-4<=$signed(y-data_y[0])<=0||-4<=$signed(x-data_x[0])<=0&&4>=$signed(y-data_y[0])>=0) begin
         score[0]<=score[0]+1;
         //test<=0;   
      end
      else begin
        score[0]<=score[0];
        //test<=1;
      end*/
    end

    CIRCLE1_1:begin
      if (4>=$signed(x-data_x[1])>=0&&4>=$signed(y-data_y[1])>=0||-4<=$signed(x-data_x[1])<=0&&-4<=$signed(y-data_y[1])<=0||
         4>=$signed(x-data_x[1])>=0&&-4<=$signed(y-data_y[1])<=0||-4<=$signed(x-data_x[1])<=0&&4>=$signed(y-data_y[1])>=0) begin
         score[0]<=score[0]+1;
         test<=2;   
      end
      else begin
        score[0]<=score[0];
        test<=3;
      end
      
    end

    CIRCLE1_2:begin
      if (4>=$signed(x-data_x[2])>=0&&4>=$signed(y-data_y[2])>=0||-4<=$signed(x-data_x[2])<=0&&-4<=$signed(y-data_y[2])<=0||
         4>=$signed(x-data_x[2])>=0&&-4<=$signed(y-data_y[2])<=0||-4<=$signed(x-data_x[2])<=0&&4>=$signed(y-data_y[2])>=0) begin
         score[0]<=score[0]+1;
         test<=4;   
      end
      else begin
        score[0]<=score[0];
        test<=5;
      end
      
    end

    CIRCLE1_3:begin
      if (4>=$signed(x-data_x[3])>=0&&4>=$signed(y-data_y[3])>=0||-4<=$signed(x-data_x[3])<=0&&-4<=$signed(y-data_y[3])<=0||
         4>=$signed(x-data_x[3])>=0&&-4<=$signed(y-data_y[3])<=0||-4<=$signed(x-data_x[3])<=0&&4>=$signed(y-data_y[3])>=0) begin
         score[0]<=score[0]+1; 
         test<=6;  
      end
      else begin
      score[0]<=score[0];
      test<=7;
      end
    end

    CIRCLE1_4:begin
      if (4>=$signed(x-data_x[4])>=0&&4>=$signed(y-data_y[4])>=0||-4<=$signed(x-data_x[4])<=0&&-4<=$signed(y-data_y[4])<=0||
         4>=$signed(x-data_x[4])>=0&&-4<=$signed(y-data_y[4])<=0||-4<=$signed(x-data_x[4])<=0&&4>=$signed(y-data_y[4])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_5:begin
      if (4>=$signed(x-data_x[5])>=0&&4>=$signed(y-data_y[5])>=0||-4<=$signed(x-data_x[5])<=0&&-4<=$signed(y-data_y[5])<=0||
         4>=$signed(x-data_x[5])>=0&&-4<=$signed(y-data_y[5])<=0||-4<=$signed(x-data_x[5])<=0&&4>=$signed(y-data_y[5])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_6:begin
      if (4>=$signed(x-data_x[6])>=0&&4>=$signed(y-data_y[6])>=0||-4<=$signed(x-data_x[6])<=0&&-4<=$signed(y-data_y[6])<=0||
         4>=$signed(x-data_x[6])>=0&&-4<=$signed(y-data_y[6])<=0||-4<=$signed(x-data_x[6])<=0&&4>=$signed(y-data_y[6])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_7:begin
      if (4>=$signed(x-data_x[7])>=0&&4>=$signed(y-data_y[7])>=0||-4<=$signed(x-data_x[7])<=0&&-4<=$signed(y-data_y[7])<=0||
         4>=$signed(x-data_x[7])>=0&&-4<=$signed(y-data_y[7])<=0||-4<=$signed(x-data_x[7])<=0&&4>=$signed(y-data_y[7])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_8:begin
      if (4>=$signed(x-data_x[8])>=0&&4>=$signed(y-data_y[8])>=0||-4<=$signed(x-data_x[8])<=0&&-4<=$signed(y-data_y[8])<=0||
         4>=$signed(x-data_x[8])>=0&&-4<=$signed(y-data_y[8])<=0||-4<=$signed(x-data_x[8])<=0&&4>=$signed(y-data_y[8])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_9:begin
      if (4>=$signed(x-data_x[9])>=0&&4>=$signed(y-data_y[9])>=0||-4<=$signed(x-data_x[9])<=0&&-4<=$signed(y-data_y[9])<=0||
         4>=$signed(x-data_x[9])>=0&&-4<=$signed(y-data_y[9])<=0||-4<=$signed(x-data_x[9])<=0&&4>=$signed(y-data_y[9])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_10:begin
      if (4>=$signed(x-data_x[10])>=0&&4>=$signed(y-data_y[10])>=0||-4<=$signed(x-data_x[10])<=0&&-4<=$signed(y-data_y[10])<=0||
         4>=$signed(x-data_x[10])>=0&&-4<=$signed(y-data_y[10])<=0||-4<=$signed(x-data_x[10])<=0&&4>=$signed(y-data_y[10])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_11:begin
       if (4>=$signed(x-data_x[11])>=0&&4>=$signed(y-data_y[11])>=0||-4<=$signed(x-data_x[11])<=0&&-4<=$signed(y-data_y[11])<=0||
         4>=$signed(x-data_x[11])>=0&&-4<=$signed(y-data_y[11])<=0||-4<=$signed(x-data_x[11])<=0&&4>=$signed(y-data_y[11])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_12:begin
      if (4>=$signed(x-data_x[12])>=0&&4>=$signed(y-data_y[12])>=0||-4<=$signed(x-data_x[12])<=0&&-4<=$signed(y-data_y[12])<=0||
         4>=$signed(x-data_x[12])>=0&&-4<=$signed(y-data_y[12])<=0||-4<=$signed(x-data_x[12])<=0&&4>=$signed(y-data_y[12])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_13:begin
      if (4>=$signed(x-data_x[13])>=0&&4>=$signed(y-data_y[13])>=0||-4<=$signed(x-data_x[13])<=0&&-4<=$signed(y-data_y[13])<=0||
         4>=$signed(x-data_x[13])>=0&&-4<=$signed(y-data_y[13])<=0||-4<=$signed(x-data_x[13])<=0&&4>=$signed(y-data_y[13])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_14:begin
      if (4>=$signed(x-data_x[14])>=0&&4>=$signed(y-data_y[14])>=0||-4<=$signed(x-data_x[14])<=0&&-4<=$signed(y-data_y[14])<=0||
         4>=$signed(x-data_x[14])>=0&&-4<=$signed(y-data_y[14])<=0||-4<=$signed(x-data_x[14])<=0&&4>=$signed(y-data_y[14])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_15:begin
       if (4>=$signed(x-data_x[15])>=0&&4>=$signed(y-data_y[15])>=0||-4<=$signed(x-data_x[15])<=0&&-4<=$signed(y-data_y[15])<=0||
         4>=$signed(x-data_x[15])>=0&&-4<=$signed(y-data_y[15])<=0||-4<=$signed(x-data_x[15])<=0&&4>=$signed(y-data_y[15])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_16:begin
      if (4>=$signed(x-data_x[16])>=0&&4>=$signed(y-data_y[16])>=0||-4<=$signed(x-data_x[16])<=0&&-4<=$signed(y-data_y[16])<=0||
         4>=$signed(x-data_x[16])>=0&&-4<=$signed(y-data_y[16])<=0||-4<=$signed(x-data_x[16])<=0&&4>=$signed(y-data_y[16])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_17:begin
      if (4>=$signed(x-data_x[17])>=0&&4>=$signed(y-data_y[17])>=0||-4<=$signed(x-data_x[17])<=0&&-4<=$signed(y-data_y[17])<=0||
         4>=$signed(x-data_x[17])>=0&&-4<=$signed(y-data_y[17])<=0||-4<=$signed(x-data_x[17])<=0&&4>=$signed(y-data_y[17])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_18:begin
      if (4>=$signed(x-data_x[18])>=0&&4>=$signed(y-data_y[18])>=0||-4<=$signed(x-data_x[18])<=0&&-4<=$signed(y-data_y[18])<=0||
         4>=$signed(x-data_x[18])>=0&&-4<=$signed(y-data_y[18])<=0||-4<=$signed(x-data_x[18])<=0&&4>=$signed(y-data_y[18])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_19:begin
      if (4>=$signed(x-data_x[19])>=0&&4>=$signed(y-data_y[19])>=0||-4<=$signed(x-data_x[19])<=0&&-4<=$signed(y-data_y[19])<=0||
         4>=$signed(x-data_x[19])>=0&&-4<=$signed(y-data_y[19])<=0||-4<=$signed(x-data_x[19])<=0&&4>=$signed(y-data_y[19])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_20:begin
      if (4>=$signed(x-data_x[20])>=0&&4>=$signed(y-data_y[20])>=0||-4<=$signed(x-data_x[20])<=0&&-4<=$signed(y-data_y[20])<=0||
         4>=$signed(x-data_x[20])>=0&&-4<=$signed(y-data_y[20])<=0||-4<=$signed(x-data_x[20])<=0&&4>=$signed(y-data_y[20])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_21:begin
      if (4>=$signed(x-data_x[21])>=0&&4>=$signed(y-data_y[21])>=0||-4<=$signed(x-data_x[21])<=0&&-4<=$signed(y-data_y[21])<=0||
         4>=$signed(x-data_x[21])>=0&&-4<=$signed(y-data_y[21])<=0||-4<=$signed(x-data_x[21])<=0&&4>=$signed(y-data_y[21])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_22:begin
      if (4>=$signed(x-data_x[22])>=0&&4>=$signed(y-data_y[22])>=0||-4<=$signed(x-data_x[22])<=0&&-4<=$signed(y-data_y[22])<=0||
         4>=$signed(x-data_x[22])>=0&&-4<=$signed(y-data_y[22])<=0||-4<=$signed(x-data_x[22])<=0&&4>=$signed(y-data_y[22])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_23:begin
      if (4>=$signed(x-data_x[23])>=0&&4>=$signed(y-data_y[23])>=0||-4<=$signed(x-data_x[23])<=0&&-4<=$signed(y-data_y[23])<=0||
         4>=$signed(x-data_x[23])>=0&&-4<=$signed(y-data_y[23])<=0||-4<=$signed(x-data_x[23])<=0&&4>=$signed(y-data_y[23])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_24:begin
      if (4>=$signed(x-data_x[24])>=0&&4>=$signed(y-data_y[24])>=0||-4<=$signed(x-data_x[24])<=0&&-4<=$signed(y-data_y[24])<=0||
         4>=$signed(x-data_x[24])>=0&&-4<=$signed(y-data_y[24])<=0||-4<=$signed(x-data_x[24])<=0&&4>=$signed(y-data_y[24])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_25:begin
      if (4>=$signed(x-data_x[25])>=0&&4>=$signed(y-data_y[25])>=0||-4<=$signed(x-data_x[25])<=0&&-4<=$signed(y-data_y[25])<=0||
         4>=$signed(x-data_x[25])>=0&&-4<=$signed(y-data_y[25])<=0||-4<=$signed(x-data_x[25])<=0&&4>=$signed(y-data_y[25])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_26:begin
      if (4>=$signed(x-data_x[26])>=0&&4>=$signed(y-data_y[26])>=0||-4<=$signed(x-data_x[26])<=0&&-4<=$signed(y-data_y[26])<=0||
         4>=$signed(x-data_x[26])>=0&&-4<=$signed(y-data_y[26])<=0||-4<=$signed(x-data_x[26])<=0&&4>=$signed(y-data_y[26])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_27:begin
      if (4>=$signed(x-data_x[27])>=0&&4>=$signed(y-data_y[27])>=0||-4<=$signed(x-data_x[27])<=0&&-4<=$signed(y-data_y[27])<=0||
         4>=$signed(x-data_x[27])>=0&&-4<=$signed(y-data_y[27])<=0||-4<=$signed(x-data_x[27])<=0&&4>=$signed(y-data_y[27])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_28:begin
      if (4>=$signed(x-data_x[28])>=0&&4>=$signed(y-data_y[28])>=0||-4<=$signed(x-data_x[28])<=0&&-4<=$signed(y-data_y[28])<=0||
         4>=$signed(x-data_x[28])>=0&&-4<=$signed(y-data_y[28])<=0||-4<=$signed(x-data_x[28])<=0&&4>=$signed(y-data_y[28])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_29:begin
      if (4>=$signed(x-data_x[29])>=0&&4>=$signed(y-data_y[29])>=0||-4<=$signed(x-data_x[29])<=0&&-4<=$signed(y-data_y[29])<=0||
         4>=$signed(x-data_x[29])>=0&&-4<=$signed(y-data_y[29])<=0||-4<=$signed(x-data_x[29])<=0&&4>=$signed(y-data_y[29])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_30:begin
      if (4>=$signed(x-data_x[30])>=0&&4>=$signed(y-data_y[30])>=0||-4<=$signed(x-data_x[30])<=0&&-4<=$signed(y-data_y[30])<=0||
         4>=$signed(x-data_x[30])>=0&&-4<=$signed(y-data_y[30])<=0||-4<=$signed(x-data_x[30])<=0&&4>=$signed(y-data_y[30])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_31:begin
      if (4>=$signed(x-data_x[31])>=0&&4>=$signed(y-data_y[31])>=0||-4<=$signed(x-data_x[31])<=0&&-4<=$signed(y-data_y[31])<=0||
         4>=$signed(x-data_x[31])>=0&&-4<=$signed(y-data_y[31])<=0||-4<=$signed(x-data_x[31])<=0&&4>=$signed(y-data_y[31])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_32:begin
      if (4>=$signed(x-data_x[32])>=0&&4>=$signed(y-data_y[32])>=0||-4<=$signed(x-data_x[32])<=0&&-4<=$signed(y-data_y[32])<=0||
         4>=$signed(x-data_x[32])>=0&&-4<=$signed(y-data_y[32])<=0||-4<=$signed(x-data_x[32])<=0&&4>=$signed(y-data_y[32])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_33:begin
      if (4>=$signed(x-data_x[33])>=0&&4>=$signed(y-data_y[33])>=0||-4<=$signed(x-data_x[33])<=0&&-4<=$signed(y-data_y[33])<=0||
         4>=$signed(x-data_x[33])>=0&&-4<=$signed(y-data_y[33])<=0||-4<=$signed(x-data_x[33])<=0&&4>=$signed(y-data_y[33])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_34:begin
      if (4>=$signed(x-data_x[34])>=0&&4>=$signed(y-data_y[34])>=0||-4<=$signed(x-data_x[34])<=0&&-4<=$signed(y-data_y[34])<=0||
         4>=$signed(x-data_x[34])>=0&&-4<=$signed(y-data_y[34])<=0||-4<=$signed(x-data_x[34])<=0&&4>=$signed(y-data_y[34])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_35:begin
      if (4>=$signed(x-data_x[35])>=0&&4>=$signed(y-data_y[35])>=0||-4<=$signed(x-data_x[35])<=0&&-4<=$signed(y-data_y[35])<=0||
         4>=$signed(x-data_x[35])>=0&&-4<=$signed(y-data_y[35])<=0||-4<=$signed(x-data_x[35])<=0&&4>=$signed(y-data_y[35])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_36:begin
      if (4>=$signed(x-data_x[36])>=0&&4>=$signed(y-data_y[36])>=0||-4<=$signed(x-data_x[36])<=0&&-4<=$signed(y-data_y[36])<=0||
         4>=$signed(x-data_x[36])>=0&&-4<=$signed(y-data_y[36])<=0||-4<=$signed(x-data_x[36])<=0&&4>=$signed(y-data_y[36])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_37:begin
      if (4>=$signed(x-data_x[37])>=0&&4>=$signed(y-data_y[37])>=0||-4<=$signed(x-data_x[37])<=0&&-4<=$signed(y-data_y[37])<=0||
         4>=$signed(x-data_x[37])>=0&&-4<=$signed(y-data_y[37])<=0||-4<=$signed(x-data_x[37])<=0&&4>=$signed(y-data_y[37])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_38:begin
      if (4>=$signed(x-data_x[38])>=0&&4>=$signed(y-data_y[38])>=0||-4<=$signed(x-data_x[38])<=0&&-4<=$signed(y-data_y[38])<=0||
         4>=$signed(x-data_x[38])>=0&&-4<=$signed(y-data_y[38])<=0||-4<=$signed(x-data_x[38])<=0&&4>=$signed(y-data_y[38])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end

    CIRCLE1_39:begin
      if (4>=$signed(x-data_x[39])>=0&&4>=$signed(y-data_y[39])>=0||-4<=$signed(x-data_x[39])<=0&&-4<=$signed(y-data_y[39])<=0||
         4>=$signed(x-data_x[39])>=0&&-4<=$signed(y-data_y[39])<=0||-4<=$signed(x-data_x[39])<=0&&4>=$signed(y-data_y[39])>=0) begin
         score[0]<=score[0]+1;   
      end 
      else score[0]<=score[0];
    end




    /*CIRCLE1:begin
      if (4>=$signed(x-data_x[0])>=0&&4>=$signed(y-data_y[0])>=0||-4<=$signed(x-data_x[0])<=0&&-4<=$signed(y-data_y[0])<=0||
         4>=$signed(x-data_x[0])>=0&&-4<=$signed(y-data_y[0])<=0||-4<=$signed(x-data_x[0])<=0&&4>=$signed(y-data_y[0])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
      
      if (4>=$signed(x-data_x[1])>=0&&4>=$signed(y-data_y[1])>=0||-4<=$signed(x-data_x[1])<=0&&-4<=$signed(y-data_y[1])<=0||
         4>=$signed(x-data_x[1])>=0&&-4<=$signed(y-data_y[1])<=0||-4<=$signed(x-data_x[1])<=0&&4>=$signed(y-data_y[1])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[2])>=0&&4>=$signed(y-data_y[2])>=0||-4<=$signed(x-data_x[2])<=0&&-4<=$signed(y-data_y[2])<=0||
         4>=$signed(x-data_x[2])>=0&&-4<=$signed(y-data_y[2])<=0||-4<=$signed(x-data_x[2])<=0&&4>=$signed(y-data_y[2])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[3])>=0&&4>=$signed(y-data_y[3])>=0||-4<=$signed(x-data_x[3])<=0&&-4<=$signed(y-data_y[3])<=0||
         4>=$signed(x-data_x[3])>=0&&-4<=$signed(y-data_y[3])<=0||-4<=$signed(x-data_x[3])<=0&&4>=$signed(y-data_y[3])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[4])>=0&&4>=$signed(y-data_y[4])>=0||-4<=$signed(x-data_x[4])<=0&&-4<=$signed(y-data_y[4])<=0||
         4>=$signed(x-data_x[4])>=0&&-4<=$signed(y-data_y[4])<=0||-4<=$signed(x-data_x[4])<=0&&4>=$signed(y-data_y[4])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[5])>=0&&4>=$signed(y-data_y[5])>=0||-4<=$signed(x-data_x[5])<=0&&-4<=$signed(y-data_y[5])<=0||
         4>=$signed(x-data_x[5])>=0&&-4<=$signed(y-data_y[5])<=0||-4<=$signed(x-data_x[5])<=0&&4>=$signed(y-data_y[5])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[6])>=0&&4>=$signed(y-data_y[6])>=0||-4<=$signed(x-data_x[6])<=0&&-4<=$signed(y-data_y[6])<=0||
         4>=$signed(x-data_x[6])>=0&&-4<=$signed(y-data_y[6])<=0||-4<=$signed(x-data_x[6])<=0&&4>=$signed(y-data_y[6])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[7])>=0&&4>=$signed(y-data_y[7])>=0||-4<=$signed(x-data_x[7])<=0&&-4<=$signed(y-data_y[7])<=0||
         4>=$signed(x-data_x[7])>=0&&-4<=$signed(y-data_y[7])<=0||-4<=$signed(x-data_x[7])<=0&&4>=$signed(y-data_y[7])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[8])>=0&&4>=$signed(y-data_y[8])>=0||-4<=$signed(x-data_x[8])<=0&&-4<=$signed(y-data_y[8])<=0||
         4>=$signed(x-data_x[8])>=0&&-4<=$signed(y-data_y[8])<=0||-4<=$signed(x-data_x[8])<=0&&4>=$signed(y-data_y[8])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[9])>=0&&4>=$signed(y-data_y[9])>=0||-4<=$signed(x-data_x[9])<=0&&-4<=$signed(y-data_y[9])<=0||
         4>=$signed(x-data_x[9])>=0&&-4<=$signed(y-data_y[9])<=0||-4<=$signed(x-data_x[9])<=0&&4>=$signed(y-data_y[9])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end*/

    /*CIRCLE1_1:begin
      if (4>=$signed(x-data_x[10])>=0&&4>=$signed(y-data_y[10])>=0||-4<=$signed(x-data_x[10])<=0&&-4<=$signed(y-data_y[10])<=0||
         4>=$signed(x-data_x[10])>=0&&-4<=$signed(y-data_y[10])<=0||-4<=$signed(x-data_x[10])<=0&&4>=$signed(y-data_y[10])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[11])>=0&&4>=$signed(y-data_y[11])>=0||-4<=$signed(x-data_x[11])<=0&&-4<=$signed(y-data_y[11])<=0||
         4>=$signed(x-data_x[11])>=0&&-4<=$signed(y-data_y[11])<=0||-4<=$signed(x-data_x[11])<=0&&4>=$signed(y-data_y[11])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[12])>=0&&4>=$signed(y-data_y[12])>=0||-4<=$signed(x-data_x[12])<=0&&-4<=$signed(y-data_y[12])<=0||
         4>=$signed(x-data_x[12])>=0&&-4<=$signed(y-data_y[12])<=0||-4<=$signed(x-data_x[12])<=0&&4>=$signed(y-data_y[12])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[13])>=0&&4>=$signed(y-data_y[13])>=0||-4<=$signed(x-data_x[13])<=0&&-4<=$signed(y-data_y[13])<=0||
         4>=$signed(x-data_x[13])>=0&&-4<=$signed(y-data_y[13])<=0||-4<=$signed(x-data_x[13])<=0&&4>=$signed(y-data_y[13])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[14])>=0&&4>=$signed(y-data_y[14])>=0||-4<=$signed(x-data_x[14])<=0&&-4<=$signed(y-data_y[14])<=0||
         4>=$signed(x-data_x[14])>=0&&-4<=$signed(y-data_y[14])<=0||-4<=$signed(x-data_x[14])<=0&&4>=$signed(y-data_y[14])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[15])>=0&&4>=$signed(y-data_y[15])>=0||-4<=$signed(x-data_x[15])<=0&&-4<=$signed(y-data_y[15])<=0||
         4>=$signed(x-data_x[15])>=0&&-4<=$signed(y-data_y[15])<=0||-4<=$signed(x-data_x[15])<=0&&4>=$signed(y-data_y[15])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[16])>=0&&4>=$signed(y-data_y[16])>=0||-4<=$signed(x-data_x[16])<=0&&-4<=$signed(y-data_y[16])<=0||
         4>=$signed(x-data_x[16])>=0&&-4<=$signed(y-data_y[16])<=0||-4<=$signed(x-data_x[16])<=0&&4>=$signed(y-data_y[16])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[17])>=0&&4>=$signed(y-data_y[17])>=0||-4<=$signed(x-data_x[17])<=0&&-4<=$signed(y-data_y[17])<=0||
         4>=$signed(x-data_x[17])>=0&&-4<=$signed(y-data_y[17])<=0||-4<=$signed(x-data_x[17])<=0&&4>=$signed(y-data_y[17])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[18])>=0&&4>=$signed(y-data_y[18])>=0||-4<=$signed(x-data_x[18])<=0&&-4<=$signed(y-data_y[18])<=0||
         4>=$signed(x-data_x[18])>=0&&-4<=$signed(y-data_y[18])<=0||-4<=$signed(x-data_x[18])<=0&&4>=$signed(y-data_y[18])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[19])>=0&&4>=$signed(y-data_y[19])>=0||-4<=$signed(x-data_x[19])<=0&&-4<=$signed(y-data_y[19])<=0||
         4>=$signed(x-data_x[19])>=0&&-4<=$signed(y-data_y[19])<=0||-4<=$signed(x-data_x[19])<=0&&4>=$signed(y-data_y[19])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end*/
    
   /*CIRCLE1_2:begin
      if (4>=$signed(x-data_x[20])>=0&&4>=$signed(y-data_y[20])>=0||-4<=$signed(x-data_x[20])<=0&&-4<=$signed(y-data_y[20])<=0||
         4>=$signed(x-data_x[20])>=0&&-4<=$signed(y-data_y[20])<=0||-4<=$signed(x-data_x[20])<=0&&4>=$signed(y-data_y[20])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[21])>=0&&4>=$signed(y-data_y[21])>=0||-4<=$signed(x-data_x[21])<=0&&-4<=$signed(y-data_y[21])<=0||
         4>=$signed(x-data_x[21])>=0&&-4<=$signed(y-data_y[21])<=0||-4<=$signed(x-data_x[21])<=0&&4>=$signed(y-data_y[21])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[22])>=0&&4>=$signed(y-data_y[22])>=0||-4<=$signed(x-data_x[22])<=0&&-4<=$signed(y-data_y[22])<=0||
         4>=$signed(x-data_x[22])>=0&&-4<=$signed(y-data_y[22])<=0||-4<=$signed(x-data_x[22])<=0&&4>=$signed(y-data_y[22])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[23])>=0&&4>=$signed(y-data_y[23])>=0||-4<=$signed(x-data_x[23])<=0&&-4<=$signed(y-data_y[23])<=0||
         4>=$signed(x-data_x[23])>=0&&-4<=$signed(y-data_y[23])<=0||-4<=$signed(x-data_x[23])<=0&&4>=$signed(y-data_y[23])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[24])>=0&&4>=$signed(y-data_y[24])>=0||-4<=$signed(x-data_x[24])<=0&&-4<=$signed(y-data_y[24])<=0||
         4>=$signed(x-data_x[24])>=0&&-4<=$signed(y-data_y[24])<=0||-4<=$signed(x-data_x[24])<=0&&4>=$signed(y-data_y[24])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[25])>=0&&4>=$signed(y-data_y[25])>=0||-4<=$signed(x-data_x[25])<=0&&-4<=$signed(y-data_y[25])<=0||
         4>=$signed(x-data_x[25])>=0&&-4<=$signed(y-data_y[25])<=0||-4<=$signed(x-data_x[25])<=0&&4>=$signed(y-data_y[25])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[26])>=0&&4>=$signed(y-data_y[26])>=0||-4<=$signed(x-data_x[26])<=0&&-4<=$signed(y-data_y[26])<=0||
         4>=$signed(x-data_x[26])>=0&&-4<=$signed(y-data_y[26])<=0||-4<=$signed(x-data_x[26])<=0&&4>=$signed(y-data_y[26])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[27])>=0&&4>=$signed(y-data_y[27])>=0||-4<=$signed(x-data_x[27])<=0&&-4<=$signed(y-data_y[27])<=0||
         4>=$signed(x-data_x[27])>=0&&-4<=$signed(y-data_y[27])<=0||-4<=$signed(x-data_x[27])<=0&&4>=$signed(y-data_y[27])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[28])>=0&&4>=$signed(y-data_y[28])>=0||-4<=$signed(x-data_x[28])<=0&&-4<=$signed(y-data_y[28])<=0||
         4>=$signed(x-data_x[28])>=0&&-4<=$signed(y-data_y[28])<=0||-4<=$signed(x-data_x[28])<=0&&4>=$signed(y-data_y[28])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[29])>=0&&4>=$signed(y-data_y[29])>=0||-4<=$signed(x-data_x[29])<=0&&-4<=$signed(y-data_y[29])<=0||
         4>=$signed(x-data_x[29])>=0&&-4<=$signed(y-data_y[29])<=0||-4<=$signed(x-data_x[29])<=0&&4>=$signed(y-data_y[29])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];
    end*/

    /*CIRCLE1_3:begin
      if (4>=$signed(x-data_x[30])>=0&&4>=$signed(y-data_y[30])>=0||-4<=$signed(x-data_x[30])<=0&&-4<=$signed(y-data_y[30])<=0||
         4>=$signed(x-data_x[30])>=0&&-4<=$signed(y-data_y[30])<=0||-4<=$signed(x-data_x[30])<=0&&4>=$signed(y-data_y[30])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[31])>=0&&4>=$signed(y-data_y[31])>=0||-4<=$signed(x-data_x[31])<=0&&-4<=$signed(y-data_y[31])<=0||
         4>=$signed(x-data_x[31])>=0&&-4<=$signed(y-data_y[31])<=0||-4<=$signed(x-data_x[31])<=0&&4>=$signed(y-data_y[31])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[32])>=0&&4>=$signed(y-data_y[32])>=0||-4<=$signed(x-data_x[32])<=0&&-4<=$signed(y-data_y[32])<=0||
         4>=$signed(x-data_x[32])>=0&&-4<=$signed(y-data_y[32])<=0||-4<=$signed(x-data_x[32])<=0&&4>=$signed(y-data_y[32])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[33])>=0&&4>=$signed(y-data_y[33])>=0||-4<=$signed(x-data_x[33])<=0&&-4<=$signed(y-data_y[33])<=0||
         4>=$signed(x-data_x[33])>=0&&-4<=$signed(y-data_y[33])<=0||-4<=$signed(x-data_x[33])<=0&&4>=$signed(y-data_y[33])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[34])>=0&&4>=$signed(y-data_y[34])>=0||-4<=$signed(x-data_x[34])<=0&&-4<=$signed(y-data_y[34])<=0||
         4>=$signed(x-data_x[34])>=0&&-4<=$signed(y-data_y[34])<=0||-4<=$signed(x-data_x[34])<=0&&4>=$signed(y-data_y[34])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[35])>=0&&4>=$signed(y-data_y[35])>=0||-4<=$signed(x-data_x[35])<=0&&-4<=$signed(y-data_y[35])<=0||
         4>=$signed(x-data_x[35])>=0&&-4<=$signed(y-data_y[35])<=0||-4<=$signed(x-data_x[35])<=0&&4>=$signed(y-data_y[35])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[36])>=0&&4>=$signed(y-data_y[36])>=0||-4<=$signed(x-data_x[36])<=0&&-4<=$signed(y-data_y[36])<=0||
         4>=$signed(x-data_x[36])>=0&&-4<=$signed(y-data_y[36])<=0||-4<=$signed(x-data_x[36])<=0&&4>=$signed(y-data_y[36])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[37])>=0&&4>=$signed(y-data_y[37])>=0||-4<=$signed(x-data_x[37])<=0&&-4<=$signed(y-data_y[37])<=0||
         4>=$signed(x-data_x[37])>=0&&-4<=$signed(y-data_y[37])<=0||-4<=$signed(x-data_x[37])<=0&&4>=$signed(y-data_y[37])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[38])>=0&&4>=$signed(y-data_y[38])>=0||-4<=$signed(x-data_x[38])<=0&&-4<=$signed(y-data_y[38])<=0||
         4>=$signed(x-data_x[38])>=0&&-4<=$signed(y-data_y[38])<=0||-4<=$signed(x-data_x[38])<=0&&4>=$signed(y-data_y[38])>=0) begin
         score[0]<=score[0]+1;   
      end
      else score[0]<=score[0];

      if (4>=$signed(x-data_x[39])>=0&&4>=$signed(y-data_y[39])>=0||-4<=$signed(x-data_x[39])<=0&&-4<=$signed(y-data_y[39])<=0||
         4>=$signed(x-data_x[39])>=0&&-4<=$signed(y-data_y[39])<=0||-4<=$signed(x-data_x[39])<=0&&4>=$signed(y-data_y[39])>=0) begin
         score[0]<=score[0]+1;   
      end 
      else score[0]<=score[0];
    end*/

    COMP:begin
      if (score[0]>score[1]) begin
        score[1]<=score[0];
        x_ans<=x;
        y_ans<=y;
      end
      else begin
        score[1]<=score[1];
        x_ans<=x;
        y_ans<=y;
      end      
      if (y>11) begin
        y<=0;
        x<=0;
        C1X<=x_ans;
        C1Y<=y_ans;
      end 
      else if (x>11) begin
        x<=4;
        y<=y+1;
      end
      else begin
        x<=x+1;
      end
      i<=0;
      score[0]<=0;
    end

    CIRCLE2:begin
      DONE<=1;
    end
    default; 
  endcase
end

endmodule
