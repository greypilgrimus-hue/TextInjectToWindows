object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1087#1077#1088#1077#1076#1072#1095#1072' '#1090#1077#1082#1089#1090#1072' '#1101#1084#1091#1083#1103#1094#1080#1077#1081' '#1085#1072#1078#1072#1090#1080#1103' '#1082#1083#1072#1074#1080#1096' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1086#1077' '#1086#1082#1085#1086
  ClientHeight = 837
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 837
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = -1
    object Label1: TLabel
      Left = 48
      Top = 93
      Width = 104
      Height = 13
      Caption = #1089#1087#1080#1089#1086#1082' '#1086#1082#1086#1085' (ListBtn)'
    end
    object Label3: TLabel
      Left = 10
      Top = 231
      Width = 80
      Height = 13
      Caption = #1094#1080#1082#1083' '#1088#1072#1073#1086#1090#1072#1077#1090'?'
    end
    object Label4: TLabel
      Left = 121
      Top = 231
      Width = 18
      Height = 13
      Caption = #1085#1077#1090
    end
    object LabelTime: TLabel
      Left = 1
      Top = 823
      Width = 199
      Height = 13
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelTime'
      ExplicitLeft = 48
      ExplicitTop = 640
      ExplicitWidth = 31
    end
    object Label5: TLabel
      Left = 57
      Top = 293
      Width = 110
      Height = 13
      Caption = #1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' X '#1101#1082#1088#1072#1085#1072
    end
    object Label6: TLabel
      Left = 57
      Top = 334
      Width = 110
      Height = 13
      Caption = #1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' Y '#1101#1082#1088#1072#1085#1072
    end
    object Label_HWIND: TLabel
      Left = 104
      Top = 40
      Width = 24
      Height = 16
      Caption = '????'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 48
      Top = 43
      Width = 35
      Height = 13
      Caption = 'HWIND'
    end
    object LabeMessage: TLabel
      Left = 1
      Top = 810
      Width = 199
      Height = 13
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelTime'
      ExplicitLeft = 48
      ExplicitTop = 640
      ExplicitWidth = 31
    end
    object Button2: TButton
      Left = 10
      Top = 200
      Width = 185
      Height = 25
      Caption = #1057#1058#1040#1056#1058' '#1094#1080#1082#1083' '#1074#1074#1086#1076#1072
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 47
      Top = 139
      Width = 120
      Height = 25
      Caption = #1086#1082#1085#1086' '#1074' '#1090#1086#1087
      TabOrder = 1
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 10
      Top = 112
      Width = 185
      Height = 21
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = #1088#1072#1079
      OnChange = ComboBox1Change
      Items.Strings = (
        #1088#1072#1079
        #1076#1074#1072
        #1090#1088#1080
        #1095#1077#1090#1099#1088#1077
        #1087#1103#1090#1100' '#1096#1077#1089#1090#1100
        #1089#1077#1084#1100
        #1074#1086#1089#1077#1084#1100'!')
    end
    object BtnWin: TButton
      Left = 48
      Top = 62
      Width = 120
      Height = 25
      Caption = #1089#1082#1072#1085' win.'#1086#1082#1086#1085
      TabOrder = 3
      OnClick = BtnWinClick
    end
    object Button3: TButton
      Left = 10
      Top = 250
      Width = 185
      Height = 25
      Caption = #1057#1058#1054#1055'! '#1094#1080#1082#1083' '#1074#1074#1086#1076#1072
      TabOrder = 4
      OnClick = Button3Click
    end
    object edtX: TEdit
      Left = 47
      Top = 312
      Width = 120
      Height = 21
      TabOrder = 5
      Text = 'EdtX'
    end
    object edtY: TEdit
      Left = 47
      Top = 353
      Width = 120
      Height = 21
      TabOrder = 6
      Text = 'EdtY'
    end
    object Button5: TButton
      Left = 46
      Top = 380
      Width = 121
      Height = 25
      Caption = #1086#1087#1088'.'#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1082#1083#1080#1082#1072
      TabOrder = 7
      OnClick = Button4Click
    end
    object EdtUserName: TEdit
      Left = 10
      Top = 440
      Width = 177
      Height = 21
      TabOrder = 8
      Text = 'sergey.balayan@metinvestholding.com'
    end
    object EdtUserPass: TEdit
      Left = 10
      Top = 504
      Width = 177
      Height = 21
      TabOrder = 9
      Text = 'QAZ123wsx@@@@'
    end
    object BtnEnterUserName: TButton
      Left = 8
      Top = 467
      Width = 179
      Height = 25
      Caption = 'Enter User Name'
      TabOrder = 10
      OnClick = BtnEnterUserNameClick
    end
    object BtnEnterUserPass: TButton
      Left = 10
      Top = 531
      Width = 177
      Height = 25
      Caption = 'Enter User Password'
      TabOrder = 11
      OnClick = BtnEnterUserPassClick
    end
  end
  object PgCtrl: TPageControl
    Left = 201
    Top = 0
    Width = 875
    Height = 837
    ActivePage = TbSht_Settings
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 217
    ExplicitWidth = 289
    ExplicitHeight = 193
    object TbSht_TextToRDP: TTabSheet
      Caption = #1090#1077#1082#1089' '#1074' '#1086#1082#1085#1086' RDP'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object lblX: TLabel
        Left = 48
        Top = 412
        Width = 110
        Height = 13
        Caption = #1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' X '#1101#1082#1088#1072#1085#1072
      end
      object lblY: TLabel
        Left = 48
        Top = 453
        Width = 110
        Height = 13
        Caption = #1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' Y '#1101#1082#1088#1072#1085#1072
      end
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 867
        Height = 809
        Align = alClient
        Lines.Strings = (
          'unit UnitDMSQLite_Service;'
          '{'
          ' *'
          ' * '
          ' * Copyright (c) 2025 Balaian Serhii'
          ' * '
          
            ' * Permission is hereby granted, free of charge, to any person o' +
            'btaining a copy'
          
            ' * of this software and associated documentation files (the "Sof' +
            'tware"), to deal'
          
            ' *  * in the Software without restriction, including without lim' +
            'itation the rights'
          
            ' * to use, copy, modify, merge, publish, distribute, sublicense,' +
            ' and/or sell'
          
            ' * copies of the Software, and to permit persons to whom the Sof' +
            'tware is'
          ' * furnished to do so, subject to the following conditions:'
          
            ' * The above copyright notice and this permission notice shall b' +
            'e included in all'
          ' * copies or substantial portions of the Software.'
          ''
          
            'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, ' +
            'EXPRESS OR'
          
            'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT' +
            'ABILITY,'
          
            'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVEN' +
            'T SHALL THE'
          
            'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR' +
            ' OTHER'
          
            'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ' +
            'ARISING FROM,'
          
            'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DE' +
            'ALINGS IN THE SOFTWARE.'
          ''
          '31-10-2025'
          
            'The TDatabaseManagerSQLite class is a helper class designed for ' +
            'working with'
          
            'the SQLite database and managing the results of ping checks and ' +
            'Oracle '
          
            'availability checks. The class automatically creates necessary t' +
            'ables and '
          'provides methods for core data operations.'
          'Initialization and basic operations'
          #8226'   Creating an instance'
          #8226'   Getting a database connection'
          ''
          'Main methods'
          
            '1.  Recording ping check results (from the TPingResult structure' +
            ')'
          
            '2.  Recording Oracle check results (from the OracleReply structu' +
            're)'
          
            '3.  Loading ping data for a period (for copying to Oracle. Impor' +
            'tant! Query.FREE in the calling module is mandatory!)'
          
            '4.  Loading Oracle check data for a period (for copying to Oracl' +
            'e. Important! Query.FREE in the calling module is mandatory!)'
          
            '5.  Getting the last date of ping/Oracle availability data recor' +
            'ded in the database'
          '6.  Deleting old records '#8211' cleanup after copying to Oracle'
          ''
          'Data structures - Defined in UnitTypes'
          #8226'   functionRes'
          #8226'   TPingResult and TOracleReply'
          ''
          'Operational features'
          'Automatic table creation'
          
            #8226'   When a class instance is created, the ping_results and ping_' +
            'oracle tables are automatically created if they do not exist'
          #8226'   Indexes are created to optimize queries'
          'Date format'
          #8226'   All dates are stored in the '#39'yyyy-mm-dd hh:nn:ss'#39' format'
          
            #8226'   When passing parameters, use FormatDateTime('#39'yyyy-mm-dd hh:n' +
            'n:ss'#39', YourDateTime)'
          'Error handling'
          
            #8226'   All methods return a functionRes with information about the ' +
            'operation'#39's success'
          
            #8226'   It is recommended to always check przn before using the resu' +
            'lts'
          ''
          'Notes'
          
            '1.  Always free the query instance obtained from the QueryLoadDA' +
            'TAPing/QueryLoadDATAOra methods'
          
            '2.  Exceptions: query processing methods may raise exceptions - ' +
            'use try/except blocks'
          
            '3.  For batch operations (> ~50 pings at once), consider using b' +
            'atch data insertion (implement it yourself) or there will be a s' +
            'ignificant performance drop'
          '}'
          'interface'
          ''
          'uses'
          '  System.SysUtils, System.Classes,'
          
            '  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Comp.Clie' +
            'nt,'
          
            '  FireDAC.Stan.Def, FireDAC.Dapt, FMX.Controls.Presentation, FMX' +
            '.StdCtrls,'
          
            '  FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDA' +
            'C.Comp.UI,'
          '  FireDAC.Stan.Async, FireDAC.Phys,'
          '  UnitFunctions, UnitTypes, Unit_ping'
          '  ;'
          ''
          'type'
          '  TDMSQLite_service = class(TDataModule)'
          '  private'
          '    { Private declarations }'
          '  public'
          '    { Public declarations }'
          '  end;'
          ''
          'type'
          '  TDatabaseManagerSQLite = class'
          '  private'
          ''
          '    procedure SetupConnection;'
          '    function TableExists(const TableName: string): Boolean;'
          '    function CreateTable (SQLScript: TStringList):functionRes;'
          '  public'
          '    FConnection: TFDConnection;'
          '    //QueryInsert: TFDQuery;'
          '    SQL_CREATE_TABLE_ping:TStringList;'
          '    SQL_CREATE_TABLE_oracle:TStringList;'
          '    //SQL_DEL_OLD_REC:TStringList;'
          '    SQL_SELECT_PING_RES:TStringList;'
          '    SQL_INSERT_PING_RES:TStringList;'
          '    SQL_INS_ORA_PING_RES:TStringList;'
          '    SQL_MAX_DT_PING_RES:TStringList;'
          '    SQL_LoadDATA_PING:TStringList;'
          '    SQL_LoadDATA_ORA:TStringList;'
          '    SQL_DEL_OLD_ping_res:TStringList;'
          '    SQL_DEL_OLD_ORA_res:TStringList;'
          '    constructor Create;'
          '    destructor Destroy; override;'
          '    property Connection: TFDConnection read FConnection;'
          '    //'
          
            '    function InsertPingRes (r:TPingResult; ipDest,ipSrc:string):' +
            'functionRes;'
          
            '    function InsertOraclePingRes(r:TOracleReply; ipSrc:string): ' +
            'functionRes;'
          '    //function SelectPingRes (SQLScript: TStringList): TFDQuery;'
          
            '    function LastDateInSQLite (var lastDT:TDateTime):functionRes' +
            ';'
          '    function DellOldRecPing (d:TDatetime):functionRes;'
          '    function DellOldRecORA (d:TDatetime):functionRes;'
          '    //'
          
            '    function QueryLoadDATAPing (DTStart,DTEnd : TDateTime):TFDQu' +
            'ery;'
          
            '    function QueryLoadDATAOra (DTStart,DTEnd : TDateTime):TFDQue' +
            'ry;'
          '  end;'
          ''
          'var'
          '  DMSQLite_service: TDMSQLite_service;'
          ''
          'implementation'
          ''
          '{%CLASSGROUP '#39'FMX.Controls.TControl'#39'}'
          ''
          '{$R *.dfm}'
          ''
          'constructor TDatabaseManagerSQLite.Create;'
          'begin'
          '  inherited Create;'
          
            '  //if FConnection = nil then FConnection := TFDConnection.Creat' +
            'e(nil);'
          '  FConnection := TFDConnection.Create(nil);'
          '  SQL_CREATE_TABLE_ping := StrLst_Create;'
          '  SQL_CREATE_TABLE_oracle := StrLst_Create;'
          '  //SQL_DEL_OLD_REC := StrLst_Create;'
          '  SQL_SELECT_PING_RES := StrLst_Create;'
          '  SQL_INSERT_PING_RES := StrLst_Create;'
          '  SQL_MAX_DT_PING_RES := StrLst_Create;'
          '  SQL_INS_ORA_PING_RES := StrLst_Create;'
          '  SQL_LoadDATA_PING := StrLst_Create;'
          '  SQL_LoadDATA_ORA := StrLst_Create;'
          '  SQL_DEL_OLD_ping_res := StrLst_Create;'
          '  SQL_DEL_OLD_ORA_res := StrLst_Create;'
          ''
          '  SQL_CREATE_TABLE_ping.Text := '
          '    '#39'CREATE TABLE IF NOT EXISTS'#39' + sLineBreak +'
          '    '#39'    ping_results '#39' + sLineBreak +'
          '    '#39'    (date_DB TEXT NOT NULL,'#39' + sLineBreak +'
          '    '#39'    Destination_IP TEXT NOT NULL,'#39' + sLineBreak +'
          '    '#39'    Source_IP TEXT NOT NULL,'#39' + sLineBreak +'
          '    '#39'    Status_message TEXT,'#39' + sLineBreak +'
          '    '#39'    date_png TEXT,'#39' + sLineBreak +'
          '    '#39'    status INTEGER,'#39' + sLineBreak +'
          '    '#39'    RoundTripTime INTEGER,'#39' + sLineBreak +'
          '    '#39'    ErrorMessage TEXT'#39' + sLineBreak +'
          '    '#39');'#39' + sLineBreak +'
          
            '    '#39'CREATE INDEX IF NOT EXISTS idx_date_DB ON ping_results (dat' +
            'e_DB);'#39' + sLineBreak +'
          
            '    '#39'CREATE INDEX IF NOT EXISTS idx_Source_IP ON ping_results (S' +
            'ource_IP);'#39' + sLineBreak +'
          
            '    '#39'CREATE INDEX IF NOT EXISTS idx_Destination_IP ON ping_resul' +
            'ts (Destination_IP);'#39';'
          ''
          
            '  SQL_CREATE_TABLE_oracle.Text := // SQL '#1089#1082#1088#1080#1087#1090' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1090#1072#1073#1083#1080#1094#1099 +
            ' ping_results '#1080' '#1080#1085#1076#1077#1082#1089#1086#1074
          '    '#39'CREATE TABLE IF NOT EXISTS  '#39' + sLineBreak +'
          '    '#39'    ping_oracle '#39' + sLineBreak +'
          '    '#39'    (date_DB TEXT NOT NULL,'#39' + sLineBreak +'
          '    '#39'    date_png TEXT,'#39' + sLineBreak +'
          '    '#39'    Source_IP TEXT NOT NULL,'#39' + sLineBreak +'
          '    '#39'    ErrorMessage TEXT'#39' + sLineBreak +'
          '    '#39'    ErrorCode INTEGER,'#39' + sLineBreak +'
          '    '#39'    RoundTripTime INTEGER,'#39' + sLineBreak +'
          '  '#9#39'    IsSuccess integer );'#39'  + sLineBreak +'
          
            '    '#39'CREATE INDEX IF NOT EXISTS idx_date_DB ON ping_oracle (date' +
            '_DB);'#39' + sLineBreak +'
          
            '    '#39'CREATE INDEX IF NOT EXISTS idx_Source_IP ON ping_oracle (So' +
            'urce_IP);'#39';'
          '  SQL_INS_ORA_PING_RES.Text :='
          '    '#39'INSERT INTO '#39' + sLineBreak +'
          '    '#39'  ping_oracle '#39' + sLineBreak +'
          '    '#39'  (date_DB, date_png , Source_IP, '#39' + sLineBreak +'
          
            '    '#39'  ErrorMessage, ErrorCode, RoundTripTime, IsSuccess'#39' + sLin' +
            'eBreak +'
          '    '#39') VALUES ('#39' + sLineBreak +'
          '    '#39'  CURRENT_TIMESTAMP, :date_png, :src_ip, '#39' + sLineBreak +'
          '    '#39'  :ErrorMessage, :ErrorCode, :RoundTripTime, :IsSuccess)'#39';'
          ''
          '  SQL_INSERT_PING_RES.Text :='
          '    '#39'INSERT INTO '#39' + sLineBreak +'
          '    '#39'  ping_results '#39' + sLineBreak +'
          '    '#39'  (date_DB, Destination_IP, Source_IP, '#39' + sLineBreak +'
          
            '    '#39'  date_png, status, RoundTripTime, ErrorMessage, status_mes' +
            'sage'#39' + sLineBreak +'
          '    '#39') VALUES ('#39' + sLineBreak +'
          '    '#39'  CURRENT_TIMESTAMP, :dest_ip, :src_ip, '#39' + sLineBreak +'
          
            '    '#39'  :ping_date, :status_code, :RoundTripTime, :error_msg, :st' +
            'atus_message)'#39';'
          ''
          
            '  SQL_DEL_OLD_ping_res.text := '#39'DELETE FROM ping_results WHERE d' +
            'ate_DB<:date'#39';'
          
            '  SQL_DEL_OLD_ORA_res.text := '#39'DELETE FROM ping_oracle WHERE dat' +
            'e_DB<:date'#39';'
          ''
          '  SQL_SELECT_PING_RES.text := '#39'select * from ping_results'#39';'
          ''
          
            '  SQL_MAX_DT_PING_RES.Text := '#39'select max(date_DB) as max_DT fro' +
            'm ping_results'#39';'
          ''
          
            '  SQL_LoadDATA_PING.Text := '#39'SELECT * FROM ping_results WHERE da' +
            'te_png BETWEEN :DTStart AND :DTEnd'#39';'
          ''
          
            '  SQL_LoadDATA_ORA.Text := '#39'SELECT * FROM ping_oracle WHERE date' +
            '_png BETWEEN :DTStart AND :DTEnd'#39';'
          ''
          '  SetupConnection;'
          '  CreateTable (SQL_CREATE_TABLE_ping);'
          '  CreateTable (SQL_CREATE_TABLE_oracle);'
          'end;'
          ''
          'destructor TDatabaseManagerSQLite.Destroy;'
          'begin'
          '  FConnection.Free;'
          '  inherited;'
          'end;'
          ''
          'procedure TDatabaseManagerSQLite.SetupConnection;'
          'begin'
          '  with FConnection do begin'
          '    Connected := False;'
          '    Params.Clear;'
          '    Params.Add('#39'DriverID=SQLite'#39');'
          '    Params.Add('#39'Database='#39' + GetDatabasePath (dbName));'
          '    Params.Add('#39'LockingMode=Normal'#39');'
          '    Params.Add('#39'Synchronous=Normal'#39');'
          '    Params.Add('#39'UpdateOptions.LockWait=True'#39');'
          '    Params.Add('#39'BusyTimeout=1000'#39');'
          ''
          '    if not FileExists(GetDatabasePath(dbName)) then '
          
            '      ForceDirectories(ExtractFilePath(GetDatabasePath(dbName)))' +
            ';'
          '    if not TableExists('#39#39') then'
          '      Connected := True;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.CreateTable (SQLScript: TStringL' +
            'ist):functionRes;'
          'begin'
          '  result.przn:=false;'
          '  result.mes:='#39#39';'
          '    try'
          '      FConnection.StartTransaction;'
          '      try'
          '        FConnection.ExecSQL(SQLScript.Text);'
          '        FConnection.Commit;'
          
            '        result.mes:='#39'Table created successfully!'#39' + SQLScript.St' +
            'rings[2];'
          '        result.przn:=true;'
          '      except'
          '        FConnection.Rollback;'
          '        raise;'
          '      end;'
          '    except'
          '      on E: Exception do'
          
            '        result.mes:='#39'Error creating table '#39'+SQLScript.Strings[2]' +
            '+'#39': '#39' + e.ClassName+'#39':'#39'+e.Message;'
          '    end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.DellOldRecPing (d:TDatetime):fun' +
            'ctionRes;'
          'var'
          '  dt_str:string;'
          'begin'
          '  result.przn:=true;'
          '  result.mes:='#39#1059#1089#1087#1077#1093#39';'
          '  try'
          '    dt_str := FormatDateTime('#39'yyyy-mm-dd hh:nn:ss'#39', d);'
          '    FConnection.ExecSQL(SQL_DEL_OLD_ping_res.text, [dt_str] );'
          '  except'
          '    on e:exception do begin'
          '      result.przn:=false;'
          
            '      result.mes:='#39'Error deleting old data (SQLite.Ping): '#39'+e.Cl' +
            'assName+'#39':'#39'+e.Message;'
          '    end;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.DellOldRecORA (d:TDatetime):func' +
            'tionRes;'
          'var'
          '  dt_str:string;'
          'begin'
          '  result.przn:=true;'
          '  result.mes:='#39#1059#1089#1087#1077#1093#39';'
          '  try'
          '    dt_str := FormatDateTime('#39'yyyy-mm-dd hh:nn:ss'#39', d);'
          '    FConnection.ExecSQL(SQL_DEL_OLD_ORA_res.text, [dt_str] );'
          '  except'
          '    on e:exception do begin'
          '      result.przn:=false;'
          
            '      result.mes:='#39'Error deleting old data (SQLite.ORA): '#39'+e.Cla' +
            'ssName+'#39':'#39'+e.Message;'
          '    end;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.TableExists(const TableName: str' +
            'ing): Boolean; '#1087#1091#1089#1090#1072#1103
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  Query := TFDQuery.Create(nil);'
          '  try'
          '    Query.Connection := FConnection;'
          '    Query.SQL.Text :='
          
            '      '#39'SELECT name FROM sqlite_master WHERE type='#39#39'table'#39#39' AND n' +
            'ame=:TableName'#39';'
          '    Query.ParamByName('#39'TableName'#39').AsString := TableName;'
          '    Query.Open;'
          ''
          '    Result := not Query.Eof;'
          '  finally'
          '    Query.Close;'
          '    Query.Free;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.InsertOraclePingRes(r:TOracleRep' +
            'ly; ipSrc:string): functionRes;'
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  result.przn:=true;'
          '  result.mes:='#39#1059#1089#1087#1077#1093#39';'
          '  try'
          '    Query := TFDQuery.Create(nil);'
          '    try'
          '      Query.Connection := FConnection;'
          '      Query.SQL := SQL_INSERT_PING_RES;'
          
            '      Query.ParamByName('#39'date_png'#39').AsString := FormatDateTime('#39 +
            'yyyy-mm-dd hh:nn:ss'#39', r.dt);'
          '      Query.ParamByName('#39'src_ip'#39').AsString := ipSrc;'
          
            '      Query.ParamByName('#39'ErrorMessage'#39').AsString := r.ErrorMessa' +
            'ge;'
          '      Query.ParamByName('#39'ErrorCode'#39').AsInteger := r.ErrorCode;'
          
            '      Query.ParamByName('#39'RoundTripTime'#39').AsInteger := r.RoundTri' +
            'pTime;'
          
            '      if r.IsSuccess then Query.ParamByName('#39'IsSuccess'#39').AsInteg' +
            'er := 1'
          '        else Query.ParamByName('#39'IsSuccess'#39').AsInteger := 1 ; '
          '      Query.ExecSQL;'
          '      Query.Connection.Commit;'
          '    except'
          '      on e:exception do begin'
          '        result.przn:=false;'
          
            '        result.mes:='#39'Error writing Oracle availability check res' +
            'ults (SQLite.insert): '#39'+e.ClassName+'#39':'#39'+e.Message;'
          '      end;'
          '    end;'
          '  finally'
          '    Query.Free;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.InsertPingRes(r:TPingResult; ipD' +
            'est,ipSrc:string): functionRes;'
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  result.przn:=true;'
          '  result.mes:='#39#1059#1089#1087#1077#1093#39';'
          '  try'
          '    Query := TFDQuery.Create(nil);'
          '    try'
          '      Query.Connection := FConnection;'
          '      Query.SQL := SQL_INSERT_PING_RES;'
          '      Query.ParamByName('#39'dest_ip'#39').AsString := ipDest;'
          '      Query.ParamByName('#39'src_ip'#39').AsString := ipSrc;'
          
            '      Query.ParamByName('#39'ping_date'#39').AsString := FormatDateTime(' +
            #39'yyyy-mm-dd hh:nn:ss'#39', Now);'
          '      Query.ParamByName('#39'status_code'#39').AsInteger := r.ErrorCode;'
          
            '      Query.ParamByName('#39'RoundTripTime'#39').AsInteger := r.RoundTri' +
            'pTime;'
          '      Query.ParamByName('#39'error_msg'#39').AsString := r.ErrorMessage;'
          
            '      Query.ParamByName('#39'status_message'#39').AsString := GetPingSta' +
            'tusDescription (r.ErrorCode);'
          '      Query.ExecSQL;'
          '      Query.Connection.Commit;'
          '    except'
          '      on e:exception do begin'
          '        result.przn:=false;'
          
            '        result.mes:='#39'Error writing pings result (SQLite.insert):' +
            ' '#39'+e.ClassName+'#39':'#39'+e.Message;'
          '      end;'
          '    end;'
          '  finally'
          '    Query.Free;'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.QueryLoadDATAPing (DTStart,DTEnd' +
            ':TDateTime):TFDQuery; //Query.FREE'
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  Query := TFDQuery.Create(nil);'
          '  try'
          '    Query.Connection := FConnection;'
          '    Query.SQL := SQL_LoadDATA_PING;'
          
            '    Query.ParamByName('#39'DTStart'#39').AsString := FormatDateTime('#39'yyy' +
            'y-mm-dd hh:nn:ss'#39', DTStart);'
          
            '    Query.ParamByName('#39'DTEnd'#39').AsString := FormatDateTime('#39'yyyy-' +
            'mm-dd hh:nn:ss'#39', DTEnd);'
          '    Query.Open;'
          '    result := Query;'
          '  except'
          '    on e:exception do begin'
          '      raise;'
          '    end'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.QueryLoadDATAOra (DTStart,DTEnd:' +
            'TDateTime):TFDQuery;  //Query.FREE!'
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  Query := TFDQuery.Create(nil);'
          '  try'
          '    Query.Connection := FConnection;'
          '    Query.SQL := SQL_LoadDATA_ORA;'
          
            '    Query.ParamByName('#39'DTStart'#39').AsString := FormatDateTime('#39'yyy' +
            'y-mm-dd hh:nn:ss'#39', DTStart);'
          
            '    Query.ParamByName('#39'DTEnd'#39').AsString := FormatDateTime('#39'yyyy-' +
            'mm-dd hh:nn:ss'#39', DTEnd);'
          '    Query.Open;'
          '    result := Query;'
          '  except'
          '    on e:exception do begin'
          '      raise;'
          '    end'
          '  end;'
          'end;'
          ''
          
            'function TDatabaseManagerSQLite.LastDateInSQLite (var lastDT:TDa' +
            'teTime):functionRes;'
          'var'
          '  Query: TFDQuery;'
          'begin'
          '  result.przn:=true;'
          '  result.mes:='#39#1059#1089#1087#1077#1093#39';'
          '  try'
          '    Query := TFDQuery.Create(nil);'
          '    try'
          '      Query.Connection := FConnection;'
          '      Query.SQL := SQL_MAX_DT_PING_RES;'
          '      Query.Open;'
          '      lastDT:=Query.FieldByName('#39'max_DT'#39').AsDateTime;'
          '      Query.Close;'
          '    except'
          '      on e:exception do begin'
          '        result.przn:=false;'
          
            '        result.mes:='#39'Error determining the maximum date (SQLite.' +
            'LastDateInSQLite): '#39'+e.ClassName+'#39':'#39'+e.Message;'
          '      end;'
          '    end;'
          '  finally'
          '    Query.Free;'
          '  end;'
          'end;'
          ''
          'end.')
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TbSht_test: TTabSheet
      Caption = #1090#1077#1089#1090#1086#1074#1099#1077' '#1092#1091#1085#1082#1094#1080#1080
      ImageIndex = 1
      ExplicitLeft = 5
      ExplicitTop = 27
      object lblText: TLabel
        Left = 40
        Top = 43
        Width = 81
        Height = 13
        Caption = #1090#1077#1089#1090#1086#1074#1099#1081' '#1090#1077#1082#1089#1090
      end
      object edtText: TEdit
        Left = 40
        Top = 62
        Width = 120
        Height = 21
        TabOrder = 0
        Text = 'edtText'
      end
      object btnSendText: TButton
        Left = 40
        Top = 89
        Width = 120
        Height = 25
        Caption = 'SendText (edit)'
        TabOrder = 1
        OnClick = btnSendTextClick
      end
      object btnClick: TButton
        Left = 40
        Top = 128
        Width = 120
        Height = 25
        Caption = 'SendClickMouse'
        TabOrder = 2
        OnClick = btnClickClick
      end
      object MemoLog: TMemo
        Left = 224
        Top = 0
        Width = 643
        Height = 809
        Align = alRight
        Lines.Strings = (
          #1051#1054#1043' '#1056#1040#1041#1054#1058#1067)
        TabOrder = 3
      end
    end
    object TbSht_Settings: TTabSheet
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 15
      Caption = #1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 2
      ExplicitLeft = 12
      ExplicitTop = 27
      object Label2: TLabel
        Left = 82
        Top = 157
        Width = 166
        Height = 16
        Caption = #1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1095#1072#1089#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 83
        Top = 13
        Width = 128
        Height = 19
        Caption = #1087#1077#1088#1080#1086#1076' '#1088#1072#1073#1086#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 66
        Width = 60
        Height = 19
        Caption = #1085#1072#1095#1072#1083#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 108
        Width = 51
        Height = 19
        Caption = #1082#1086#1085#1077#1094
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDTStart: TLabel
        Left = 10
        Top = 253
        Width = 111
        Height = 19
        Caption = #1085#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblDTEnd: TLabel
        Left = 10
        Top = 286
        Width = 102
        Height = 19
        Caption = #1082#1086#1085#1077#1094' '#1088#1072#1073#1086#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 82
        Top = 348
        Width = 504
        Height = 16
        Caption = 
          '"'#1082#1088#1072#1090#1085#1086#1089#1090#1100'" '#1088#1072#1085#1076#1086#1084#1080#1079#1072#1094#1080#1080' (RND_deviation '#1074' sleep (XX+(random(RND_' +
          'deviation)*10)))'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ComboBox2: TComboBox
        Left = 84
        Top = 179
        Width = 102
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object DTP_start_time: TDateTimePicker
        Left = 199
        Top = 66
        Width = 102
        Height = 21
        Date = 46006.000000000000000000
        Time = 0.250000000000000000
        Kind = dtkTime
        TabOrder = 1
        OnChange = DTP_start_dateChange
      end
      object DTP_stop_date: TDateTimePicker
        Left = 82
        Top = 106
        Width = 102
        Height = 21
        Date = 46006.000000000000000000
        Time = 0.604166666664241300
        TabOrder = 2
        OnChange = DTP_stop_dateChange
      end
      object DTP_stop_time: TDateTimePicker
        Left = 199
        Top = 106
        Width = 102
        Height = 21
        Date = 46006.000000000000000000
        Time = 0.604166666664241300
        Kind = dtkTime
        TabOrder = 3
        OnChange = DTP_stop_dateChange
      end
      object DTP_start_date: TDateTimePicker
        Left = 82
        Top = 66
        Width = 102
        Height = 21
        Date = 46006.000000000000000000
        Time = 0.250000000000000000
        TabOrder = 4
        OnChange = DTP_start_dateChange
      end
      object Btn_Now: TButton
        Left = 320
        Top = 66
        Width = 75
        Height = 21
        Caption = #1090#1077#1082'.'#1074#1088#1077#1084#1103
        TabOrder = 5
        OnClick = Btn_NowClick
      end
      object ChBxTimeNowControl: TCheckBox
        Left = 82
        Top = 38
        Width = 255
        Height = 17
        Caption = #1082#1086#1085#1090#1088#1086#1083#1100' "'#1085#1077' '#1084#1077#1085#1100#1096#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080'"'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object ChBxNowStart: TCheckBox
        Left = 84
        Top = 206
        Width = 311
        Height = 17
        Caption = #1088#1072#1073#1086#1090#1072#1090#1100' '#1086#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1086#1084#1077#1085#1090#1072'! ('#1074' '#1090#1077#1095#1077#1085#1080#1080' ... '#1095#1072#1089#1086#1074')'
        TabOrder = 7
      end
      object CheckBox1: TCheckBox
        Left = 84
        Top = 331
        Width = 253
        Height = 17
        Caption = #1088#1072#1085#1076#1086#1084#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1090#1077#1088#1074#1072#1083' '#1085#1072#1078#1072#1090#1080#1103' '#1082#1083#1072#1074#1080#1096
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CmBx_RND_dev: TComboBox
        Left = 84
        Top = 370
        Width = 102
        Height = 21
        TabOrder = 9
        Text = '4'
        OnChange = CmBx_RND_devChange
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9')
      end
      object Memo2: TMemo
        Left = 0
        Top = 409
        Width = 867
        Height = 400
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Align = alBottom
        Lines.Strings = (
          #1063#1090#1086#1069#1090#1086':'
          
            #1055#1054' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1103#1077#1090' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1082#1089#1090#1072' '#1087#1091#1090#1077#1084' '#1101#1084#1091#1083#1103#1094#1080#1080' '#1085#1072#1078#1072#1090#1080#1103' '#1082#1083#1072#1074#1080#1096 +
            ' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099' '#1074' '#1055#1054' '#1087#1086' '#1091#1082#1072#1079#1072#1085#1085#1099#1084' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1072#1084' '#1101#1082#1088#1072#1085#1072'.'
          
            #1055#1088#1080' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1080' '#1085#1077' '#1082#1086#1085#1090#1088#1086#1083#1080#1088#1091#1077#1090#1089#1103' '#1103#1079#1099#1082' '#1074#1074#1086#1076#1072', '#1089#1086#1086#1090#1074#1077#1090#1089#1074#1077#1085#1085#1086' '#1074' '#1094#1077 +
            #1083#1077#1074#1086#1084' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1080' '#1103#1079#1099#1082' '#1088#1072#1089#1082#1083#1072#1076#1082#1080' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1086#1090#1074#1077#1090#1089#1074#1086#1074#1072#1090#1100' '#1103#1079#1099#1082#1091' '#1090#1077#1082#1089 +
            #1090#1072' ('#1087#1077#1088#1077#1076#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '
          #1082#1086#1076#1099' '#1085#1072#1078#1072#1090#1099#1093' '#1082#1083#1072#1074#1080#1096') - '#1087#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1077' '#1088#1072#1089#1082#1083#1072#1076#1082#1080' '#1085#1077' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086'.'
          #1052#1085#1086#1075#1086#1103#1079#1099#1095#1085#1099#1077' '#1090#1077#1082#1089#1090#1099' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1077' '#1087#1086#1076#1093#1086#1076#1103#1090'.'
          
            #1069#1082#1088#1072#1085#1085#1099#1077' '#1079#1072#1089#1090#1072#1074#1082#1080' '#1080' '#1055#1054' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1080' '#1074#1086#1089#1087#1088#1080#1085#1080#1084#1072#1102#1090' '#1082#1072#1082' '#1074#1074#1086#1076 +
            ' '#1089' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099' - '#1084#1085#1086#1075#1080#1077'.'
          
            #1055#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1090#1077#1082#1089#1090#1072' '#1074' RDP '#1090#1077#1088#1084#1080#1085#1072#1083' - 100% '#1101#1084#1091#1083#1103#1094#1080#1103' '#1074#1074#1086#1076#1072' '#1089' '#1082#1083#1072#1074#1080#1072#1090 +
            #1091#1088#1099'.'
          
            #1044#1083#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1079#1072#1097#1080#1090#1099' '#1084#1086#1078#1085#1086' '#1085#1072#1089#1090#1088#1086#1080#1090#1100' "'#1088#1072#1085#1076#1086#1084#1080#1079#1072#1094#1080#1102'" '#1080#1085#1090#1077#1088#1074#1072 +
            #1083#1072' '#1084#1077#1078#1076#1091' '#1085#1072#1078#1072#1090#1080#1103#1084#1080' '#1082#1083#1072#1074#1080#1096', '#1095#1090#1086#1073#1099' '#1085#1077#1083#1100#1079#1103' '#1073#1099#1083#1086' '#1079#1072#1089#1077#1095#1100' '#1087#1086' '#1086#1076#1080#1085#1072#1082#1086#1074#1099 +
            #1084' '#1080#1085#1090#1077#1088#1074#1072#1083#1072#1084' '#1084#1077#1078#1076#1091' '
          #1085#1072#1078#1072#1090#1080#1103#1084#1080'.'
          
            #1055#1088#1080' '#1086#1095#1077#1085#1100' '#1084#1077#1076#1083#1077#1085#1085#1086#1084' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1080#1083#1080' "'#1090#1086#1088#1084#1086#1079#1072#1093'" RDP - '#1085#1072#1076#1086' '#1073#1091#1076#1077#1090' '#1091#1074 +
            #1077#1083#1080#1095#1080#1074#1072#1090#1100' '#1087#1086#1089#1090#1086#1103#1085#1085#1091#1102' '#1095#1072#1089#1090#1100' '#1080#1085#1090#1077#1088#1074#1072#1083#1072' '#1079#1072#1076#1077#1088#1078#1082#1080' ('#1087#1086#1082#1072' - '#1090#1086#1083#1100#1082#1086' '#1074' '#1082 +
            #1086#1076#1077').'
          ''
          #1080#1085#1089#1090#1088#1091#1082#1094#1080#1103':'
          ''
          '0. '#1047#1087#1091#1089#1090#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091'.'
          
            '1. '#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1086' '#1086#1090#1082#1091#1076#1072' '#1073#1091#1076#1077#1090' '#1073#1088#1072#1090#1100#1089#1103' '#1090#1077#1082#1089#1090' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086' '#1090#1077#1082#1089 +
            #1090' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' ('#1077#1089#1083#1080' '#1085#1072#1076#1086').'
          '2. '#1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1085#1091#1078#1085#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' ('#1085#1072#1087#1088#1080#1084#1077#1088' RDP '#1090#1077#1088#1084#1080#1085#1072#1083').'
          
            '3. '#1045#1089#1083#1080' '#1101#1090#1086' '#1090#1077#1088#1084#1080#1085#1072#1083' - '#1086#1090#1082#1088#1091#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1082#1091#1076#1072' '#1073#1091#1076#1077#1090' '#1087#1080#1089#1072#1090#1100#1089#1103' '#1090#1077 +
            #1082#1089#1090' -  '#1073#1083#1086#1082#1085#1086#1090', IDE '#1080' '#1090#1087'.'
          
            '4. '#1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1086#1082#1085#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' ('#1085#1077' '#1088#1072#1079#1074#1077#1088#1085#1091#1090#1086#1077' '#1085#1072' '#1074#1077#1089#1100' '#1101#1082#1088#1072#1085'!) '#1090#1072#1082',' +
            ' '#1095#1090#1086#1073#1099' '#1073#1099#1083#1072' '#1074#1080#1076#1085#1072' '#1086#1073#1083#1072#1089#1090#1100' '#1074#1074#1086#1076#1072' '#1090#1077#1082#1089#1090#1072'.'
          
            '5. '#1054#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1082#1086#1085' '#1074' '#1074#1080#1085#1076#1077', '#1074#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1086#1077' '#1086#1082#1085#1086' '#1074' '#1089#1087#1080#1089 +
            #1082#1077'.'
          
            '6. '#1053#1072#1078#1072#1090#1100' "'#1086#1087#1088'.'#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1082#1083#1080#1082#1072'" '#1080' '#1090#1099#1082#1085#1091#1090#1100' '#1084#1099#1096#1082#1086#1081' ('#1080#1083#1080' '#1079#1072#1076#1072#1090#1100' '#1082#1086#1086 +
            #1088#1076#1080#1085#1072#1090#1099' '#1090#1086#1095#1082#1080' '#1074#1074#1086#1076#1072' '#1074#1088#1091#1095#1085#1091#1102'.'
          '7. '#1042#1099#1089#1090#1072#1074#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1080' '#1082#1086#1085#1094#1072' '#1088#1072#1073#1086#1090#1099'.'
          '8. '#1053#1072#1078#1072#1090#1100' "'#1057#1058#1040#1056#1058' '#1094#1080#1082#1083' '#1074#1074#1086#1076#1072'".'
          
            '9. '#1057#1083#1077#1076#1080#1090#1100' '#1095#1090#1086#1073#1099' "'#1092#1086#1082#1091#1089'" '#1085#1077' '#1089#1084#1077#1089#1090#1080#1083#1089#1103' '#1089' '#1085#1091#1078#1085#1086#1075#1086' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' ('#1076#1088#1091#1075 +
            #1086#1081' '#1088#1072#1073#1086#1090#1086#1081' '#1085#1072' '#1055#1050' '#1079#1072#1085#1080#1084#1072#1090#1100#1089#1103' '#1073#1091#1076#1077#1090' '#1085#1077#1083#1100#1079#1103'!'
          '10. '#1055#1088#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1085#1072#1078#1072#1090#1100' "'#1057#1058#1054#1055'! '#1094#1080#1082#1083' '#1074#1074#1086#1076#1072'".'
          ''
          
            #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1086#1073#1093#1086#1076#1072' '#1089#1083#1077#1078#1077#1085#1080#1103' '#1079#1072' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100#1102' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1085#1072' ' +
            #1091#1076#1072#1083#1077#1085#1085#1086#1084' '#1055#1050' ('#1080#1084#1080#1090#1072#1094#1080#1103' '#1073#1091#1088#1085#1086#1081' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080'):'
          
            #1083#1080#1095#1085#1099#1081' ('#1076#1086#1084#1072#1096#1085#1080#1081'! '#1085#1077' '#1076#1086#1084#1077#1085#1085#1099#1081'!) '#1055#1050' -> RDP '#1085#1072' '#1076#1086#1084#1077#1085#1085#1099#1081' '#1073#1080#1079#1085#1077#1089'_'#1055#1050' ' +
            '- ('#1086#1087#1094#1080#1086#1085#1072#1083#1100#1085#1086') '#1057#1087#1077#1094'.'#1089#1077#1090#1100' ('#1084#1086#1078#1085#1086' '#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1088#1072#1079#1091' '#1090#1091#1076#1072'). '#1055#1054' '#1088#1072#1073#1086#1090#1072 +
            #1077#1090' '#1085#1072' '#1083#1080#1095#1085#1086#1084' '#1055#1050'.')
        TabOrder = 10
      end
      object ChBx_period: TCheckBox
        Left = 82
        Top = 144
        Width = 218
        Height = 17
        Caption = #1074#1088#1077#1084#1103' '#1088#1072#1073#1086#1090#1099' '#1079#1072#1076#1072#1090#1100' '#1095#1077#1088#1077#1079' '#1080#1085#1090#1077#1088#1074#1072#1083
        TabOrder = 11
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 333
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
