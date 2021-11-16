<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
if (session.getAttribute("memberInfo") != null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 접근하셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
}

Calendar today = Calendar.getInstance();
int year = today.get(Calendar.YEAR);      // 올해 연도
int month = today.get(Calendar.MONTH) + 1;   // 현재 월
int day = today.get(Calendar.DATE);         // 오늘 일

String[] arrDomain = {"naver.com", "nate.com", "gmail.com", "daum.net", "yahoo.com"};

request.setCharacterEncoding("utf-8");
String url = request.getParameter("url");
if (url == null)	url = "";
// 로그인 후 이동할 페이지 주소로, 이동할 페이지 주소가 없는 경우 빈 문자열로 지정	=> 여기에서 쓸 값이 아니기 때문에 로그인 처리할 곳으로 값을 보내야 하는데 url = ""안 하면 NULL 찍힘 	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#agreement { width:700px; height:100px; overflow:auto; }
#join_form { width:700px; }
</style>
<script>
function setDomian(domain) {
   var e3 = document.frmJoin.e3;
   if (domain != "" && domain != "direct") {
      e3.value = domain;
   } else {
      e3.value = "";
      if (domain == "direct") e3.focus();
   }
}
</script>
</head>
<body>
<h2>프로젝트 회원 가입 폼</h2>
<form name="frmJoin" action="joinProc.jsp" method="post">
<div id="agreement">
약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />
약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />약관 내용<br />
</div>
<input type="radio" name="agree" value="y" id="agreeY" /><label for="agreeY">동의함</label>
<input type="radio" name="agree" value="n" id="agreeN" checked="checked" /><label for="agreeN">동의 안함</label>
<br /><hr /><br />
<div id="join_form">
<label for="mi_id">아이디</label> : <input type="text" name="mi_id" id="mi_id" />
<br />
<label for="mi_pw">비밀번호</label> : <input type="password" name="mi_pw" id="mi_pw" />
<br />
<label for="mi_name">이름</label> : <input type="text" name="mi_name" id="mi_name" />
<br />
성별 : <input type="radio" name="mi_gender" value="m" id="genderM" /><label for="genderM">남자</label>
<input type="radio" name="mi_gender" value="f" id="genderF" checked="checked" /><label for="genderF">여자</label>
<br />
생년월일 :
   <select name="by">	<!-- 년 -->
<% for (int i = 1950; i <= year; i++) { %>
      <option value="<%=i %>" <% if (i == year) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
   </select>년
   <select name="bm">	<!-- 월 -->
<% for (int i = 1; i <= 12; i++) { %>
      <option value="<%=i %>" <% if (i == month) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
   </select>월
   <select name="bd">	<!-- 일 -->
<% for (int i = 1; i <= 31; i++) { %>
      <option value="<%=i %>" <% if (i == day) { %>selected="selected"<% } %>><%=i %></option>
<% } %>
   </select>일
<br />
휴대폰 :
   <select name="p1">
      <option value="010">010</option>
      <option value="011">011</option>
      <option value="016">016</option>
      <option value="019">019</option>
   </select> -
   <input type="text" name="p2" size="4" maxlength="4" /> -
   <input type="text" name="p3" size="4" maxlength="4" />
<br />
이메일 :
   <input type="text" name="e1" size="10" /> @
   <select name="e2" onchange="setDomian(this.value);">
      <option value=""> 도메인 선택 </option>
<% for (int i = 0; i < arrDomain.length; i++) { %>
      <option value="<%=arrDomain[i] %>"><%=arrDomain[i] %></option>
<% } %>
      <option value="direct"> 직접 입력</option>
   </select>
   <input type="text" name="e3" size="10" />
<br />
광고 수신 :
<input type="radio" name="mi_isad" value="y" id="adY" checked="checked" /><label for="adY">수신</label>
<input type="radio" name="mi_isad" value="n" id="adN" /><label for="adN">미수신</label>
<hr />
우편번호 : <input type="text" name="ma_zip" size="5" maxlength="5" />
<br />
주소1 : <input type="text" name="ma_addr1" />
<br />
주소2 : <input type="text" name="ma_addr2" />
<br /><br />
<input type="submit" value="회원 가입" />
</div>
</form>