[Ivy]
1785DC7E48EF19AD 7.5.0 #module
>Proto >Proto Collection #zClass
Ms0 MenuLeftBarProcess Big #zClass
Ms0 RD #cInfo
Ms0 #process
Ms0 @TextInP .type .type #zField
Ms0 @TextInP .processKind .processKind #zField
Ms0 @TextInP .xml .xml #zField
Ms0 @TextInP .responsibility .responsibility #zField
Ms0 @UdInit f0 '' #zField
Ms0 @UdProcessEnd f1 '' #zField
Ms0 @UdEvent f3 '' #zField
Ms0 @UdExitEnd f4 '' #zField
Ms0 @PushWFArc f5 '' #zField
Ms0 @PushWFArc f2 '' #zField
>Proto Ms0 Ms0 MenuLeftBarProcess #zField
Ms0 f0 guid 1785DC7E49712011 #txt
Ms0 f0 method start() #txt
Ms0 f0 inParameterDecl '<> param;' #txt
Ms0 f0 outParameterDecl '<> result;' #txt
Ms0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ms0 f0 99 51 26 26 -16 15 #rect
Ms0 f0 @|UdInitIcon #fIcon
Ms0 f1 379 51 26 26 0 12 #rect
Ms0 f1 @|UdProcessEndIcon #fIcon
Ms0 f3 guid 1785DC7E4A25E6D8 #txt
Ms0 f3 actionTable 'out=in;
' #txt
Ms0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ms0 f3 99 307 26 26 -15 15 #rect
Ms0 f3 @|UdEventIcon #fIcon
Ms0 f4 371 307 26 26 0 12 #rect
Ms0 f4 @|UdExitEndIcon #fIcon
Ms0 f5 125 320 371 320 #arcP
Ms0 f2 125 64 379 64 #arcP
>Proto Ms0 .type tes.connection.components.MenuLeftBar.MenuLeftBarData #txt
>Proto Ms0 .processKind HTML_DIALOG #txt
>Proto Ms0 -8 -8 16 16 16 26 #rect
>Proto Ms0 '' #fIcon
Ms0 f3 mainOut f5 tail #connect
Ms0 f5 head f4 mainIn #connect
Ms0 f0 mainOut f2 tail #connect
Ms0 f2 head f1 mainIn #connect
