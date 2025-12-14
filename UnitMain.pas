{*
  MIT License
  Copyright (c) 2024 TextInjectToWindows contributors

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

  DISCLAIMER: This software is provided for informational and experimental
  purposes only. Use it at your own risk and ensure compliance with applicable
  laws and policies.
*}

unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.StrUtils,
  UnitTypes,
  System.TypInfo,
  DateUtils,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  UnitFunction
  ;



type
  TFormMain = class(TForm)
    pnlControlPanel: TPanel;
    btnStartTextLoop: TButton;
    btnActivateWindow: TButton;
    cmbWindowList: TComboBox;
    lblWindowList: TLabel;
    btnRefreshWindowList: TButton;
    btnStopTextLoop: TButton;
    lblLoopPrompt: TLabel;
    lblLoopStatus: TLabel;
    tmrStatus: TTimer;
    lblCurrentTime: TLabel;
    pgControl: TPageControl;
    tabTextToRDP: TTabSheet;
    tabTest: TTabSheet;
    tabSettings: TTabSheet;
    memoTextSource: TMemo;
    edtTextToSend: TEdit;
    lblTextPrompt: TLabel;
    btnSendRdpText: TButton;
    btnSendMouseClick: TButton;
    lblTextTabX: TLabel;
    lblTextTabY: TLabel;
    lblDurationHint: TLabel;
    cmbDurationHours: TComboBox;
    dtpStartTime: TDateTimePicker;
    dtpStopDate: TDateTimePicker;
    dtpStopTime: TDateTimePicker;
    lblPeriodHeader: TLabel;
    lblStartHeader: TLabel;
    lblEndHeader: TLabel;
    lblStartValue: TLabel;
    lblEndValue: TLabel;
    lblTargetX: TLabel;
    edtClickX: TEdit;
    lblTargetY: TLabel;
    edtClickY: TEdit;
    btnCaptureCoordinates: TButton;
    lblWindowHandle: TLabel;
    lblWindowHandleTitle: TLabel;
    dtpStartDate: TDateTimePicker;
    btnSetNow: TButton;
    chkValidateTimes: TCheckBox;
    chkStartImmediately: TCheckBox;
    chkRandomizeClicks: TCheckBox;
    cmbRandomDeviation: TComboBox;
    lblRandomDeviationInfo: TLabel;
    memoInstructions: TMemo;
    chkUsePeriod: TCheckBox;
    edtUserName: TEdit;
    edtUserPassword: TEdit;
    btnEnterUserName: TButton;
    btnEnterUserPassword: TButton;
    lblStatusMessage: TLabel;
    memoLog: TMemo;
    procedure btnSendRdpTextClick(Sender: TObject);
    procedure btnSendMouseClickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshWindowListClick(Sender: TObject);
    procedure btnActivateWindowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStartTextLoopClick(Sender: TObject);
    procedure btnStopTextLoopClick(Sender: TObject);
    procedure tmrStatusTimer(Sender: TObject);
    procedure cmbWindowListChange(Sender: TObject);
    procedure btnCaptureCoordinatesClick(Sender: TObject);
    procedure dtpStartDateChange(Sender: TObject);
    procedure dtpStopDateChange(Sender: TObject);
    procedure btnSetNowClick(Sender: TObject);
    procedure cmbRandomDeviationChange(Sender: TObject);
    procedure btnEnterUserNameClick(Sender: TObject);
    procedure btnEnterUserPasswordClick(Sender: TObject);
  private
    procedure SendText(const S: string);
    procedure ClickAtScreen(X, Y: Integer);
    procedure ProcessEachChar(Ch: Char);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

{
  type
    PFindWindowData = ^TFindWindowData;
    TFindWindowData = record
      Pattern: string;
      Result: HWND;
    end;
}

procedure TFormMain.FormCreate(Sender: TObject);
var
  i:integer;
