object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=pos'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object Qtemp: TFDQuery
    Connection = FDConnection1
    Left = 144
    Top = 80
  end
  object Qtemp1: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 48
  end
end
