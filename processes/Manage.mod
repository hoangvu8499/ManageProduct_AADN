[Ivy]
1783A9970C9279D8 7.5.0 #module
>Proto >Proto Collection #zClass
Pt0 Manage Big #zClass
Pt0 B #cInfo
Pt0 #process
Pt0 @TextInP .type .type #zField
Pt0 @TextInP .processKind .processKind #zField
Pt0 @TextInP .xml .xml #zField
Pt0 @TextInP .responsibility .responsibility #zField
Pt0 @StartRequest f0 '' #zField
Pt0 @EndTask f1 '' #zField
Pt0 @UserDialog f3 '' #zField
Pt0 @PushWFArc f4 '' #zField
Pt0 @PushWFArc f2 '' #zField
Pt0 @StartRequest f5 '' #zField
Pt0 @UserDialog f6 '' #zField
Pt0 @EndTask f7 '' #zField
Pt0 @PushWFArc f8 '' #zField
Pt0 @PushWFArc f9 '' #zField
>Proto Pt0 Pt0 Manage #zField
Pt0 f0 outLink productManage.ivp #txt
Pt0 f0 inParamDecl '<> param;' #txt
Pt0 f0 requestEnabled true #txt
Pt0 f0 triggerEnabled false #txt
Pt0 f0 callSignature productManage() #txt
Pt0 f0 caseData businessCase.attach=true #txt
Pt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ProductManage</name>
    </language>
</elementInfo>
' #txt
Pt0 f0 @C|.responsibility Everybody #txt
Pt0 f0 49 81 30 30 -39 17 #rect
Pt0 f0 @|StartRequestIcon #fIcon
Pt0 f1 521 81 30 30 0 15 #rect
Pt0 f1 @|EndIcon #fIcon
Pt0 f3 dialogId test.connection.Product #txt
Pt0 f3 startMethod start() #txt
Pt0 f3 requestActionDecl '<> param;' #txt
Pt0 f3 responseMappingAction 'out=in;
' #txt
Pt0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Product</name>
    </language>
</elementInfo>
' #txt
Pt0 f3 232 74 112 44 -21 -8 #rect
Pt0 f3 @|UserDialogIcon #fIcon
Pt0 f4 79 96 232 96 #arcP
Pt0 f2 344 96 521 96 #arcP
Pt0 f5 outLink productDeleted.ivp #txt
Pt0 f5 inParamDecl '<> param;' #txt
Pt0 f5 requestEnabled true #txt
Pt0 f5 triggerEnabled false #txt
Pt0 f5 callSignature productDeleted() #txt
Pt0 f5 caseData businessCase.attach=true #txt
Pt0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ProductDeleted</name>
    </language>
</elementInfo>
' #txt
Pt0 f5 @C|.responsibility Everybody #txt
Pt0 f5 49 209 30 30 -43 19 #rect
Pt0 f5 @|StartRequestIcon #fIcon
Pt0 f6 dialogId test.connection.ProductDeleted #txt
Pt0 f6 startMethod start() #txt
Pt0 f6 requestActionDecl '<> param;' #txt
Pt0 f6 responseMappingAction 'out=in;
' #txt
Pt0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ProductDeleted</name>
    </language>
</elementInfo>
' #txt
Pt0 f6 232 202 112 44 -42 -8 #rect
Pt0 f6 @|UserDialogIcon #fIcon
Pt0 f7 529 209 30 30 0 15 #rect
Pt0 f7 @|EndIcon #fIcon
Pt0 f8 79 224 232 224 #arcP
Pt0 f9 344 224 529 224 #arcP
>Proto Pt0 .type test.connection.ProductData #txt
>Proto Pt0 .processKind NORMAL #txt
>Proto Pt0 0 0 32 24 18 0 #rect
>Proto Pt0 @|BIcon #fIcon
Pt0 f0 mainOut f4 tail #connect
Pt0 f4 head f3 mainIn #connect
Pt0 f3 mainOut f2 tail #connect
Pt0 f2 head f1 mainIn #connect
Pt0 f5 mainOut f8 tail #connect
Pt0 f8 head f6 mainIn #connect
Pt0 f6 mainOut f9 tail #connect
Pt0 f9 head f7 mainIn #connect
