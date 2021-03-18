[Ivy]
17839F9B6842F514 7.5.0 #module
>Proto >Proto Collection #zClass
Cs0 CategoryProcess Big #zClass
Cs0 RD #cInfo
Cs0 #process
Cs0 @TextInP .type .type #zField
Cs0 @TextInP .processKind .processKind #zField
Cs0 @TextInP .xml .xml #zField
Cs0 @TextInP .responsibility .responsibility #zField
Cs0 @UdInit f0 '' #zField
Cs0 @UdProcessEnd f1 '' #zField
Cs0 @UdEvent f3 '' #zField
Cs0 @UdExitEnd f4 '' #zField
Cs0 @PushWFArc f5 '' #zField
Cs0 @UdEvent f6 '' #zField
Cs0 @UdExitEnd f7 '' #zField
Cs0 @GridStep f8 '' #zField
Cs0 @PushWFArc f9 '' #zField
Cs0 @PushWFArc f10 '' #zField
Cs0 @GridStep f11 '' #zField
Cs0 @PushWFArc f12 '' #zField
Cs0 @PushWFArc f2 '' #zField
>Proto Cs0 Cs0 CategoryProcess #zField
Cs0 f0 guid 17839F9B6892E757 #txt
Cs0 f0 method start() #txt
Cs0 f0 inParameterDecl '<> param;' #txt
Cs0 f0 outParameterDecl '<> result;' #txt
Cs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Cs0 f0 67 51 26 26 -16 15 #rect
Cs0 f0 @|UdInitIcon #fIcon
Cs0 f1 355 51 26 26 0 12 #rect
Cs0 f1 @|UdProcessEndIcon #fIcon
Cs0 f3 guid 17839F9B68EF5C85 #txt
Cs0 f3 actionTable 'out=in;
' #txt
Cs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Cs0 f3 67 643 26 26 -15 15 #rect
Cs0 f3 @|UdEventIcon #fIcon
Cs0 f4 451 643 26 26 0 12 #rect
Cs0 f4 @|UdExitEndIcon #fIcon
Cs0 f5 93 656 451 656 #arcP
Cs0 f6 guid 17839FCCEA5DDE92 #txt
Cs0 f6 actionTable 'out=in;
' #txt
Cs0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>save</name>
    </language>
</elementInfo>
' #txt
Cs0 f6 67 259 26 26 -14 15 #rect
Cs0 f6 @|UdEventIcon #fIcon
Cs0 f7 467 259 26 26 0 12 #rect
Cs0 f7 @|UdExitEndIcon #fIcon
Cs0 f8 actionTable 'out=in;
' #txt
Cs0 f8 actionCode 'import model.Category;
import service.CategoryService;

CategoryService categoryService = new CategoryService();

categoryService.saveEntity(in.category);' #txt
Cs0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Save Category</name>
    </language>
</elementInfo>
' #txt
Cs0 f8 136 250 112 44 -39 -8 #rect
Cs0 f8 @|StepIcon #fIcon
Cs0 f9 93 272 136 272 #arcP
Cs0 f10 248 272 467 272 #arcP
Cs0 f11 actionTable 'out=in;
' #txt
Cs0 f11 actionCode 'import model.Category;
in.category = new Category();' #txt
Cs0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>initial</name>
    </language>
</elementInfo>
' #txt
Cs0 f11 152 42 112 44 -14 -8 #rect
Cs0 f11 @|StepIcon #fIcon
Cs0 f12 93 64 152 64 #arcP
Cs0 f2 264 64 355 64 #arcP
>Proto Cs0 .type test.connection.Category.CategoryData #txt
>Proto Cs0 .processKind HTML_DIALOG #txt
>Proto Cs0 -8 -8 16 16 16 26 #rect
>Proto Cs0 '' #fIcon
Cs0 f3 mainOut f5 tail #connect
Cs0 f5 head f4 mainIn #connect
Cs0 f6 mainOut f9 tail #connect
Cs0 f9 head f8 mainIn #connect
Cs0 f8 mainOut f10 tail #connect
Cs0 f10 head f7 mainIn #connect
Cs0 f0 mainOut f12 tail #connect
Cs0 f12 head f11 mainIn #connect
Cs0 f11 mainOut f2 tail #connect
Cs0 f2 head f1 mainIn #connect
