unit MainEd;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,
  ComCtrls, Menus, ExtCtrls,
  About, DskUtil, wc2Unit, Buttons, StdCtrls, Spin, IniFiles;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    mFile: TMenuItem;
    mOpen: TMenuItem;
    mSave: TMenuItem;
    N1: TMenuItem;
    mExit: TMenuItem;
    mHelp: TMenuItem;
    mAbout: TMenuItem;
    Timer: TTimer;
    OpenDlg: TOpenDialog;
    Toolbar: TPanel;
    SpeedButton1: TSpeedButton;
    AppSpace: TPanel;
    Panel1: TPanel;
    GameName: TPanel;
    Label1: TLabel;
    SaveBtn: TSpeedButton;
    GameTree: TTreeView;
    ObjPan: TPanel;
    UnitType: TComboBox;
    Label2: TLabel;
    EnergyEd: TSpinEdit;
    ManaEd: TSpinEdit;
    SideCB: TComboBox;
    ColorCB: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ResoEd: TSpinEdit;
    Label9: TLabel;
    UnitBmp: TComboBox;
    Label10: TLabel;
    UnitMenu: TComboBox;
    Label11: TLabel;
    TypeLab: TLabel;
    MenuLab: TLabel;
    BmpLab: TLabel;
    ResPan: TPanel;
    Gold: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GoldEd: TSpinEdit;
    LumberEd: TSpinEdit;
    OilEd: TSpinEdit;
    procedure TimerTimer(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure mOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mAboutClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure GameTreeClick(Sender: TObject);
  private
    { Private declarations }
    OldIndex: longint;
    OldNode: TTreeNode;
    procedure GetUnits;
    procedure ClearLists;
    procedure ReadRecord;
    procedure SaveUnitRecord(pRec: PUnitRec);
    procedure SaveResRecord(pRec: PResRec);
    procedure SaveData;
    procedure LogRecord;
  public
    { Public declarations }
  end;

const
  cNodes: array[0..8] of PChar = ('Red', 'Blue', 'Green', 'Violet', 'Orange',
    'Black', 'White', 'Yellow', 'Neutral');
  cSubNodes: array[0..3] of PChar = ('Resources', 'Units', 'Objects', 'Expansion');

var
  MainForm: TMainForm;
  UnitOffs: longint;
  lSize, lRead: longint;
  URec: PUnitRec;
  RRec: PResRec;
  FHandle: longint;
  cBuf: PChar;
  UnitList, ResList: TList;
  iCount: integer;
  Stat: AStatus;

implementation

{$R *.lfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FHandle := HFILE_ERROR;
  cBuf := nil;
  OldIndex := -1;
  ResPan.Visible := False;
  ObjPan.Visible := False;
  OldNode := nil;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if cBuf <> nil then
  begin
    StrDispose(cBuf);
    cBuf := nil;
  end;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  StatusBar.Panels[0].Text := TimeToStr(Now);
end;

procedure TMainForm.mExitClick(Sender: TObject);
begin
  SaveData;
  Close;
end;

procedure TMainForm.mOpenClick(Sender: TObject);
var
  sb: TStringBuffer;
  pos: longint;
  tst: char;
  i: integer;
begin
  if OpenDlg.Execute then
  begin
    sb.str := OpenDlg.FileName + #0;
    FHandle := ReadAllFile(sb.cArray, fmOpenReadWrite or fmShareExclusive, FHandle, cBuf);
    if cBuf = nil then
    begin
      MessageDlg('Cannot open ' + ExtractFileName(OpenDlg.FileName), mtError, [mbOK], 0);
    end
    else
    begin
      GameName.Caption := Copy(StrPas(cBuf), 1, Length(StrPas(cBuf)) - 1);
      GetUnits;
      ResPan.Visible := False;
      ObjPan.Visible := False;
    end;
  end;
end;

procedure TMainForm.GetUnits;
var
  RootNode, PlayerNode, UnitNode, ResNode, ObjNode, ExpNode: TTreeNode;
  bExpans: boolean;
  pCurrUnit: PChar;
  i, x: integer;
  pLong: ^longint;
  sExpand: string;
begin
  ClearLists;
  bExpans := False;
  UnitList := TList.Create;
  ResList := TList.Create;
  GameTree.Items.Clear;
  New(pLong);
  for i := 0 to 7 do
  begin
    Stat[i] := integer(cBuf[$2F4 + i]);
    New(RRec);
    RRec^.iOffset := $1B4 + 4 * i;
    StrMove(PChar(pLong), cBuf + $1B4 + 4 * i, Sizeof(longint));
    RRec.lLumber := pLong^;
    StrMove(PChar(pLong), cBuf + $1F4 + 4 * i, Sizeof(longint));
    RRec.lGold := pLong^;
    StrMove(PChar(pLong), cBuf + $234 + 4 * i, Sizeof(longint));
    RRec.lOil := pLong^;
    ResList.Add(RRec);
  end;
  Dispose(pLong);
  iCount := 0;
  UnitOffs := $5A0F2;
  pCurrUnit := cBuf + UnitOffs;
  repeat
    New(URec);
    StrMove(PChar(URec), pCurrUnit, SizeOf(TUnitRec) - SizeOf(longint));
    URec^.iOffset := longint(pCurrUnit - cBuf);
    if (URec^.wEnergy > 0) then
    begin
      UnitList.Add(URec);
    end;
    pCurrUnit := pCurrUnit - (SizeOf(TUnitRec) - SizeOf(longint));
  until pCurrUnit < cBuf + $46C7A;
  RootNode := GameTree.Items.Add(nil, 'Players');
  PlayerNode := GameTree.Items.AddChild(RootNode, cNodes[8]);
  UnitNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[1]);
  ObjNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[2]);
  for x := 0 to UnitList.Count - 1 do
  begin
    URec := UnitList.Items[x];
    if (URec^.bType > $68) then
      bExpans := True;
  end;
  if (bExpans) then
    ExpNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[3]);
  for x := 0 to UnitList.Count - 1 do
  begin
    URec := UnitList.Items[x];
    if (URec^.bSide = $0F) and (URec^.bType < $3A) then
      GameTree.Items.AddChildObject(UnitNode, UnitType.Items[URec^.bType],
        UnitList.Items[x]);
    if (URec^.bSide = $0F) and (URec^.bType >= $3A) then
      GameTree.Items.AddChildObject(ObjNode, UnitType.Items[URec^.bType],
        UnitList.Items[x]);
    if (bExpans) and (URec^.bSide = $0F) and (URec^.bType > $68) then
    begin
      sExpand := Format('%d(%0:xh) %d(%1:xh) %d(%2:xh)',
        [URec^.bType, URec^.bBitmap, URec^.bMenu]);
      GameTree.Items.AddChildObject(ExpNode, sExpand, UnitList.Items[x]);
    end;
  end;
  for i := 0 to 7 do
  begin
    if (Stat[i] < stNone) then
    begin
      PlayerNode := GameTree.Items.AddChild(RootNode, cNodes[i]);
      ResNode := GameTree.Items.AddChildObject(PlayerNode, cSubNodes[0], ResList.Items[i]);
      UnitNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[1]);
      ObjNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[2]);
      if (bExpans) then
        ExpNode := GameTree.Items.AddChild(PlayerNode, cSubNodes[3]);
      for x := 0 to UnitList.Count - 1 do
      begin
        URec := UnitList.Items[x];
        if (URec^.bSide = i) and (URec^.bType < $3A) then
          GameTree.Items.AddChildObject(UnitNode, UnitType.Items[URec^.bType],
            UnitList.Items[x]);
        if (URec^.bSide = i) and (URec^.bType >= $3A) then
          GameTree.Items.AddChildObject(ObjNode, UnitType.Items[URec^.bType],
            UnitList.Items[x]);
        if (bExpans) and (URec^.bSide = i) and (URec^.bType > $68) then
        begin
          sExpand := Format('%d(%0:xh) %d(%1:xh) %d(%2:xh)',
            [URec^.bType, URec^.bBitmap, URec^.bMenu]);
          GameTree.Items.AddChildObject(ExpNode, sExpand, UnitList.Items[x]);
        end;
      end;
    end;
  end;
  RootNode.Selected := True;