begin
  Caption := 'RDP input demo';
  lblTextPrompt.Caption := ':';
  lblTextTabX.Caption := 'X:';
  lblTextTabY.Caption := 'Y:';
  edtTextToSend.Text := 'test 123';
  edtClickX.Text := '500';
  edtClickY.Text := '300';
  memoLog.Lines.Add('   ' + DateTimeToStr(now));
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  btnRefreshWindowListClick(sender);
  cmbWindowList.ItemIndex:=0;
  cmbDurationHours.ItemIndex:=0;
end;

procedure TFormMain.SendText(const S: string);   // òîëüêî äëÿ ëàòèíèöû/öèôð
var
  Inputs: array of TInput;
  i, idx: Integer;
  vk: Word;
  shiftState: SHORT;
  needShift: Boolean;
begin
  if S = '' then Exit;
  if Stop then exit;


  SetLength(Inputs, Length(S) * 4); // çàïàñ (keydown/keyup + shift)

  idx := 0;

  for i := 1 to Length(S) do begin
    shiftState := VkKeyScan(S[i]);
    sleep (50+Round(random(RND_deviation)*10));
    if shiftState = -1 then
      Continue; // ñèìâîë íå ìàïèòñÿ — ïðîïóñêàåì (íóæíî äîðàáîòàòü)

      vk := Word(shiftState and $FF);
    needShift := (shiftState and $0100) <> 0;

    // Íàæèìàåì Shift, åñëè íàäî
    if needShift then
    begin
      ZeroMemory(@Inputs[idx], SizeOf(TInput));
      Inputs[idx].Itype := INPUT_KEYBOARD;
      Inputs[idx].ki.wVk := VK_SHIFT;
      Inputs[idx].ki.dwFlags := 0;
      Inc(idx);
      sleep (10+round(random(RND_deviation)*10));
    end;

    // Íàæàòèå êëàâèøè
    ZeroMemory(@Inputs[idx], SizeOf(TInput));
    Inputs[idx].Itype := INPUT_KEYBOARD;
    Inputs[idx].ki.wVk := vk;
    Inputs[idx].ki.dwFlags := 0;
    Inc(idx);
    sleep (10+Round(random(RND_deviation)*10));
procedure TFormMain.tmrStatusTimer(Sender: TObject);
  lblCurrentTime.Caption:=TimeToStr(now);
  if stop then lblLoopStatus.Caption:='!' else lblLoopStatus.Caption:='__'
procedure TFormMain.cmbWindowListChange(Sender: TObject);
  ActivateWindowByHWIND (HWND(cmbWindowList.Items.Objects[cmbWindowList.ItemIndex]));
  lblWindowHandle.Caption:=IntToStr((HWND(cmbWindowList.Items.Objects[cmbWindowList.ItemIndex])));
procedure TFormMain.cmbRandomDeviationChange(Sender: TObject);
    RND_deviation:=StrToInt (cmbRandomDeviation.Text);
    cmbRandomDeviation.ItemIndex:=0;
procedure TFormMain.dtpStartDateChange(Sender: TObject);
  if chkValidateTimes.Checked then
  dtpStartDate.DateTime := DTP.DateTime;
  dtpStartTime.DateTime := DTP.DateTime;
  if chkUsePeriod.Checked then begin
    dtpStopDate.DateTime := DTP.DateTime+1/24*StrToInt(cmbDurationHours.Text);
    dtpStopTime.DateTime := DTP.DateTime+1/24*StrToInt(cmbDurationHours.Text);
  dtStart:= dtpStartDate.DateTime;
  dtEnd:= dtpStopTime.DateTime;
  lblStartValue.Caption:=DateTimeToStr(dtStart);
  lblEndValue.Caption:=DateTimeToStr(dtEnd);
procedure TFormMain.dtpStopDateChange(Sender: TObject);
  if chkValidateTimes.Checked then

  if chkUsePeriod.Checked then
    if (DTP.DateTime-1/24*StrToInt(cmbDurationHours.Text))<now then exit;
  dtpStopDate.DateTime := DTP.DateTime;
  dtpStopDate.DateTime := DTP.DateTime;
  if chkUsePeriod.Checked then begin
    dtpStartTime.DateTime := DTP.DateTime-1/24*StrToInt(cmbDurationHours.Text);
    dtpStartTime.DateTime := DTP.DateTime-1/24*StrToInt(cmbDurationHours.Text);
  dtStart:= dtpStartDate.DateTime;
  dtEnd:= dtpStopTime.DateTime;
  lblStartValue.Caption:=DateTimeToStr(dtStart);
  lblEndValue.Caption:=DateTimeToStr(dtEnd);
