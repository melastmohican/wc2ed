unit DskUtil;

{$MODE Delphi}

interface

uses
  SysUtils;

const
 HFILE_ERROR = -1;

type
  { Common data types}
  { var sb: TStringBuffer;
  sb.Count := Byte( Actual lentgh of cArray)
  sb.cArray := address where charracters are copied
  }
  TStringBuffer = record
   case Integer of
     0: (bCount: Byte; cArray : Array[0..254] of Char;);
     1: (str: String[254]);
  end;

function FindStr(hfile: Integer; fstr: PChar) : LongInt;
function Exp2Word(Exp: Word) : Word;
function Word2Exp(Value: Word) : Word;

implementation

function FindStr(hfile: LongInt; fstr: PChar) : Longint;
var
 sb: TStringBuffer;
 buff: Array[0..1023] of char;
 P: PChar;
 i,j: integer;
 pos: integer;
 bFound: Boolean;
 filpos,filmax: Longint;
begin
Result:= 0;
filmax := FileSeek(hfile,0,2);
filpos := FileSeek(hfile,0,0);
FileRead(hfile,buff,1024);
sb.str := StrPas(fstr);
while filmax > filpos do
begin
 i := 0;
 bFound := false;
 while i<1024 do
  begin
   if buff[i] = sb.cArray[0] then
    begin
     bFound := false;
     for j:= 0 to sb.bCount-1 do
       if buff[i+j] = sb.cArray[j] then bFound := true
       else bFound := false;
     //if buff[i+j+1] <> #0 then bFound := false;
    end; {if buff[i] = sb.cArray[0]}
   if not bFound then
    inc(i)
   else
    begin
     Result:= (filpos + i);
     Exit;
    end;
 end; {while i<1024}
 filpos := FileSeek(hfile,0,1);
 FileRead(hfile,buff,1024);
end; {while filmax > filpos}
end;

function Exp2Word(Exp: Word) : Word;
begin
 Result := Exp mod 100 + (Exp div 100) * 256;
end;

function Word2Exp(Value: Word) : Word;
begin
 Result := Value mod 256 + (Value div 256) * 100;
end;

{End of file}
end.
