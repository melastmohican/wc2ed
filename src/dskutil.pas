
Unit DskUtil;

{$MODE Delphi}

Interface

Uses 
SysUtils;

Const 
  HFILE_ERROR: LongInt = -1;

Type 
  { Common data types}
  TStringBuffer = Record
    Case integer Of 
      0: (bCount: byte;
          cArray: Array[0..254] Of char;);
      1: (str: String[254]);
  End;

Function FindStr(handle: integer; fstr: PChar): longint;
Function ReadAllFile(FileName : PChar; Mode : Integer; handle: LongInt; out cBuf : PChar): Longint;
Function WriteRecord(handle, offset: LongInt;  cBuf : PChar; length: LongInt) : LongInt;
Function Exp2Word(Exp: word): word;
Function Word2Exp(Value: word): word;

Implementation

Function FindStr(handle: longint; fstr: PChar): longint;

Var 
  sb: TStringBuffer;
  buff: array[0..1023] Of char;
  P: PChar;
  i, j: integer;
  pos: integer;
  bFound: boolean;
  filpos, filmax: longint;
Begin
  Result := 0;
  filmax := FileSeek(handle, 0, 2);
  filpos := FileSeek(handle, 0, 0);
  FileRead(handle, buff, 1024);
  sb.str := StrPas(fstr);
  While filmax > filpos Do
    Begin
      i := 0;
      bFound := False;
      While i < 1024 Do
        Begin
          If buff[i] = sb.cArray[0] Then
            Begin
              bFound := False;
              For j := 0 To sb.bCount - 1 Do
                If buff[i + j] = sb.cArray[j] Then
                  bFound := True
                Else
                  bFound := False;
              //if buff[i+j+1] <> #0 then bFound := false;
            End; {if buff[i] = sb.cArray[0]}
          If Not bFound Then
            Inc(i)
          Else
            Begin
              Result := (filpos + i);
              Exit;
            End;
        End; {while i<1024}
      filpos := FileSeek(handle, 0, 1);
      FileRead(handle, buff, 1024);
    End; {while filmax > filpos}
End;


Function ReadAllFile(FileName : PChar; Mode : Integer; handle: LongInt; out cBuf : PChar): Longint;

Var 
  lSize: longint;
Begin
  If handle <> HFILE_ERROR Then
    FileClose(handle);
  handle := FileOpen(FileName, Mode);
  If handle <> HFILE_ERROR Then
    Begin
      lSize := FileSeek(handle, 0, fsFromEnd);
      FileSeek(handle, 0, fsFromBeginning);
      If cBuf <> Nil Then
        Begin
          StrDispose(cBuf);
          cBuf := Nil;
        End;
      cBuf := StrAlloc(lSize + 2);
      ReadAllFile := FileRead(handle, cBuf^, lSize);
    End;
End;

Function WriteRecord(handle, offset: LongInt;  cBuf : PChar; length: LongInt): LongInt;
Begin
  FileSeek(handle, offset, 0);
  WriteRecord := FileWrite(handle, cBuf, length);
End;

Function Exp2Word(Exp: word): word;
Begin
  Result := Exp Mod 100 + (Exp Div 100) * 256;
End;

Function Word2Exp(Value: word): word;
Begin
  Result := Value Mod 256 + (Value Div 256) * 100;
End;

{End of file}
End.