procedure TFormMain.btnEnterUserNameClick(Sender: TObject);
  X := StrToIntDef(edtClickX.Text, 0);
  Y := StrToIntDef(edtClickY.Text, 0);
  Text := edtUserName.Text;
  memoLog.Lines.Add('  ' + DateTimeToStr(now));
procedure TFormMain.btnEnterUserPasswordClick(Sender: TObject);
begin
  X := StrToIntDef(edtClickX.Text, 0);
  Y := StrToIntDef(edtClickY.Text, 0);
  Text := edtUserPassword.Text;
  memoLog.Lines.Add('  ' + DateTimeToStr(now));
procedure TFormMain.btnSendRdpTextClick(Sender: TObject);
begin
  SendText(edtTextToSend.Text);
procedure TFormMain.btnRefreshWindowListClick(Sender: TObject);
  FillVisibleWindowsCombo(cmbWindowList);
  memoLog.Lines.Add('   ' + DateTimeToStr(now));
procedure TFormMain.btnSetNowClick(Sender: TObject);
  dtpStartDate.DateTime := now;
  dtpStartTime.DateTime := now;
  if chkUsePeriod.Checked then begin
    dtpStopDate.DateTime := now+1/24*StrToInt(cmbDurationHours.Text);
    dtpStopTime.DateTime := now+1/24*StrToInt(cmbDurationHours.Text);
procedure TFormMain.btnActivateWindowClick(Sender: TObject);
  if not ActivateWindowByTitlePart(cmbWindowList.Text) then
    ShowMessage(' "'+cmbWindowList.Text+'"  ');
  memoLog.Lines.Add('  "'+cmbWindowList.Text+'"    ' + DateTimeToStr(now));
procedure TFormMain.btnStartTextLoopClick(Sender: TObject);
  memoLog.Lines.Add('     ' + DateTimeToStr(now));
  if chkUsePeriod.Checked then begin
    _EndDT:= dt+1/24*StrToInt(cmbDurationHours.Text);
  X := StrToIntDef(edtClickX.Text, 0);
  Y := StrToIntDef(edtClickY.Text, 0);
  memoLog.Lines.Add('      ' + DateTimeToStr(_StartDT));
  memoLog.Lines.Add('      ' + DateTimeToStr(_EndDT));
  if stop then lblLoopStatus.Caption:='!' else lblLoopStatus.Caption:='__';
    lblStatusMessage.Caption:= '  .  ' + IntToStr(SecondsBetween (_StartDT, now))+' ,.';
    lblCurrentTime.Caption:= DateTimeToStr(now);
      lblCurrentTime.Caption:='';
      lblStatusMessage.Caption:='';
  lblCurrentTime.Caption:='';
  lblStatusMessage.Caption:='';
    ProcessMemoWithCallback(memoTextSource, ProcessEachChar);
        ActivateWindowByTitlePart(cmbWindowList.Text);
    memoLog.Lines.Add('     '+IntToStr(i)+'   :' + DateTimeToStr(_StartDT));
procedure TFormMain.btnStopTextLoopClick(Sender: TObject);
  if stop then lblLoopStatus.Caption:='!' else lblLoopStatus.Caption:='__';
  memoLog.Lines.Add('   ' + DateTimeToStr(now));
procedure TFormMain.btnCaptureCoordinatesClick(Sender: TObject);
  edtClickX.Text := IntToStr(X);
  edtClickY.Text:= IntToStr(Y);
  memoLog.Lines.Add('    '+edtClickX.Text+'/'+ edtClickY.Text + '   ' + DateTimeToStr(now));
