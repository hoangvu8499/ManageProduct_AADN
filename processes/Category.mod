[Ivy]
1783A18C7D0AA49E 7.5.0 #module
>Proto >Proto Collection #zClass
Cy0 Category Big #zClass
Cy0 B #cInfo
Cy0 #process
Cy0 @TextInP .type .type #zField
Cy0 @TextInP .processKind .processKind #zField
Cy0 @TextInP .xml .xml #zField
Cy0 @TextInP .responsibility .responsibility #zField
Cy0 @StartRequest f0 '' #zField
Cy0 @EndTask f1 '' #zField
Cy0 @UserDialog f3 '' #zField
Cy0 @PushWFArc f4 '' #zField
Cy0 @PushWFArc f2 '' #zField
>Proto Cy0 Cy0 Category #zField
Cy0 f0 outLink start.ivp #txt
Cy0 f0 inParamDecl '<> param;' #txt
Cy0 f0 requestEnabled true #txt
Cy0 f0 triggerEnabled false #txt
Cy0 f0 callSignature start() #txt
Cy0 f0 caseData businessCase.attach=true #txt
Cy0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
Cy0 f0 @C|.responsibility Everybody #txt
Cy0 f0 81 49 30 30 -21 17 #rect
Cy0 f0 @|StartRequestIcon #fIcon
Cy0 f1 337 49 30 30 0 15 #rect
Cy0 f1 @|EndIcon #fIcon
Cy0 f3 dialogId test.connection.Category #txt
Cy0 f3 startMethod start() #txt
Cy0 f3 requestActionDecl '<> param;' #txt
Cy0 f3 responseMappingAction 'out=in;
' #txt
Cy0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Category</name>
    </language>
</elementInfo>
' #txt
Cy0 f3 168 42 112 44 -24 -8 #rect
Cy0 f3 @|UserDialogIcon #fIcon
Cy0 f4 111 64 168 64 #arcP
Cy0 f2 280 64 337 64 #arcP
>Proto Cy0 .type test.connection.CategoryData #txt
>Proto Cy0 .processKind NORMAL #txt
>Proto Cy0 0 0 32 24 18 0 #rect
>Proto Cy0 @|BIcon #fIcon
Cy0 f0 mainOut f4 tail #connect
Cy0 f4 head f3 mainIn #connect
Cy0 f3 mainOut f2 tail #connect
Cy0 f2 head f1 mainIn #connect
