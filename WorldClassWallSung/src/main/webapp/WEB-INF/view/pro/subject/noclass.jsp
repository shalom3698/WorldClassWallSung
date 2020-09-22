<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>휴강 신청</title>
<style>
.form-control {
   width: auto;;
}


.table {
   width:700px;
}
	html {
		background: url(images/bg.jpg) no-repeat 50% 50% fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}

	.container {
	    width: auto;
	    max-width: 1140px;
	}
	
	.table td, .table th {
	    padding: .30rem;
	}
	.btn-file {
            position: relative;
            overflow: hidden;
        }

    /*     .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity = 0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        } */
        .btn-primary {
            background-color : blue;
            border-color: red;
        }
        .btn {
       		height: 25px;
       		width: 80px;
       		vertical-align: bottom;
       		padding: .0rem .75rem;
       		font-size: 13px;
       	}
       	.col-md-6 {
		    max-width: none;
		}
		.btn-dark:focus {
			color: #fff;
		    background-color: #343a40;
		    border-color: #343a40;
		}
</style>
</head>
<body>
<script>
		function selectSub_tag() {
			var sub_nm = $("#sub_tag").val();
			//alert("sub_nm::"+sub_nm);
			var url = "noclass.do";
			var params = "sub_nm=" + sub_nm;
			console.log(sub_nm);
			$.ajax({
				type : "post",
				url : url,
				data : params,
				dataType : "json"
			}).done(function(args) {
				var sub_cd = args.sub_cd;
				var sub_nm = args.sub_nm;				
				$("#sub_cd").text("");
				$("#sub_cd").val(sub_cd);			 	
				$("#sub_nm").text("");
				$("#sub_nm").val(sub_nm); 
			});
		}


		function checkIt(){
			var a = $("#can_dt").val()
			
			if (!a){	                  
				alert("휴강을 원하는 날짜를 입력해주세요.");		
				return false;
			}
	}
</script>
	<select name="sub_tag" id="sub_tag" onchange="selectSub_tag()">
			<option value="">::개설과목::</option>
		<c:forEach var="item" items="${list}">
			<option value="${item}">${item}</option>
		</c:forEach>
	</select>
	<br>
	<form action="insert.do" onsubmit="return checkIt()">
	<br>강의코드 :<input type="text" name="sub_cd" id="sub_cd" style="margin-left:3.6px;">&nbsp;&nbsp;교수명 :<input type="text" style="margin-left:3.6px;  width:158.3px;" name="prof_nm" value="${login.prof_nm}">
	<br> &nbsp;&nbsp;강의명 :<input style="margin-left:10px;" type="text" name="sub_nm" id="sub_nm">&nbsp;&nbsp;날짜선택  :<input	type="date" style="margin-left:3.6px;" name="can_dt" id="can_dt"><br><br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;휴강 사유 <br>
	&emsp;&emsp;&emsp;&emsp;&emsp;<textarea style="width: 350px; height: 100px;" name="can_iu" id="can_iu"></textarea>
	<br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<input type="submit"class='btn btn-dark' value="휴강신청">
	</form>
</body>
</html>