end;

procedure TMainForm.ClearLists;
begin
  UnitList.Free;
  ResList.Free;
end;

procedure TMainForm.mAboutClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.ReadRecord;
begin
  if GameTree.Selected = nil then
    Exit;
  OldIndex := GameTree.Selected.AbsoluteIndex;
  if GameTree.Selected.Text = cSubNodes[0] then
  begin
    RRec := GameTree.Selected.Data;
    GoldEd.Text := IntToStr(RRec^.lGold);
    LumberEd.Text := IntToStr(RRec^.lLumber);
    OilEd.Text := IntToStr(RRec^.lOil);
    ObjPan.Visible := False;
    ObjPan.SendToBack;
    ResPan.Visible := True;
    ResPan.BringToFront;
  end
  else if GameTree.Selected.Data <> nil then
  begin
    URec := GameTree.Selected.Data;
    UnitType.ItemIndex := URec^.bType;
    TypeLab.Caption := Format('%d', [URec^.bType]);
    UnitBmp.ItemIndex := URec^.bBitmap;
    BmpLab.Caption := Format('%d', [URec^.bBitmap]);
    UnitMenu.ItemIndex := URec^.bMenu;
    MenuLab.Caption := Format('%d', [URec^.bMenu]);
    EnergyEd.Text := IntToStr(URec^.wEnergy);
    ManaEd.Text := IntToStr(URec^.bMana);
    if URec^.bSide = $0F then
      SideCB.ItemIndex := 0
    else
      SideCB.ItemIndex := URec^.bSide + 1;
    if URec^.bColor = $0F then
      ColorCB.ItemIndex := 0
    else
      ColorCB.ItemIndex := URec^.bColor + 1;
    ResoEd.Text := IntToStr(URec^.wResource * 100);
    ResPan.Visible := False;
    ResPan.SendToBack;
    ObjPan.Visible := True;
    ObjPan.BringToFront;
  end;