procedure TFormMain.btnSendMouseClickClick(Sender: TObject);
  X := StrToIntDef(edtClickX.Text, 0);
  Y := StrToIntDef(edtClickY.Text, 0);
  if ChBx_period.Checked then
    if (DTP.DateTime-1/24*StrToInt(ComboBox2.Text))<now then exit;

  DTP_stop_date.DateTime := DTP.DateTime;
  DTP_stop_date.DateTime := DTP.DateTime;
  if ChBx_period.Checked then begin
    DTP_start_time.DateTime := DTP.DateTime-1/24*StrToInt(ComboBox2.Text);
    DTP_start_time.DateTime := DTP.DateTime-1/24*StrToInt(ComboBox2.Text);
  end;
  dtStart:= DTP_start_date.DateTime;
  dtEnd:= DTP_stop_time.DateTime;
  LblDTStart.Caption:=DateTimeToStr(dtStart);
  LblDTEnd.Caption:=DateTimeToStr(dtEnd);
end;

procedure TFormMain.BtnEnterUserNameClick(Sender: TObject);
var
  i, X,Y:integer;
  Text:string;
begin
  X := StrToIntDef(edtX.Text, 0);
  Y := StrToIntDef(edtY.Text, 0);
  ClickAtScreen(X, Y);
  Stop:=false;
  Text := EdtUserName.Text;
  for i := 1 to Length(Text) do begin
    ProcessEachChar(Text[i]);
    sleep (10);
  end;
  MemoLog.Lines.Add('îòïðàâëåí ëîãèí ' + DateTimeToStr(now));
end;

procedure TFormMain.BtnEnterUserPassClick(Sender: TObject);
var
  i, X,Y:integer;
  Text:string;
begin
  X := StrToIntDef(edtX.Text, 0);
  Y := StrToIntDef(edtY.Text, 0);
  ClickAtScreen(X, Y);
  Stop:=false;
  Text := EdtUserPass.Text;
  for i := 1 to Length(Text) do begin
    ProcessEachChar(Text[i]);
    sleep (10);
  end;
  MemoLog.Lines.Add('îòïðàâëåí ïàðîëü ' + DateTimeToStr(now));
end;

procedure TFormMain.btnSendTextClick(Sender: TObject);
begin
  SendText(edtText.Text);
end;

procedure TFormMain.BtnWinClick(Sender: TObject);
begin
  FillVisibleWindowsCombo(ComboBox1);
  MemoLog.Lines.Add('ñêàí îêîí  ' + DateTimeToStr(now));
end;

procedure TFormMain.Btn_NowClick(Sender: TObject);
begin
  DTP_start_date.DateTime := now;
  DTP_start_time.DateTime := now;
  if ChBx_period.Checked then begin
    DTP_stop_date.DateTime := now+1/24*StrToInt(ComboBox2.Text);
    DTP_stop_time.DateTime := now+1/24*StrToInt(ComboBox2.Text);
  end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  if not ActivateWindowByTitlePart(ComboBox1.Text) then
    ShowMessage('Îêíî "'+ComboBox1.Text+'" íå íàéäåíî');
  MemoLog.Lines.Add('âûâîä îêíà "'+ComboBox1.Text+'" â òîï  ' + DateTimeToStr(now));
end;

procedure TFormMain.ProcessEachChar(Ch: Char);
begin
  SendText(ch);
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  X, Y, i: Integer;
  Inp: TInput;
  delta_dt, _StartDT, _EndDT: TDateTime;
