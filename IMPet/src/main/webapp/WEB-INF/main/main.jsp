<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>


<html lang="ko">
<head>

	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<tiles:insertAttribute name="header" />

<tiles:insertAttribute name="body" />	

<tiles:insertAttribute name="footer" />

</body>
</html>