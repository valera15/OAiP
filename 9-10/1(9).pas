program zad_1_9;
var A: array [1..10] of integer;
    i,pr: integer;
  begin
    // написать ф-ию, которая вычисляет произведение эл-ов массива 
    // исправить ф-ию так, чтобы она вычисляла произведение только четных эл-ов массива
    pr:=1;
    for i:=1 to 10 do
      begin
      A[i]:= -10+ random (10+1+10);
      writeln (A[i]);
      end;
    Function (): integer;
      begin
      for i:=1 to 10 do
      pr:=pr*A[i];
      end;
    writeln ('Произведение эл-в массива - ',pr);
  end.
  
  