
Unit About;

{$MODE Delphi}

Interface

Uses Classes, Graphics, Forms, Controls, StdCtrls,
Buttons, ExtCtrls, SysUtils;

Type 
  TAboutBox = Class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Notes: TLabel;
    Product: TMemo;
    Logo: TImage;
    Private 
    { Private declarations }
    Public 
    { Public declarations }
  End;

Var 
  AboutBox: TAboutBox;

Implementation

{$R *.lfm}

End.
// End of File
