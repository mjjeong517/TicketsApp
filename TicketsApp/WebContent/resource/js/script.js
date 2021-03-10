/**
 * 
 */

function chkLogin(){
	var frm = document.getElementById("loginFrm");
	frm.action="Login_proc.jsp";
	frm.submit();
}

function ModiFunc(){
	var frm = document.getElementById("TkFrm");
		frm.action="TicketModiForm.jsp";
		frm.submit();
}

function MemDel() {
	var delID = document.MemFrm.rsuserid.value;
	aa = window.open("MemDel.jsp?delID="+delID);
}

