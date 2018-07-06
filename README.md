# zChinese是什么

中文自然语言支持的开源项目，基于Pascal语言做中文向量化处理的开发包，100%兼容FPC的AnsiChar/UnicodeString机制，100%兼容delphi的Unicode机制

zChinese遵循Apache2.0开源协议

# zChinese的特点
- 中文快速分词（三种快速分词：键值数据库分词，文本数据库分词，词性数据库分词）
- 中文词性分析（词性数据库）
- 中文词汇分类（键值数据库）
- 意志力分析（词性数据库）
- 中文量化分析（词性数据库）
- 中文情感正负向分析（词性数据库）
- 中文回馈正负向分析（词性数据库）
- 繁体支持（GBK数据库）
- 简体支持（GBK数据库）
- 香港体支持（GBK数据库）
- 乱码分析（GBK数据库）
- 外置大规模词典数据库支持（外置词典数据库管理系统）
- 内置小词典数据库

# 运行平台支持 #
- **IOS armv7 - delphi/fpc 100%兼容**
- **IOS arm64 - delphi/fpc 100%兼容**
- **Anroid - delphi/fpc 100%兼容**
- **Windows - delphi/fpc x86/100%兼容**
- **Windows - delphi/fpc x64/100%兼容**
- **Linux - delphi/fpc x64/100%兼容**
- **OSX - delphi/fpc x86/100%兼容**
- **Linux - delphi x86/不兼容 - fpc x86/100%兼容**
- **OSX - delphi x64/不兼容 - fpc x64/100兼容**

# 开发平台支持 #
- Freepascal with Lazarus
- Delphi XE10 或以上版本

**特别提醒**
- 基于zChinese的所有文本数据库均为UTF8 no bom编码，zChiense也能支持非UTF8编码，比如windows默认的中文ucs2和ascii
- 基于FPC编译器使用zChinese时因为FPC的RT库默认为ansi字符处理机制，需要使用TUPascalString来处理Unicode的中文字符串
- 已在zChinese内部做了FPC支持：fpc使用zChinese的原理是传递字符到zChinese函数时强制转换成UnicodeString字符串，待处理完成后，再转换成FPC的内核字符串处理机制
- fpc在保存和读取基于zChinese的文本数据库时，均能支持UTF8
- 因为delphi和fpc内核的字符串链表到百万级数量以后问题很多，zChinese内置了一套大字符串链表系统
- delphi平台可以在手机以最小开销载入和使用
- delphi平台请选用XE10以上版本，无需做Unicode支持

# 数据下载

词库，词典，机器人，分类词汇等相关数据需要额外下载

https://github.com/PassByYou888/zChinese/releases

# 使用演示
```delphi

// 在程序启动时，如OnShow or OnCreate里面，使用LoadAndMergeDict读取外部词库
// 假如目录不存在，zChinese会自动创建词库目录
// 假如你有一定数量的词库，那么，将需要使用的词库以对应格式copy到词库路径即会生效
// LoadAndMergeDict在GBKMediaCenter.pas库中

LoadAndMergeDict(词库路径);

// 接下来，使用下列罗列的API即可
```

# API
```delphi
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

```

## 更新日志

**2018-7-6**

- 全面支持Linux(fpc方向)
- 大幅修正底层库的命名规则
- 全面支持Linux桌面级的机器学习应用程序开发
- 对fpc编译器3.1.1全面支持
- 新增大小字节序支持
- 修复对32位fpc编译器不认for用Int64的问题
- 修复字符串在fpc编译器运行于linux发生异常的问题
- 分别新增Delphi和lazarus两个平台的Demo，可以运行于所有操作系统


**2018-4-22**
- 更新内置中文小字典





----------


使用问题请加在互助qq群490269542
 
请不要直接加作者，谢谢大家

2018-4

