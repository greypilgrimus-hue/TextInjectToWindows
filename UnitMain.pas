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
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BtnWin: TButton;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    LabelTime: TLabel;
    PgCtrl: TPageControl;
    TbSht_TextToRDP: TTabSheet;
    TbSht_test: TTabSheet;
    TbSht_Settings: TTabSheet;
    Memo1: TMemo;
    edtText: TEdit;
    lblText: TLabel;
    btnSendText: TButton;
    btnClick: TButton;
    lblX: TLabel;
    lblY: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    DTP_start_time: TDateTimePicker;
    DTP_stop_date: TDateTimePicker;
    DTP_stop_time: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblDTStart: TLabel;
    LblDTEnd: TLabel;
    Label5: TLabel;
    edtX: TEdit;
    Label6: TLabel;
    edtY: TEdit;
    Button5: TButton;
    Label_HWIND: TLabel;
    Label13: TLabel;
    DTP_start_date: TDateTimePicker;
    Btn_Now: TButton;
    ChBxTimeNowControl: TCheckBox;
    ChBxNowStart: TCheckBox;
    CheckBox1: TCheckBox;
    CmBx_RND_dev: TComboBox;
    Label10: TLabel;
    Memo2: TMemo;
    ChBx_period: TCheckBox;
    EdtUserName: TEdit;
    EdtUserPass: TEdit;
    BtnEnterUserName: TButton;
    BtnEnterUserPass: TButton;
    LabeMessage: TLabel;
    MemoLog: TMemo;
    procedure btnSendTextClick(Sender: TObject);
    procedure btnClickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnWinClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DTP_start_dateChange(Sender: TObject);
    procedure DTP_stop_dateChange(Sender: TObject);
    procedure Btn_NowClick(Sender: TObject);
    procedure CmBx_RND_devChange(Sender: TObject);
    procedure BtnEnterUserNameClick(Sender: TObject);
    procedure BtnEnterUserPassClick(Sender: TObject);
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
  lblText.Caption := 'Текст:';
  lblX.Caption := 'X:';
  lblY.Caption := 'Y:';
  edtText.Text := 'test 123';
  edtX.Text := '500';
  edtY.Text := '300';
  MemoLog.Lines.Add('Старт работы  ' + DateTimeToStr(now));
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  BtnWinClick(sender);
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
end;

procedure TFormMain.SendText(const S: string);   // только для латиницы/цифр
var
  Inputs: array of TInput;
  i, idx: Integer;
  vk: Word;
  shiftState: SHORT;
  needShift: Boolean;
begin
  if S = '' then Exit;
  if Stop then exit;


  SetLength(Inputs, Length(S) * 4); // запас (keydown/keyup + shift)

  idx := 0;

  for i := 1 to Length(S) do begin
    shiftState := VkKeyScan(S[i]);
    sleep (50+Round(random(RND_deviation)*10));
    if shiftState = -1 then
      Continue; // символ не мапится — пропускаем (нужно доработать)

      vk := Word(shiftState and $FF);
    needShift := (shiftState and $0100) <> 0;

    // Нажимаем Shift, если надо
    if needShift then
    begin
      ZeroMemory(@Inputs[idx], SizeOf(TInput));
      Inputs[idx].Itype := INPUT_KEYBOARD;
      Inputs[idx].ki.wVk := VK_SHIFT;
      Inputs[idx].ki.dwFlags := 0;
      Inc(idx);
      sleep (10+round(random(RND_deviation)*10));
    end;

    // Нажатие клавиши
    ZeroMemory(@Inputs[idx], SizeOf(TInput));
    Inputs[idx].Itype := INPUT_KEYBOARD;
    Inputs[idx].ki.wVk := vk;
    Inputs[idx].ki.dwFlags := 0;
    Inc(idx);
    sleep (10+Round(random(RND_deviation)*10));
    // Отпускание клавиши
    ZeroMemory(@Inputs[idx], SizeOf(TInput));
    Inputs[idx].Itype := INPUT_KEYBOARD;
    Inputs[idx].ki.wVk := vk;
    Inputs[idx].ki.dwFlags := KEYEVENTF_KEYUP;
    Inc(idx);
    sleep (10+Round(random(RND_deviation)*10));
    // Отпускаем Shift, если нажимали
    if needShift then
    begin
      ZeroMemory(@Inputs[idx], SizeOf(TInput));
      Inputs[idx].Itype := INPUT_KEYBOARD;
      Inputs[idx].ki.wVk := VK_SHIFT;
      Inputs[idx].ki.dwFlags := KEYEVENTF_KEYUP;
      Inc(idx);
      sleep (20+Round(random(RND_deviation)*10));
    end;
  end;
  sleep (30+Round(random(RND_deviation+1)*10));
  if idx > 0 then
    SendInput(idx, Inputs[0], SizeOf(TInput));
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  LabelTime.Caption:=TimeToStr(now);
  if stop then Label4.Caption:='НЕТ!' else Label4.Caption:='_да_'
end;

