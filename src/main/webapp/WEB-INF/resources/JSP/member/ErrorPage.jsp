<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//這個頁面進行編譯時,還沒取得參數,所以去比較的話inserFail的值會是null,用null.equals()會報錯
//所以要先寫if(request.getAttribute("insertFSail")==null){}讓編譯時有if可進入
if(request.getSession(false).getAttribute("m_insertFail")==null){
}else if(request.getSession(false).getAttribute("m_insertFail").equals("新增資料時發生錯誤,請依規定格式輸入資料")){
%>
<h1>新增資料時發生錯誤,請依規定格式輸入資料</h1>
<%
//把session屬性關掉才不會新增和更新的錯誤提示才不會同時出現
request.getSession(false).removeAttribute("m_insertFail");
}
%>
<%
//這個頁面進行編譯時,還沒取得參數,所以去比較的話updateFail的值會是null,用null.equals()會報錯
//所以要先寫if(request.getAttribute("updateFail")==null){}讓編譯時有if可進入
if(request.getSession(false).getAttribute("m_updateFail")==null){
}else if(request.getSession(false).getAttribute("m_updateFail").equals("更新資料時發生錯誤,請依規定格式輸入資料")){
%>
<h1>更新資料時發生錯誤,請依規定格式輸入資料</h1>
<%
request.getSession(false).removeAttribute("m_updateFail");
}
%>

<%
//點擊即導回會員管理頁面
%>
<a href="/HouseShip/member">點擊返回會員管理頁面</a>

</body>
</html>