begin
  i:=0;
  MemoLog.Lines.Add('çàïóùåí öèêë ïå÷àòè òåêñòà  ' + DateTimeToStr(now));
  dt:=now;
  if ChBx_period.Checked then begin
    _StartDT:=now;
    _EndDT:= dt+1/24*StrToInt(ComboBox2.Text);
  end else begin
    if (dtEnd<=dtStart) or (dtEnd<=now) then begin
      ShowMessage('Íåâåðíî çàäàíû äèàïàçîíû âðåìåíè (âûáðàí ðåæèì ðàáîòû îò äàòû/âðåìåíè äî äàòû/âðåìåíè!');
      exit;
    end;
    _StartDT:=dtStart;
    _EndDT:=dtEnd;
  end;
  X := StrToIntDef(edtX.Text, 0);
  Y := StrToIntDef(edtY.Text, 0);
  MemoLog.Lines.Add('âðåìÿ êîãäà ïå÷àòü äîëæíà íà÷àòüñÿ  ' + DateTimeToStr(_StartDT));
  MemoLog.Lines.Add('âðåìÿ êîãäà ïå÷àòü äîëæíà îñòàíîâèòüñÿ  ' + DateTimeToStr(_EndDT));
  ClickAtScreen(X, Y);
  Stop:=false;
  if stop then Label4.Caption:='ÍÅÒ!' else Label4.Caption:='_äà_';
  while now<=_StartDT do begin
    sleep (233);
    LabeMessage.Caption:= 'Îæèäàíèå ñòàðòà öèêëà. Æäåì ' + IntToStr(SecondsBetween (_StartDT, now))+' ,ñåê.';
    LabelTime.Caption:= DateTimeToStr(now);
    application.ProcessMessages;
    if Stop then begin
      LabelTime.Caption:='';
      LabeMessage.Caption:='';
      exit;
    end;
  end;
  LabelTime.Caption:='';
  LabeMessage.Caption:='';
  while (now)<(_EndDT) do begin
    i:=i+1;
    ProcessMemoWithCallback(Memo1, ProcessEachChar);
{
      try
        ActivateWindowByTitlePart(ComboBox1.Text);
      except
      end;
      sleep (300);
      ClickAtScreen(X, Y);
      sleep (300);
      for i := 0 to 10 do begin
        SendText ('sVVV___ðà'+IntToStr(i)+'  ');
        sleep (500)  ;
      end;
      ZeroMemory(@Inp, SizeOf(Inp));
      Inp.Itype := INPUT_KEYBOARD;
      Inp.ki.wVk := VK_RETURN;

      SendInput(1, Inp, SizeOf(TInput)); // down
      Inp.ki.dwFlags := KEYEVENTF_KEYUP;
      SendInput(1, Inp, SizeOf(TInput)); // up

      for i := 0 to 10 do begin
        SendText ('ssr___Ngh'+IntToStr(i)+'  ');
        sleep (500)  ;
      end;
}
    sleep (1200+Round(random(RND_deviation)*100))  ;
    MemoLog.Lines.Add('çàâåðøåí ïðîõîä òåêñòà ¹  '+IntToStr(i)+'   :' + DateTimeToStr(_StartDT));
    application.ProcessMessages;
    if Stop then exit;
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  Stop:=true;
  if stop then Label4.Caption:='ÍÅÒ!' else Label4.Caption:='_äà_';
  MemoLog.Lines.Add('îñòàíîâ öèêëà âûâîäà ' + DateTimeToStr(now));
end;

procedure TFormMain.Button4Click(Sender: TObject);
var
  X, Y: Integer;
begin
  WaitForLeftClick(X, Y);

  EdtX.Text := IntToStr(X);
  EdtY.Text:= IntToStr(Y);
  MemoLog.Lines.Add('îïðåäåëåíû êîîðäèíàòû òî÷êè ââîäà '+EdtX.Text+'/'+ EdtY.Text + '   ' + DateTimeToStr(now));
end;

procedure TFormMain.btnClickClick(Sender: TObject);
var
  X, Y, i: Integer;
  Inp: TInput;

begin
  X := StrToIntDef(edtX.Text, 0);
  Y := StrToIntDef(edtY.Text, 0);
  ClickAtScreen(X, Y);
  for i := 0 to 10 do begin
    SendText ('sVVV___ðà'+IntToStr(i)+'  ');
    sleep (1000)  ;
  end;
  ZeroMemory(@Inp, SizeOf(Inp));
  Inp.Itype := INPUT_KEYBOARD;
  Inp.ki.wVk := VK_RETURN;
  SendInput(1, Inp, SizeOf(TInput)); // down

  Inp.ki.dwFlags := KEYEVENTF_KEYUP;
  SendInput(1, Inp, SizeOf(TInput)); // up
  for i := 0 to 10 do begin
    SendText ('ssr___Ngh'+IntToStr(i)+'  ');
    sleep (1000)  ;
  end;
end;

end.
