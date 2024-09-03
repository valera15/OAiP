program zad_15;
var kol,i: integer;
    s,a: string;
  begin
    // удалите в строке все буквы 'x', за которыми следует 'abc'
   /// kol - кол-во символов в строке, s - строка
    a:='xabc';
    writeln ('Введите текст');
    readln (s);
    kol:=length(s);
    
    for i:=1 to kol-3 do
      begin
      if a=s[i]+s[i+1]+s[i+2]+s[i+3] then
        delete(s,i,1);
      end;
    writeln(s);
  end.
  