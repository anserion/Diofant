unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

const MAX_N=100;

type
  TForm1 = class(TForm)
    Label_koeff: TLabel;
    Label_A: TLabel;
    Edit_A: TEdit;
    Grid_koeff: TStringGrid;
    Grid_SOK_koeff: TStringGrid;
    Grid_SOK_A: TStringGrid;
    Label_SOK_koeff: TLabel;
    Label_SOK_A: TLabel;
    Grid_basis: TStringGrid;
    Label_SOK_X: TLabel;
    Memo_msg: TMemo;
    Label_msg: TLabel;
    BtnExit: TButton;
    BtnStart: TButton;
    Label_PP: TLabel;
    Edit_PP: TEdit;
    Grid_SOK_X: TStringGrid;
    Grid_X: TStringGrid;
    Label_basis: TLabel;
    Label_X: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
  private
    { Private declarations }
    A:LongInt; //свободный член диофантова уравнения
    P:array[1..MAX_N] of LongInt; //коэффииценты уравнения (основания СОК)
    X:array[1..MAX_N] of LongInt; //корни диофантова уравнения
    N:LongInt; //число неизвестных уравнения
    PP:LongInt; //диапазон СОК
    SOK_P:array[1..MAX_N,1..MAX_N] of LongInt; //коэффициенты уравнения в СОК
    SOK_A:array[1..MAX_N] of LongInt; //свободный член уравнения в СОК
    SOK_X:array[1..MAX_N,1..MAX_N] of LongInt; //корни уравнения в СОК
    Basis:array[1..MAX_N] of LongInt; //ортогональные базисы СОК
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Подпрограмма инициализации полей программы при запуске
procedure TForm1.FormCreate(Sender: TObject);
var i:LongInt;
begin
  N:=5;
  P[1]:=3; P[2]:=5; P[3]:=7; P[4]:=11; P[5]:=13;
  A:=1;
  PP:=1; for i:=1 to N do PP:=PP*P[i];
  for i:=1 to N do Grid_koeff.Cells[i-1,0]:=IntToStr(P[i]);
  Edit_A.text:=IntToStr(A);
  Edit_PP.text:=IntToStr(PP);
  Memo_msg.Clear;
end;

//Подпрограмма обработки нажатия на кнопку ВЫХОД
procedure TForm1.BtnExitClick(Sender: TObject);
begin
  close;
end;

//Подпрограмма обработки нажатия на кнопку РАСЧЕТ
procedure TForm1.BtnStartClick(Sender: TObject);
var i,k,max_p,sum,hh:LongInt; flag:boolean;
begin
Memo_msg.Clear;
//Загрузка входных данных
for i:=1 to N do
   P[i]:=StrToInt(Grid_koeff.Cells[i-1,0]);
A:=StrToInt(Edit_A.text);
PP:=1; for i:=1 to N do PP:=PP*P[i];
Edit_PP.text:=IntToStr(PP);
//Проверка входных данных
//Расчет НОД коэффициентов диофантова уравнения
flag:=true;
max_p:=P[1];
for i:=1 to N do
   if P[i]>max_p then max_p:=P[i];
if max_p<2 then flag:=false;
for k:=2 to max_p do
begin
   hh:=0;
   for i:=1 to N do
      if (P[i] mod k)=0 then hh:=hh+1;
   if hh>1 then flag:=false;
end;
//Вывод диагностических сообщений об ошибках
if flag=false then Memo_msg.Lines.Add('Ошибка коэффициентов');
if A<1 then Memo_msg.Lines.Add('Свободный член мал');
//Если все в порядке, то переходим к выполнению расчета
if (flag=true)and(A>0) then
begin
   //Расчет ортогональных базисов
   for i:=1 to N do
   begin
      hh:=PP div P[i];
      for k:=1 to P[i] do
         if (k*hh mod P[i])=1 then basis[i]:=k*hh;
   end;
   //Перевод коэффициентов уравнения в СОК
   for i:=1 to N do
      for k:=1 to N do
         SOK_P[i,k]:=P[i] mod P[k];
   //Перевод свободного члена уравнения в СОК
   for i:=1 to N do
      SOK_A[i]:=A mod P[i];

   //подготовка массива корней к расчету
   for i:=1 to N do
      for k:=1 to N do
         SOK_X[i,k]:=0;
   //Расчет корней x1 -- x(n-1) уравнения в СОК
   for i:=1 to N-1 do
      for k:=0 to P[i+1]-1 do
         if (k*SOK_P[i,i+1] mod P[i+1])=SOK_A[i+1] then SOK_X[i,i+1]:=k;
   //Расчет корня x_n в СОК
   for k:=0 to P[1]-1 do
      if (k*SOK_P[N,1] mod P[1])=SOK_A[1] then SOK_X[N,1]:=k;

   //Перевод корней из СОК в ПСС
   for i:=1 to N do X[i]:=0;
   for i:=1 to N do
      for k:=1 to N do
         X[i]:=X[i]+SOK_X[i,k]*basis[k];
   for i:=1 to N do X[i]:=X[i] mod PP;
   //корректировка x1
   sum:=0;
   for i:=1 to n do sum:=sum+P[i]*X[i];
   sum:=sum-A;
   X[1]:=X[1]-(sum div P[1]);
   //===============================
   //Вывод коэффициентов в СОК
   for i:=1 to N do
      for k:=1 to N do
         Grid_SOK_koeff.Cells[k-1,i-1]:=IntToStr(SOK_P[i,k]);
   //Вывод значения свободного члена в СОК
   for i:=1 to N do
       Grid_SOK_A.Cells[i-1,0]:=IntToStr(SOK_A[i]);
   //Вывод значений корней уравнения в СОК
   for i:=1 to N do
      for k:=1 to N do
         Grid_SOK_X.Cells[k-1,i-1]:=IntToStr(SOK_X[i,k]);
   //Вывод ортогональных базисов
   for i:=1 to N do
       Grid_basis.Cells[i-1,0]:=IntToStr(basis[i]);
   //Вывод значений корней в ПСС
   for i:=1 to N do
       Grid_X.Cells[i-1,0]:=IntToStr(X[i]);
   sum:=0;
   for i:=1 to N do sum:=sum+P[i]*X[i];
   Memo_msg.Lines.Add('Расчет выполнен');
   Memo_msg.Lines.Add('Контроль свободного члена: '+IntToStr(sum));
end;
end;

end.