end;

procedure TMainForm.SaveUnitRecord(pRec: PUnitRec);
begin
  if (UnitType.ItemIndex = -1) then
    pRec^.bType := StrToInt(TypeLab.Caption)
  else
    pRec^.bType := UnitType.ItemIndex;
  if (UnitBmp.ItemIndex = -1) then
    pRec^.bBitmap := StrToInt(BmpLab.Caption)
  else
    pRec^.bBitmap := UnitBmp.ItemIndex;
  if (UnitMenu.ItemIndex = -1) then
    pRec^.bMenu := StrToInt(MenuLab.Caption)
  else
    pRec^.bMenu := UnitMenu.ItemIndex;
  pRec^.wEnergy := StrToInt(EnergyEd.Text);
  pRec^.bMana := StrToInt(ManaEd.Text);
  if SideCB.ItemIndex = 0 then
    pRec^.bSide := $0F
  else
    pRec^.bSide := SideCB.ItemIndex - 1;
  if ColorCB.ItemIndex = 0 then
    pRec^.bColor := $0F
  else
    pRec^.bColor := ColorCB.ItemIndex - 1;
  pRec^.wResource := StrToInt(ResoEd.Text) div 100;
end;

procedure TMainForm.SaveResRecord(pRec: PResRec);
begin
  pRec^.lGold := StrToInt(GoldEd.Text);
  pRec^.lLumber := StrToInt(LumberEd.Text);
  pRec^.lOil := StrToInt(OilEd.Text);
end;

procedure TMainForm.SaveData;
begin
  if FHandle <> HFILE_ERROR then
  begin
    if OldNode.Text = cSubNodes[0] then
      SaveResRecord(RRec)
    else if OldNode.Data <> nil then
      SaveUnitRecord(URec);
  end;
end;

procedure TMainForm.SaveBtnClick(Sender: TObject);
begin
  SaveData;
end;

procedure TMainForm.GameTreeClick(Sender: TObject);
var
  pLong: ^longint;
begin
  if (FHandle <> HFILE_ERROR) and (GameTree.Selected <> nil) then
  begin
    if (GameTree.Selected.AbsoluteIndex <> OldIndex) and (OldIndex > -1) then
    begin
      if (OldNode <> nil) then
        if (OldNode.Text = cSubNodes[0]) then
        begin
          New(pLong);
          SaveResRecord(RRec);
          pLong^ := RRec^.lLumber;
          WriteRecord(FHandle,RRec^.iOffset,PChar(pLong), SizeOf(longint));
          pLong^ := RRec^.lGold;
          WriteRecord(FHandle,RRec^.iOffset + $40,PChar(pLong), SizeOf(longint));
          pLong^ := RRec^.lOil;
          WriteRecord(FHandle,RRec^.iOffset + $80,PChar(pLong), SizeOf(longint));
          Dispose(pLong);
        end
        else if OldNode.Data <> nil then
        begin
          SaveUnitRecord(URec);
          LogRecord;
          WriteRecord(FHandle,URec^.iOffset,PChar(URec),SizeOf(TUnitRec) - SizeOf(longint));
        end;
    end;
    ReadRecord;
    if GameTree.Selected <> nil then
      OldNode := GameTree.Selected;
  end;
end;

procedure TMainForm.LogRecord;
const
  cLog = 'Wc2Ed.log';
var
  aRec: array[0..135] of byte;
  buff, path: array[0..255] of char;
  cSection, cKey, cString: array[0..255] of char;
  pFile: PChar;
  i: integer;
  ini: TINIFile;
begin
  if FHandle <> HFILE_ERROR then
  begin
    if OldNode.Data <> nil then
    begin
      StrMove(PChar(@aRec), PChar(URec), SizeOf(TUnitRec){ - SizeOf(LongInt)});
      StrPCopy(buff, Application.ExeName);
      path := ExpandFileName(buff);
      StrCopy(pFile, cLog);
      ini := TINIFile.Create(cLog);
      StrPCopy(cSection, OldNode.Text + Format('%x', [URec.iOffset]));
      for i := 0 to 16 do
      begin
        StrPCopy(cKey, Format('%5.5x', [(URec.iOffset + i * 8)]));
        StrPCopy(cString, Format('%2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x %2.2x',
          [aRec[i * 8], aRec[i * 8 + 1], aRec[i * 8 + 2], aRec[i * 8 + 3], aRec[i * 8 + 4],
          aRec[i * 8 + 5], aRec[i * 8 + 6], aRec[i * 8 + 7]]));
        ini.WriteString(cSection,cKey,cString);
      end;
    end;
  end;
end;




end.
