program delphiDemo;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils,
  FastGBK, GBK, GBKBig, GBKMediaCenter, GBKVec, DoStatusIO, PascalStrings, UPascalStrings, UnicodeMixedLib;

procedure Test;
begin
  // 键值词典分词，返回分词字符串，支持库：GBKBig.pas
  DoStatus('键值词典分词：' + BigKeyWord('中文自然语言支持的开源项目，它是中文化处理的地基库', True));

  // 文本词典分词，返回分词字符串，支持库：GBKBig.pas
  DoStatus('文本词典分词：' + BigWord('中文自然语言支持的开源项目，它是中文化处理的地基库', True));

  // 词性分词，返回分词字符串，支持库：GBKVec.pas
  DoStatus('词性分词：' + WordPart('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 词性分词+分析，返回字符串，支持库：GBKVec.pas
  DoStatus('词性分词+分析：' + WordPartN('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 意志力分析，返回数值，支持库：GBKVec.pas
  DoStatus('意志力分析：%d', [WillVec('中文自然语言支持的开源项目，感觉它是中文化处理的地基库')]);

  // 中文量化分析，返回数值，支持库：GBKVec.pas
  DoStatus('中文量化分析：%d', [WordVec('中文自然语言支持的开源项目，有一点要说明，它是中文化处理的地基库')]);

  // 情感正负面分析，返回数值，支持库：GBKVec.pas
  DoStatus('情感负面分析：%d', [BadEmotion('中文自然语言支持的开源项目，它是中文化处理的地基库，可是我现在心情不太好，让我冷静一下再说')]);
  DoStatus('情感正面分析：%d', [GoodEmotion('中文自然语言支持的开源项目，它是中文化处理的地基库')]);

  // 回馈正负面分析，返回数值，支持库：GBKVec.pas
  DoStatus('回馈负面分析:%d', [BadRep('中文自然语言支持的开源项目，它是中文化处理的地基库，我心情不好，什么都感觉很差')]);
  DoStatus('回馈正面分析:%d', [GoodRep('中文自然语言支持的开源项目，它是中文化处理的地基库')]);

  // GBK中文字符串自动化修复，自动修正繁体编码为简体，自动修正全角符号为半角，支持库：GBK.pas
  DoStatus('GBK中文字符串自动化修复：' + GBKString('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 自动逆向拼音编码，自动返回带音标的字符串结果，自动区分多音字，支持库：GBK.pas
  DoStatus('自动逆向拼音编码：' + PY('中文自然语言支持的开源项目，它是中文化处理的地基库', True));
  DoStatus('自动逆向拼音编码：' + PY('中文自然语言支持的开源项目，它是中文化处理的地基库', False));

  // 简体转繁体，非纯编码转换，会自动生成繁体词组，支持库：GBK.pas
  DoStatus('简体转繁体：' + S2T('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 简体转香港繁体，非纯编码转换，会自动生成香港繁体词组，支持库：GBK.pas
  DoStatus('简体转香港繁体：' + S2HK('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 简体转台湾繁体，非纯编码转换，会自动生成台湾繁体词组，支持库：GBK.pas
  DoStatus('简体转台湾繁体：' + S2TW('中文自然语言支持的开源项目，它是中文化处理的地基库'));

  // 繁体转简体，非纯编码转换，会自动分析词组，如：网际互联网->互联网，支持库：GBK.pas
  DoStatus('繁体转简体：' + T2S('中文自然语言支持的开源项目，它是中文化处理的地基库'));
end;

begin
  // 读取外部词库
  LoadAndMergeDict(umlCurrentPath);
  Test;
  DoStatus('回车键退出');
  readln;
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
  end;

end.
