[Ivy]
1785D00EEF545131 7.5.0 #module
>Proto >Proto Collection #zClass
He0 HomePage Big #zClass
He0 B #cInfo
He0 #process
He0 @TextInP .type .type #zField
He0 @TextInP .processKind .processKind #zField
He0 @TextInP .xml .xml #zField
He0 @TextInP .responsibility .responsibility #zField
He0 @StartRequest f0 '' #zField
He0 @EndTask f1 '' #zField
He0 @UserDialog f2 '' #zField
He0 @PushWFArc f4 '' #zField
He0 @GridStep f5 '' #zField
He0 @PushWFArc f6 '' #zField
He0 @PushWFArc f3 '' #zField
>Proto He0 He0 HomePage #zField
He0 f0 outLink homePage.ivp #txt
He0 f0 inParamDecl '<> param;' #txt
He0 f0 requestEnabled true #txt
He0 f0 triggerEnabled false #txt
He0 f0 callSignature homePage() #txt
He0 f0 caseData businessCase.attach=true #txt
He0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>HomePage</name>
    </language>
</elementInfo>
' #txt
He0 f0 @C|.responsibility Everybody #txt
He0 f0 81 49 30 30 -21 17 #rect
He0 f0 @|StartRequestIcon #fIcon
He0 f1 561 49 30 30 0 15 #rect
He0 f1 @|EndIcon #fIcon
He0 f2 dialogId test.connection.HomePage #txt
He0 f2 startMethod start() #txt
He0 f2 requestActionDecl '<> param;' #txt
He0 f2 responseMappingAction 'out=in;
' #txt
He0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>HomePage</name>
    </language>
</elementInfo>
' #txt
He0 f2 368 42 112 44 -31 -8 #rect
He0 f2 @|UserDialogIcon #fIcon
He0 f4 480 64 561 64 #arcP
He0 f5 actionTable 'out=in;
' #txt
He0 f5 actionCode 'import dao.CategoryDao;
CategoryDao categoryDao = new dao.CategoryDao();

in.listCategory = categoryDao.getAll();' #txt
He0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getListCategory</name>
    </language>
</elementInfo>
' #txt
He0 f5 192 42 112 44 -43 -8 #rect
He0 f5 @|StepIcon #fIcon
He0 f6 111 64 192 64 #arcP
He0 f3 304 64 368 64 #arcP
>Proto He0 .type test.connection.HomePageData #txt
>Proto He0 .processKind NORMAL #txt
>Proto He0 0 0 32 24 18 0 #rect
>Proto He0 @|BIcon #fIcon
He0 f2 mainOut f4 tail #connect
He0 f4 head f1 mainIn #connect
He0 f0 mainOut f6 tail #connect
He0 f6 head f5 mainIn #connect
He0 f5 mainOut f3 tail #connect
He0 f3 head f2 mainIn #connect
