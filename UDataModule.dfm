object DM: TDM
  OldCreateOrder = False
  Height = 414
  Width = 632
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'db_pos'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 80
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 88
    Top = 208
  end
  object Qtemp: TUniQuery
    Connection = UniConnection1
    Left = 88
    Top = 136
  end
end
