program wc2ed;

uses
  Forms,
  MainEd in 'src\MainEd.pas' {MainForm},
  DskUtil in 'src\Dskutil.pas',
  wc2unit in 'src\wc2unit.pas',
  About in 'src\About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Warcraft II Save Editor';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
