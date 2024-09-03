uses graphABC;
var i, x1, x2, y1, y2, N: integer;
   h, x: real;
begin   
  x1 := 100; y1 := 100;
  x2 := 300; y2 := 200;
  N := 10;
  Rectangle (x1, y1, x2, y2);
  h := (x2 - x1) / (N + 1);
  x := x1 + h;
  for i:=1 to N do begin
    Line(round(x), y1, round(x), y2);
    x := x + h;
  end;
end.
