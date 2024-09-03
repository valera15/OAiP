program zad_1;
var A: array of Integer;
    input,output: TextFile;
    x,i,max,maxn,n,z: integer;
   /// Реализовать сортировку данных с помощью алгоритма выбором
   /// Реализовать сортировку данных с помощью пирамидального алгоритма
   /// В обоих случаях необходимо предусмотреть возможность изменения компаратора 
   ///  (реализация компаратора в виде передаваемой в подпрограмму функции)
   /// Считывание и вывод данных необходимо производить из текстового файла
   /// Для демонстрации работы программных реализаций самостоятельно подготовить 
   ///  варианты входных данных (при этом объем тестовых файлов должен 
   ///  позволять оценить скорость работы программ).
    
  procedure max_minSO(var max,maxn: integer; i: integer);
  begin
  // maxn - номер макс эл-та
    if A[i]<max then 
      begin
      max:=A[i];
      maxn:=i
      end;
  end;
     
  procedure min_maxSO(var max,maxn: integer; i: integer);
  begin
    if A[i]>max then
      begin
      max:=A[i];
      maxn:=i;
      end;
  end;
  
  procedure max_minSP(var Child,breakk: integer;Current: integer);
  begin
      if (Child>n-1) and (A[Child]>A[Child+1]) then// для смены последовательности заменить знаки 
       Child:=Child+1;
       breakk:=0;
      if Current<=A[Child] then breakk:=1;// и здесь
  end;
  
  procedure min_maxSP(var Child,breakk: integer;Current: integer);
  begin
      if (Child<n-1) and (A[Child]<A[Child+1]) then// для смены последовательности заменить знаки 
       Child:=Child+1;
       breakk:=0;
      if Current>=A[Child] then breakk:=1;// и здесь
  end;
  
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure sorted_obichnaia (var A: array of integer; z: integer);
  var i,j,max,maxn: integer;
  begin
    j:=Length(A);
    while j>0 do 
      begin
      max:=A[0];
      maxn:=0;
      for i:=1 to j-1 do 
        if z=1 then 
          min_maxSO(max,maxn,i)
        else 
          max_minSO(max,maxn,i);
      A[maxn]:=A[j-1];
      A[j-1]:=max;
      j:=j-1;
      end;
  end;
  
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure sorted_piramed(var A: array of integer; n,z: integer);
  procedure DownHeap(i,n: integer; Current: integer);
  var Child,breakk: integer;
    begin
    // создание пирамиды // Current - Текущий
                         //  Child - Ребенок
    while i<n div 2 do
      begin
      Child:=(i+1)*2-1;
        if z=1 then 
          max_minSP(Child,breakk,Current)
        else 
          min_maxSP(Child,breakk,Current);
        if breakk = 1 then 
          break;
      A[i]:=A[Child];
      i:=Child;
      end;
    A[i]:=Current;
    end;

  var i: integer;
      Current: integer;
    begin
    // сборка пирамиды
    for i:=(n-1 div 2)-1 downto 0 do
      DownHeap(i,n,A[i]);
    // сортировка пирамиды
    for i:=n-1 downto 0 do 
      begin
      // перемещение верхушки в начало отсортированного списка
      Current:=A[i];
      A[i]:=A[0];
      // нахождение нужного места в пирамиде для нового эл-та
      DownHeap(0,i,Current);
      end;
    end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  begin
    // AssignFile - подключение файла; Eof - конец файла
    // SetLength - увеличивает длину массива; x - переменная
    // Low - нижняя граница; High - верхняя граница массива
    // Rewrite - запись и очищение файла
    // файл
    AssignFile(input,'lol.txt');
    Reset(input);
    while not Eof(input) do
      begin
        readln(input,x);
        SetLength(A,Length(A)+1);
        A[High(A)]:=x;
      end;
    writeln (A);
    CloseFile(input);
    
    writeln ('Введите 1 для sorted_obichnaia, любое другое число для sorted_piramed'); 
    read (z);
    n:=length(A);
    if z=1 then 
      begin
      writeln ('Введите 1 для max_minSO, любое другое число для min_maxSO'); 
      read (z);
      sorted_obichnaia(A,z);
      end
    else 
      begin
      writeln ('Введите 1 для max_minSP, любое другое число для min_maxSP'); 
      read (z);
      sorted_piramed(A,n,z);
      end;
    
    AssignFile(input,'output.txt');
    Rewrite(input);
    for i:= Low(A) to High(A) do
      writeln (input,A[i]);
      writeln (A);
      CloseFile(input);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  end.