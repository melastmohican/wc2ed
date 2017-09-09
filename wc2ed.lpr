program wc2ed;

{$MODE Delphi}

uses
  Forms, Interfaces,
  MainEd in 'src/mained.pas' {MainForm},
  DskUtil in 'src/dskutil.pas',
  wc2unit in 'src/wc2unit.pas',
  About in 'src/about.pas' {AboutBox};

{.$R *.RES}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Warcraft II Save Editor';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
