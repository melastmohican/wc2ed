unit About;

{$MODE Delphi}

interface

uses Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils, ComCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Notes: TLabel;
    Product: TMemo;
    Logo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation
{$R *.lfm}

end. // End of File

