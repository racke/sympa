<!-- RCS Identication ; $Revision$ ; $Date$ -->

[IF action=search_list]
  [occurrence] Vorkommen gefunden<BR><BR>
[ELSIF action=search_user]
  <B>[email]</B> hat folgende Mailing-Listen abonniert:
[ENDIF]

<TABLE BORDER="0" WIDTH="100%">
   [FOREACH l IN which]
     <TR>
     [IF l->admin]
       <TD BGCOLOR="--DARK_COLOR--">
          <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="1">
           <TR><TD BGCOLOR="--LIGHT_COLOR--" ALIGN="center" VALIGN="top">
             <FONT COLOR="--SELECTED_COLOR--" SIZE="-1">
              <A HREF="[base_url][path_cgi]/admin/[l->NAME]" ><b>Admin</b></A>
         </FONT>
       </TD>
     </TR>
 </TABLE>
</TD>
     [ELSE]
       <TD>&nbsp;</TD>
     [ENDIF] 
     <TD WIDTH="100%" ROWSPAN="2">
     <A HREF="[path_cgi]/info/[l->NAME]" ><B>[l->NAME]@[l->host]</B></A>
     <BR>
     [l->subject]
     </TD></TR>
     <TR><TD>&nbsp;</TD></TR>
   [END]
</TABLE>