procedure TFormMain.ClickAtScreen(X, Y: Integer);
begin
  // Перемещаем курсор в абсолютные экранные координаты - правильно работает только для одномониторной конфигурации. Для многомониторной - совеобразно )))
  SetCursorPos(X, Y);

  // Нажатие ЛКМ
  mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
  mouse_event(MOUSEEVENTF_LEFTUP,   0, 0, 0, 0);
end;

procedure TFormMain.ComboBox1Change(Sender: TObject);
begin
  ActivateWindowByHWIND (HWND(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
  Label_HWIND.Caption:=IntToStr((HWND(ComboBox1.Items.Objects[ComboBox1.ItemIndex])));
end;

procedure TFormMain.CmBx_RND_devChange(Sender: TObject);
begin
  try
    RND_deviation:=StrToInt (CmBx_RND_dev.Text);
  except
    CmBx_RND_dev.ItemIndex:=0;
  end;
end;

procedure TFormMain.DTP_start_dateChange(Sender: TObject);
Var
  DTP:TDateTimePicker;
begin
  DTP:=Sender As TDateTimePicker;

  if ChBxTimeNowControl.Checked then
    if DTP.DateTime<now then begin
      DTP.DateTime:=now;
      exit;
    end;

  DTP_start_date.DateTime := DTP.DateTime;
  DTP_start_time.DateTime := DTP.DateTime;
  if ChBx_period.Checked then begin
    DTP_stop_date.DateTime := DTP.DateTime+1/24*StrToInt(ComboBox2.Text);
    DTP_stop_time.DateTime := DTP.DateTime+1/24*StrToInt(ComboBox2.Text);
  end;
  dtStart:= DTP_start_date.DateTime;
  dtEnd:= DTP_stop_time.DateTime;
  LblDTStart.Caption:=DateTimeToStr(dtStart);
  LblDTEnd.Caption:=DateTimeToStr(dtEnd);
end;

procedure TFormMain.DTP_stop_dateChange(Sender: TObject);
Var
  DTP:TDateTimePicker;
begin
  DTP:=Sender As TDateTimePicker;
  if ChBxTimeNowControl.Checked then
    if DTP.DateTime<now then begin
      DTP.DateTime:=now;
      exit;
    end;

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
  MemoLog.Lines.Add('отправлен логин ' + DateTimeToStr(now));
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
  MemoLog.Lines.Add('отправлен пароль ' + DateTimeToStr(now));
end;

procedure TFormMain.btnSendTextClick(Sender: TObject);
begin
  SendText(edtText.Text);
end;

procedure TFormMain.BtnWinClick(Sender: TObject);
begin
  FillVisibleWindowsCombo(ComboBox1);
  MemoLog.Lines.Add('скан окон  ' + DateTimeToStr(now));
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
    ShowMessage('Окно "'+ComboBox1.Text+'" не найдено');
  MemoLog.Lines.Add('вывод окна "'+ComboBox1.Text+'" в топ  ' + DateTimeToStr(now));
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
  MemoLog.Lines.Add('запущен цикл печати текста  ' + DateTimeToStr(now));
  dt:=now;
  if ChBx_period.Checked then begin
    _StartDT:=now;
    _EndDT:= dt+1/24*StrToInt(ComboBox2.Text);
  end else begin
    if (dtEnd<=dtStart) or (dtEnd<=now) then begin
      ShowMessage('Неверно заданы диапазоны времени (выбран режим работы от даты/времени до даты/времени!');
      exit;
    end;
    _StartDT:=dtStart;
    _EndDT:=dtEnd;
  end;
  X := StrToIntDef(edtX.Text, 0);
  Y := StrToIntDef(edtY.Text, 0);
  MemoLog.Lines.Add('время когда печать должна начаться  ' + DateTimeToStr(_StartDT));
  MemoLog.Lines.Add('время когда печать должна остановиться  ' + DateTimeToStr(_EndDT));
  ClickAtScreen(X, Y);
  Stop:=false;
  if stop then Label4.Caption:='НЕТ!' else Label4.Caption:='_да_';
  while now<=_StartDT do begin
    sleep (233);
    LabeMessage.Caption:= 'Ожидание старта цикла. Ждем ' + IntToStr(SecondsBetween (_StartDT, now))+' ,сек.';
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
        SendText ('sVVV___ра'+IntToStr(i)+'  ');
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
    MemoLog.Lines.Add('завершен проход текста №  '+IntToStr(i)+'   :' + DateTimeToStr(_StartDT));
    application.ProcessMessages;
    if Stop then exit;
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  Stop:=true;
  if stop then Label4.Caption:='НЕТ!' else Label4.Caption:='_да_';
  MemoLog.Lines.Add('останов цикла вывода ' + DateTimeToStr(now));
end;

procedure TFormMain.Button4Click(Sender: TObject);
var
  X, Y: Integer;
begin
  WaitForLeftClick(X, Y);

  EdtX.Text := IntToStr(X);
  EdtY.Text:= IntToStr(Y);
  MemoLog.Lines.Add('определены координаты точки ввода '+EdtX.Text+'/'+ EdtY.Text + '   ' + DateTimeToStr(now));
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
    SendText ('sVVV___ра'+IntToStr(i)+'  ');
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
