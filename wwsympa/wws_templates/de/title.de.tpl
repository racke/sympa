<!-- RCS Identication ; $Revision$ ; $Date$ -->

<!-- begin title.de.tpl -->
<!-- <TABLE WIDTH="100%" BORDER=0 cellpadding=2 cellspacing=0><TR><TD>-->
<TABLE WIDTH="100%" BORDER="0" BGCOLOR="--DARK_COLOR--" cellpadding="2" cellspacing="0">
  <TR VALIGN="bottom">
  <TD ALIGN="left" NOWRAP>
       <FONT size="-1" COLOR="--BG_COLOR--">
         [IF user->email]
          <b>[user->email]</b>
         <CENTER>
 	 [IF is_listmaster]
	  Listmaster
	 [ELSIF is_privileged_owner]
          Priv. Besitzer
	 [ELSIF is_owner]
          Besitzer
         [ELSIF is_editor]
          Moderator
         [ELSIF is_subscriber]
	  Abonnent
	 [ENDIF]
	  </CENTER>
	 [ENDIF]
	</FONT>
   </TD>
   <TD ALIGN=center WIDTH="100%">
       <TABLE width=100% cellpadding=0>
          <TR><TD BGCOLOR="--SELECTED_COLOR--" NOWRAP align=center>
	    <FONT COLOR="--BG_COLOR--" SIZE="+2"><B>[title]</B></FONT>
	     <BR><FONT COLOR="--BG_COLOR--">[subtitle]</FONT>
            </TD>
           </TR>
        </TABLE>
   </TD>
   </TR>
</TABLE>
<!--  </TD></TR></TABLE> -->
<!-- end title.de.tpl -->












